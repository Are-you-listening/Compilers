from src.llvm_target.OutputLLVMGenerator import *
from src.parser.Tables.SymbolTypeStruct import *
from src.llvm_target.MapTable import *
from src.parser.CodeGetter import *
from llvmlite import ir
from src.parser.AST import ASTNodeBlock, ASTNodeTypes
from src.internal_tools import PreConditions


class AST2LLVM(ASTVisitor):
    def __init__(self, codegetter: CodeGetter, fileName, comments):
        self.map_table = MapTable(None)
        self.codegetter = codegetter
        self.comments = comments
        self.llvm_map = {}
        self.fileName = fileName
        self.root = None
        self.last_vertex = None
        self.branch_needed = set()
        self.special_func_calls = {"malloc", "calloc", "free", "realloc", "fgets", "fopen", "fputs", "fclose"}

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.llvm_map = {}
        self.branch_needed = set()

        self.root = ast.root
        self.postorder(self.root)

        """
        All the blocks that need a branch will be put in branch_needed
        Their latest instruction will decide the branch, for a conditional branch.
        In case of an unconditional, it will just create a branch
        """
        for b in self.branch_needed:
            b.create_branch()

    def postorder(self, root: ASTNode):
        """
        override default postorder
        """

        """
        store function on last function position
        """

        stack = [root]
        visited = set()
        while len(stack) > 0:
            current_node = stack[-1]  # get top of stack without popping it

            if current_node.text == "Function" and current_node not in visited:
                visited.add(current_node)

                self.handleFunction(current_node)
                self.map_table = MapTable(self.map_table)
                function = LLVMSingleton.getInstance().getFunction(current_node.getChild(0).text)
                LLVMSingleton.getInstance().setLastFunction(function)

            if isinstance(current_node, ASTNodeBlock) and current_node.text == "Block" and current_node not in visited:
                node = current_node

                if node.vertex.llvm is None:
                    node.vertex.llvm = LLVMSingleton.getInstance().addBlock()

                LLVMSingleton.getInstance().setCurrentBlock(node.vertex.llvm)
                self.last_vertex = node.vertex

                self.addOriginalCodeAsComment(current_node)

            child_not_visited = False
            for child in reversed(current_node.getChildren()):
                if child not in visited:
                    stack.append(child)
                    child_not_visited = True
            if not child_not_visited:
                current_node.accept(self)
                stack.pop()

            visited.add(current_node)

    def visitNode(self, node: ASTNode):
        """
        Visit function to construct LLVM
        :param node:
        :return:
        """

        if isinstance(node, ASTNodeBlock) and node.text == "Block":
            if self.last_vertex is not None:
                self.last_vertex.check_flipped()

                """
                When we have instructions for our statement, their is no problem, but IR constants are not considered
                an instruction, so in those cases we need to pass it to the create branch, in case it needs to create 
                a conditional branch
                """

                self.branch_needed.add(self.last_vertex)
            return
        if isinstance(node, ASTNodeBlock) and node.text == "PHI":
            """
            When coming across a PHI, node, we know that we need the LLVM phi
            instruction to continue, so we generate the phi of the last (current) vertex
            """
            phi = self.last_vertex.create_phi()
            self.llvm_map[node] = phi

            return

        if node.text == "Declaration":
            self.handleDeclaration(node)

        if node.text == "Parameters":
            self.handleParameters(node)

        if node.text == "Function":
            self.map_table = self.map_table.prev

        if node.text == "Dereference":
            self.handleDereference(node)

        if node.text == "Assignment":
            self.handleAssignment(node)

        if node.text == "printf":
            self.handlePrintScanf(node, True)

        if node.text == "scanf":
            self.handlePrintScanf(node, False)

        if node.text == "Expr":
            self.handleOperations(node)

        if node.text == "Conversion":
            self.handleConversions(node)

        if node.text == "Return":
            self.handleReturn(node)

        if node.text == "ParameterCalls":
            self.handleParameterCalls(node)

        if node.text == "ParameterCall":
            self.llvm_map[node] = self.llvm_map[node.getChild(0)]

        if node.text not in ("Parameters"):
            self.addOriginalCodeAsComment(node)

        self.handleComment(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            symbol_entry = node.getSymbolTable().getEntry(node.text, node.position.virtual_linenr)
            entry = self.map_table.getEntry(symbol_entry)

            """
            identifiers of declarations and functions are not yet defined
            """
            if entry is None:
                if node.text in self.special_func_calls and LLVMSingleton.getInstance().getFunction(node.text) is None:
                    current_function = LLVMSingleton.getInstance().getLastFunction()
                    """
                    To support declaration of special function calls like 'malloc'
                    """
                    symbol_entry = node.getSymbolTable().getEntry(node.text)
                    function_type = symbol_entry.getTypeObject()
                    args = function_type.getParameterTypes()

                    func = Declaration.function(node.text, function_type.return_type, args)
                    entry = MapEntry(node.text, func)
                    self.map_table.addEntry(entry, symbol_entry)

                    LLVMSingleton.getInstance().setLastFunction(current_function)

                else:
                    if node.parent.text != "Declaration":
                        block = LLVMSingleton.getInstance().getCurrentBlock()
                        d = block.alloca(CTypesToLLVM.getIRType(symbol_entry.getTypeObject()))
                        self.llvm_map[node] = d

                    return

            self.llvm_map[node] = entry.llvm
            #print(entry.llvm)

        if node.type in ("INT", "FLOAT", "CHAR", "BOOL"):
            llvm_var = Declaration.llvmLiteral(node.text, SymbolType(node.type, False))
            self.llvm_map[node] = llvm_var

        if node.type == "STRING":
            llvm_var = string(node.text)
            self.llvm_map[node] = llvm_var

    def handleComment(self, node):
        if node.position is None or node.symbol_table is None or node.symbol_table.isRoot():  # We can't add comments in the global scope of llvm
            return

        curr_line = node.position.linenr
        file = node.position.file
        to_delete = []

        for comment in self.comments.keys():
            if comment[1] < curr_line and file == comment[0]:  # Insert all comments before this line (since some comments might not have code on the same line)
                Declaration.addComment(self.comments[comment])
                to_delete.append(comment)

        for comment in to_delete:
            del self.comments[comment]

    def handleDeclaration(self, node):
        """
        ask the var type, and search its value in the symbol table
        """
        var_child: ASTNode = node.getChild(0)
        entry = var_child.getSymbolTable().getEntry(var_child.text)

        if var_child.symbol_table.isRoot():  # Globals; extra stuff needs to be done
            llvm_var = ir.GlobalVariable(LLVMSingleton.getInstance().getModule(),
                                         CTypesToLLVM.getIRType(entry.getTypeObject()), var_child.text)  # Declare a global variable
            value_node = var_child.getSiblingNeighbour(1)  # Get the value
            if value_node is None:
                value = 0
            else:
                value = value_node.text

            self.get_initializer_value(entry.getTypeObject(), llvm_var, value, value_node)

        else:

            """
            all children of type_child are terminals
            """
            llvm_var = Declaration.declare(entry.getTypeObject(), var_child.text)  # The name is optionally needed for structs
        """
        store var in llvm map
        """
        self.llvm_map[node] = llvm_var
        self.llvm_map[node.getChild(0)] = llvm_var

        """
        add value to map to map var to address register
        """

        self.map_table.addEntry(MapEntry(var_child.text, llvm_var), entry)

        """
        see assignment to declaration as assignment
        """
        if node.getChildAmount() == 2 and not var_child.symbol_table.isRoot():
            self.handleAssignment(node)

    @staticmethod
    def get_initializer_value(entry: SymbolType, llvm_var, value, value_node: ASTNodeTerminal = None):

        if value_node is not None and value_node.text == "InitList":

            array_val = initList(entry, value_node)

            llvm_var.initializer = array_val
            return llvm_var.initializer


        if value_node is not None and isinstance(value_node, ASTNodeTerminal) and value_node.type == "STRING":
            s = string(value)

            s2 = s.gep([ir.Constant(ir.IntType(64), 0), ir.Constant(ir.IntType(64), 0)])

            llvm_var.initializer = s2

            return llvm_var.initializer

        if not isinstance(entry, SymbolTypeArray):
            # Preset some values
            llvm_var.initializer = ir.Constant(CTypesToLLVM.getIRType(entry), value)
            llvm_var.align = CTypesToLLVM.getBytesUse(entry)
        else:
            llvm_var.initializer = ir.Constant(CTypesToLLVM.getIRType(entry),
                                   [AST2LLVM.get_initializer_value(entry.deReference(), llvm_var, 0)] * entry.size)

        return llvm_var.initializer


    def handleFunction(self, node: ASTNode):
        function_name = node.getChild(0).text
        function = LLVMSingleton.getInstance().getFunction(function_name)
        if function is None:
            function = LLVMSingleton.getInstance().getModule().get_global(function_name)

        symbol_entry = None
        current_table = node.getSymbolTable()
        while current_table is not None:
            symbol_entry = current_table.getEntry(function_name, node.position.virtual_linenr)
            if symbol_entry:
                type_object = symbol_entry.getTypeObject()
                while isinstance(type_object, SymbolTypePtr):
                    type_object = type_object.pts_to
                if isinstance(type_object, FunctionSymbolType):
                    break
            current_table = current_table.prev

        self.map_table.addEntry(MapEntry(function_name, function), symbol_entry)

    def handleParameterCalls(self, node: ASTNode):
        args = []
        for child in node.children:
            llvm_var = self.llvm_map.get(child)
            if isinstance(llvm_var.type, ir.types.PointerType) and isinstance(llvm_var.type.pointee, ir.types.ArrayType):
                block = LLVMSingleton.getInstance().getCurrentBlock()
                llvm_var = block.bitcast(llvm_var, ir.types.PointerType(llvm_var.type.pointee.element))
            if llvm_var is not None:
                args.append(llvm_var)

        self.llvm_map[node] = args

    def __del__(self):
        for comment in self.comments:  # Add any leftover comments
            Declaration.addComment(self.comments[comment])

        with open(self.fileName, 'w') as f:
            f.write(str(LLVMSingleton.getInstance().getModule()))

    def handleAssignment(self, node: ASTNode):
        """
        handle assignment
        :param node:
        :return:
        """
        left_child = node.getChild(0)
        store_reg = self.llvm_map.get(left_child, None)
        if store_reg is None:
            store_reg = self.map_table.getEntry(left_child.getSymbolTable().getEntry(left_child.text)).llvm

        right_child = node.getChild(1)

        to_store_reg = self.llvm_map.get(right_child, None)

        if not isinstance(store_reg, ir.GEPInstr) and not isinstance(store_reg, ir.CastInstr):
            alignment = store_reg.align
        else:
            alignment = 4

        llvm_var = Declaration.assignment(store_reg, to_store_reg, alignment)

        self.llvm_map[node] = llvm_var

    def handleDereference(self, node: ASTNode):
        """
        Handle a dereference
        :param node:
        :return:
        """
        child_llvm = node.getChild(0)

        llvm_data = self.llvm_map.get(child_llvm)

        """
        get the var register
        """
        llvm_var = Load.identifier(llvm_data)
        self.llvm_map[node] = llvm_var

    def handleReturn(self, node: ASTNode):
        #check if the return is from a void function, if so, return void
        if node.getChildAmount() == 0:
            LLVMSingleton.getInstance().getCurrentBlock().ret_void()
        else:
            return_val = self.llvm_map[node.getChild(0)]
            LLVMSingleton.getInstance().getCurrentBlock().ret(return_val)

    def handlePrintScanf(self, node: ASTNode, printf):
        """
        Handle printf or scanf function
        :param node:
        :param printf: If true do make printf
        :return:
        """
        format_specifier_node = node.children[0]
        format_specifier = self.llvm_map[format_specifier_node]
        args = []

        """
        load part of printf statement we want to print
        """
        for child in node.children[1:]:
            llvm_var = self.llvm_map.get(child, None)
            if llvm_var is not None:
                args.append(llvm_var)

        if printf:
            llvm_var = Printf.printf(format_specifier, *args)
        else:
            llvm_var = Scanf.scanf(format_specifier, *args)
        self.llvm_map[node] = llvm_var

    def handleOperations(self, node: ASTNode):
        """
        Handle Arithmetic operations
        :param node:
        :return:
        """
        if node.getChildAmount() == 2:
            operator = node.getChild(0).text
            child = node.getChild(1)
            post_incr = False

            if child.text in ("++", "--"):
                operator = child.text
                child = node.getChild(0)
                post_incr = True

            child_llvm = self.llvm_map[child]
            llvm_var = Calculation.unary(child_llvm, operator)

            if operator in ("++", "--"):
                super_child = child.getChild(0)

                u = self.llvm_map[super_child]

                if not isinstance(u, ir.GEPInstr):
                    align = u.align
                else:
                    align = 4

                Declaration.assignment(u, llvm_var, align)

            if post_incr:
                llvm_var = child_llvm

        if node.getChildAmount() == 3:

            operator_child = node.getChild(1)
            operator = operator_child.text

            if operator in ("&&", "||"):
                left = self.llvm_map.get(node.getChild(0))
                right = self.llvm_map.get(node.getChild(2))

                llvm_var = Calculation.unary(left, "+")
                self.llvm_map[node] = llvm_var
                return

            left = self.llvm_map.get(node.getChild(0))
            right = self.llvm_map.get(node.getChild(2))

            #print(left,  node.getChild(0).text, right, node.getChild(2).text, operator)
            llvm_var = Calculation.operation(left, right, operator)

        self.llvm_map[node] = llvm_var

    def handleConversions(self, node: ASTNode):
        """
        Handle explicit and implicit conversions
        :param node:
        :return:
        """
        to_type_node = node.getChild(0)

        PreConditions.assertInstanceOff(to_type_node, ASTNodeTypes)

        to_type = to_type_node.symbol_type

        expr_node = node.getChild(1)
        llvm_var = self.llvm_map[expr_node]

        converted_var = Conversion.performConversion(llvm_var, to_type)

        self.llvm_map[node] = converted_var


    def handleParameters(self, node: ASTNode):
        """
        param node:
        :return:
        """

        func = LLVMSingleton.getInstance().getLastFunction()
        # Get the arguments of the function
        arguments = func.args

        # Iterate over the arguments
        index = 0

        builder = LLVMSingleton.getInstance().getCurrentBlock()
        for arg in arguments:

            # Get the argument type
            arg_type = arg.type

            # Create an alloca instruction
            alloca = builder.alloca(arg_type)

            # Store the argument value in the alloca instruction
            store = builder.store(arg, alloca)

            # Add the alloca instruction to the map
            self.llvm_map[node.getChild(index).getChild(0)] = alloca

            # Add the store instruction to the map
            self.llvm_map[node.getChild(index).getChild(0)] = store

            entry = node.getSymbolTable().getEntry(node.getChild(index).getChild(0).text)

            # Add the alloca instruction to the map
            self.map_table.addEntry(MapEntry(node.getChild(index).getChild(0).text, alloca), entry)

            index += 1

    @staticmethod
    def getConversionType(type_node: ASTNode) -> SymbolType:
        """"
        Extract the type of the AST node
        """

        symbol_type = None

        for child in type_node.children:
            if child.text == "const":
                continue

            if child.text != "*":
                symbol_type = SymbolType(child.text, False)
            else:
                if child.type.startswith("ARRAY_"):
                    symbol_type = SymbolTypeArray(symbol_type, False, int(child.type[6:]))
                else:
                    symbol_type = SymbolTypePtr(symbol_type, False)

        return symbol_type

    def addOriginalCodeAsComment(self, node: ASTNode):
        """
        create a new LLVM node that contains the original C code and add it to the LLVM tree
        :param node: the node in the AST that we are currently handling
        :return:
        """

        if node.symbol_table is None or node.symbol_table.isRoot():  # LLVM thing in which you can't properly place comments in the global scope
            return

        code = self.codegetter.getLine(node)
        if code is not None:
            Declaration.addComment(code)

    def handle_IO(self):
        """
        Create I/O needed File ptr format equivalent for LLVM
        """
        Declaration.IdentifiedStructIO()