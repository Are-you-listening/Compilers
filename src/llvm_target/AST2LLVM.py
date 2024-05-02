from src.llvm_target.OutputLLVMGenerator import *
from src.llvm_target.MapTable.MapTable import *
from src.parser.Tables.SymbolTypeStruct import *

from src.parser.CodeGetter import *
from llvmlite import ir
from src.parser.AST import ASTNodeBlock


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
        self.special_func_calls = {"malloc", "calloc", "free", "realloc", "fgets"}

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
            currentNode = stack[-1]  # get top of stack without popping it

            if currentNode.text == "Function" and currentNode not in visited:
                visited.add(currentNode)

                self.handleFunction(currentNode)
                self.map_table = MapTable(self.map_table)
                function = LLVMSingleton.getInstance().getFunction(currentNode.getChild(0).text)
                LLVMSingleton.getInstance().setLastFunction(function)

            if isinstance(currentNode, ASTNodeBlock) and currentNode.text == "Block" and currentNode not in visited:
                node = currentNode

                if node.vertex.llvm is None:
                    node.vertex.llvm = LLVMSingleton.getInstance().addBlock()

                LLVMSingleton.getInstance().setCurrentBlock(node.vertex.llvm)
                self.last_vertex = node.vertex

                self.addOriginalCodeAsComment(currentNode)

            childNotVisited = False
            for child in reversed(currentNode.getChildren()):
                if child not in visited:
                    stack.append(child)
                    childNotVisited = True
            if not childNotVisited:
                currentNode.accept(self)
                stack.pop()

            visited.add(currentNode)

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
            entry = self.map_table.getEntry(node.text)

            """
            identifiers of declarations and functions are not yet defined
            """
            if entry is None:

                if node.text in self.special_func_calls and LLVMSingleton.getInstance().getFunction(node.text) is None:
                    """
                    To support declaration of special function calls like 'malloc'
                    """
                    function_type = node.getSymbolTable().getEntry(node.text).getTypeObject()
                    args = function_type.getParameterTypes()

                    func = Declaration.function(node.text, function_type.return_type, args)
                    self.map_table.addEntry(MapEntry(node.text, func))
                    entry = self.map_table.getEntry(node.text)

                else:
                    return

            self.llvm_map[node] = entry.llvm

        if node.type in ("INT", "FLOAT", "CHAR", "BOOL"):
            llvm_var = Declaration.llvmLiteral(node.text, SymbolType(node.type, False))
            self.llvm_map[node] = llvm_var

        if node.type == "STRING":
            llvm_var = Declaration.string(node.text)
            self.llvm_map[node] = llvm_var

    def handleComment(self, node):
        if node.position is None:
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
        data_type, ptrs = entry.getPtrTuple()

        if data_type[0] not in ["INT", "FLOAT", "CHAR", "PTR"]:  # Using a struct
            if isinstance(entry.getTypeObject(), SymbolTypeStruct):
                data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getTypeObject().getFullType()
        if var_child.symbol_table.isRoot():  # Globals; extra stuff needs to be done
            llvm_var = ir.GlobalVariable(LLVMSingleton.getInstance().getModule(),
                                         CTypesToLLVM.getIRType(entry.getTypeObject()), var_child.text)  # Declare a global variable
            value = var_child.getSiblingNeighbour(1)  # Get the value
            if value is None:
                value = 0
            else:
                value = value.text

            # Preset some values
            llvm_var.initializer = ir.Constant(CTypesToLLVM.getIRType(entry.getTypeObject()), value)
            llvm_var.align = CTypesToLLVM.getBytesUse(entry.getTypeObject())

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

        self.map_table.addEntry(MapEntry(var_child.text, llvm_var))

        """
        see assignment to declaration as assignment
        """
        if node.getChildAmount() == 2:
            self.handleAssignment(node)

    def handleFunction(self, node: ASTNode):
        function_name = node.getChild(0).text
        function = LLVMSingleton.getInstance().getFunction(function_name)
        if function is None:
            function = LLVMSingleton.getInstance().getModule().get_global(function_name)

        self.map_table.addEntry(MapEntry(function_name, function))

    def handleParameterCalls(self, node: ASTNode):
        args = []
        for child in node.children:
            llvm_var = self.llvm_map.get(child)
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
            store_reg = self.map_table.getEntry(left_child.text).llvm

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
                Declaration.assignment(u, llvm_var, u.align)

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

            llvm_var = Calculation.operation(left, right, operator)

        self.llvm_map[node] = llvm_var

    def handleConversions(self, node: ASTNode):
        """
        Handle explicit and implicit conversions
        :param node:
        :return:
        """
        to_type_node = node.getChild(0)
        to_type = self.getConversionType(to_type_node)

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

            # Add the alloca instruction to the map
            self.map_table.addEntry(MapEntry(node.getChild(index).getChild(0).text, alloca))

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

        code = self.codegetter.getLine(node)
        if code is not None:
            Declaration.addComment(code)

    def handle_IO(self):
        """
        Create I/O needed File ptr format equivalent for LLVM
        """
        Declaration.IdentifiedStructIO()