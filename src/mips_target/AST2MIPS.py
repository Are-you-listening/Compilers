from src.parser.Tables.SymbolTypeStruct import *
from src.llvm_target.MapTable import *
from src.parser.CodeGetter import *

from src.parser.AST import ASTNodeBlock, ASTNodeTypes
from src.internal_tools import PreConditions
from src.mips_target.OutputMIPSGenerator import *
from .MipsSingleton import MipsSingleton
from .PredifinedStructures import SpecialFunctions
from ..parser.ControlFlow.ControlFlowGraph import ControlFlowGraph


class AST2MIPS(ASTVisitor):
    def __init__(self, codegetter: CodeGetter, fileName, comments):
        self.map_table = MapTable(None)
        self.mips_map = {}
        self.root = None
        self.codegetter = codegetter
        self.fileName = fileName
        self.comments = comments
        self.special_functions_declared = {}
        self.special_func_creator = {"malloc": SpecialFunctions.malloc}
        self.branch_needed = []
        self.last_vertex = None
        self.globals = {}

    def visit(self, ast: AST):
        self.special_functions_declared = {}
        self.map_table = MapTable(None)
        self.mips_map = {}
        self.branch_needed = []
        self.last_vertex = None
        self.globals = {}

        self.root = ast.root
        self.postorder(self.root)

        for b in self.branch_needed:
            b.create_branch(True)

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

            if isinstance(current_node, ASTNodeBlock) and current_node.text == "Block" and current_node not in visited:
                node = current_node

                if node.vertex.mips is None:
                    node.vertex.mips = MipsSingleton.getInstance().addBlock()

                    counter_max = 0
                    for r in node.vertex.reverse_edges:
                        rev = r.from_vertex
                        if rev.mips is None:
                            continue
                        print("curr count", rev.mips.counter)
                        counter_max = max(counter_max, rev.mips.counter)
                    print("max", counter_max)

                    #print("overtime", counter_max)

                    node.vertex.mips.counter = counter_max
                    node.vertex.mips.start_counter = counter_max
                    RegisterManager.getInstance().curr_function[node.vertex.mips.function.getFunctionName()] = counter_max

                    current_stack = node.vertex.mips.addui(Memory("sp", True), 0)
                    self.mips_map[node] = current_stack

                    #print("currstack", current_stack, node.vertex.mips.label)
                    print("hello", current_stack)
                    node.vertex.mips.stack_val = current_stack

                MipsSingleton.getInstance().setCurrentBlock(node.vertex.mips)

                self.addOriginalCodeAsComment(current_node)

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
        Visit function to construct Mips code
        :param node:
        :return:
        """

        if isinstance(node, ASTNodeBlock) and node.text == "Block":
            if self.last_vertex is not None:
                self.last_vertex.check_flipped(True)

                """
                When we have instructions for our statement, there is no problem, but IR constants are not considered
                an instruction, so in those cases we need to pass it to the create branch, in case it needs to create 
                a conditional branch
                """
                block = MipsSingleton.getInstance().getCurrentBlock()
                if self.last_vertex not in self.branch_needed:
                    self.branch_needed.append(self.last_vertex)
                if len(self.last_vertex.edges) == 2:

                    if len(block.instructions) > 0 and self.last_vertex.edges[0].to_vertex != self.last_vertex.edges[1].to_vertex:
                        index = -1
                        while True:

                            t = block.instructions[index].getAddress()
                            if t is not None:
                                break
                            index -= 1

                        block.move(Memory("v0", True), block.instructions[index].getAddress())
                    print("end block", self.last_vertex.mips.stack_val.address)

                    print("end block", self.last_vertex.mips.stack_val.address)

                RegisterManager.getInstance().spillAll(self.last_vertex.mips)

                #print("overtimer1", node.vertex.mips.counter)
                node.vertex.mips.counter = RegisterManager.getInstance().curr_function[
                    node.vertex.mips.function.getFunctionName()]
                #print("overtimer2", node.vertex.mips.counter)


            return

        if isinstance(node, ASTNodeBlock) and node.text == "PHI":
            """
            When coming across a PHI, node, we know that we need the LLVM phi
            instruction to continue, so we generate the phi of the last (current) vertex
            """
            phi = self.last_vertex.create_phi(True)
            block = MipsSingleton.getInstance().getCurrentBlock()
            phi = block.addui(phi, 0)
            self.mips_map[node] = phi

            return

        if node.text == "Declaration":
            self.handleDeclaration(node)

        if node.text == "Parameters":
            self.handleParameters(node)

        if node.text == "Function":
            if node.getChild(1).text == "Code":
                self.map_table = self.map_table.prev
                MipsSingleton.getInstance().getLastFunction().endFunction()

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
            self.mips_map[node] = self.mips_map[node.getChild(0)]

        if node.text not in ("Parameters"):
            self.addOriginalCodeAsComment(node)

        self.handleComment(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            entry_sym = node.getSymbolTable().getEntry(node.text, node.position.virtual_linenr)

            if isinstance(entry_sym.getTypeObject(), FunctionSymbolType) and node.text not in self.special_functions_declared and node.text in self.special_func_creator:
                function = self.special_func_creator[node.text](node.getSymbolTable().getEntry(node.text, node.position.virtual_linenr).getTypeObject())
                self.special_functions_declared[node.text] = function
                self.map_table.addEntry(MapEntry(node.text, function), entry_sym)

            entry = self.map_table.getEntry(entry_sym)
            if entry is None:
                mips_var = RegisterManager.getInstance().allocate(MipsSingleton.getInstance().getCurrentBlock(), False)
                mips_var.symbol_type = SymbolTypePtr(entry_sym.getTypeObject(), False)
                self.mips_map[node] = mips_var

                if not node.getSymbolTable().isRoot() and entry_sym.firstDeclared.getSymbolTable().isRoot():  # First use of the global value 'outside' of the global scope
                    register_manager = RegisterManager.getInstance()
                    block = MipsSingleton.getInstance().getCurrentBlock()
                    label = self.globals[node.text].address
                    symbol_type = self.globals[node.text].symbol_type

                    # if mips_var.symbol_type.getBaseType() == "FLOAT":
                    #     mips_var = block.l_s(label)
                    # else:
                    mips_var = block.la(label)
                        #mips_var = register_manager.getInstance().storeVariable(block, mips_var, symbol_type.getBytesUsed())
                    self.mips_map[node] = mips_var
                    mips_var.symbol_type = SymbolTypePtr(entry_sym.getTypeObject(), False)
                    self.map_table.addEntry(MapEntry(node.text, mips_var), entry_sym)
                else:
                    if node.parent.text not in ("Declaration", "Parameter", "Function"):
                        """
                        Fix the int True = True issue
                        """
                        d = Declaration.declare("", SymbolTypePtr(entry_sym.getTypeObject(), False), 0)
                        self.mips_map[node] = d


            else:
                mips_var = entry.llvm
                #if isinstance(mips_var, Memory):
                    #print("mipsvar", mips_var.address, node.text)

                self.mips_map[node] = mips_var

        if node.getSymbolTable().isRoot():
            return

        if node.type in ("INT", "FLOAT", "CHAR", "BOOL"):
            mips_var = Declaration.mipsLiteral(node.text, SymbolType(node.type, False))
            self.mips_map[node] = mips_var
            if node.type == "INT":
                mips_var.symbol_type = SymbolType(node.type, False)
                mips_var.const_value = int(node.text)

        if node.type == "STRING":
            mips_var = Declaration.string(node.text)
            mips_var.symbol_type = SymbolTypePtr(SymbolType("CHAR", False), False)

            mips_var.symbol_type = SymbolTypeArray(SymbolType("CHAR", False), False, len(node.text))
            self.mips_map[node] = mips_var

    def handleDeclaration(self, node):
        var_node: ASTNode = node.getChild(0)
        entry = var_node.getSymbolTable().getEntry(var_node.text, var_node.position.virtual_linenr)

        if var_node.getSymbolTable().isRoot():
            # Handle global variable (add to .data segment)

            value = 0
            if node.getChildAmount() > 1:
                if node.getChild(1).getChildAmount() == 0:
                    value = node.getChild(1).text
                else:
                    value = []
                    for c in node.getChild(1).children:
                        print("c", c.text)
                        value.append(c.text)


            mips_var = Declaration.declare(var_node.text, entry.getTypeObject(), value, is_global=True)
            self.mips_map[node] = mips_var
            self.globals[var_node.text] = mips_var
        else:
            # Handle non-global variable (reserve space on the stack)
            mips_var = Declaration.declare(var_node.text, SymbolTypePtr(entry.getTypeObject(), False))

            self.mips_map[node] = mips_var
            self.mips_map[node.getChild(0)] = mips_var
            self.map_table.addEntry(MapEntry(var_node.text, mips_var), entry)

        if node.getChildAmount() == 2 and not var_node.getSymbolTable().isRoot():
            self.handleAssignment(node)

    def __del__(self):
        for text in self.comments:  # Add any leftover comments
            MipsSingleton.getInstance().getCurrentBlock().comment(self.comments[text])

        with open(self.fileName, 'w') as f:
            f.write(str(MipsSingleton.getInstance().getModule().toString()))


    def handleFunction(self, node: ASTNode):
        function_name = node.getChild(0).text
        mips_module = MipsSingleton.getInstance().getModule()
        function = mips_module.getFunction(function_name)
        if function is None:
            function = mips_module.createFunction(function_name, node.getChild(0).getSymbolTable().getEntry(function_name, node.getChild(0).position.virtual_linenr-1).getTypeObject())

        MipsSingleton.getInstance().setLastFunction(function)
        current_table = node.getSymbolTable()
        symbol_entry = current_table.getEntry(function_name, node.position.virtual_linenr)

        self.map_table.addEntry(MapEntry(function_name, function), symbol_entry)

    def handleComment(self, node):
        if node.position is None or node.symbol_table is None or node.symbol_table.isRoot():  # We can't add comments in the global scope of llvm
            return

        curr_line = node.position.linenr
        file = node.position.file
        to_delete = []

        for text in self.comments.keys():
            if text[1] < curr_line and file == text[0]:  # Insert all comments before this line (since some comments might not have code on the same line)
                Comment.comment(self.comments[text])
                to_delete.append(text)

        for text in to_delete:
            del self.comments[text]

    def handleParameterCalls(self, node: ASTNode):
        args = []
        for child in node.children:
            mips_var = self.mips_map.get(child)
            if mips_var is not None:
                args.append(mips_var)

        self.mips_map[node] = args

    def handleAssignment(self, node: ASTNode):
        assign_target = self.mips_map[node.getChild(0)]
        assign_value = self.mips_map[node.getChild(1)]

        mips_var = Declaration.assignment(assign_target, assign_value)
        self.mips_map[node] = mips_var

    def handleDereference(self, node: ASTNode):
        block = MipsSingleton.getInstance().getCurrentBlock()

        child_mips = self.mips_map[node.getChild(0)]
        RegisterManager.getInstance().loadIfNeeded(block, [child_mips])

        if child_mips.symbol_type.deReference().getBaseType() == "CHAR" and child_mips.symbol_type.deReference().isBase():
            mips_var = block.lb(child_mips, 0)
        else:
            mips_var = block.lw(child_mips, 0)

        mips_var.symbol_type = child_mips.symbol_type.deReference()

        self.mips_map[node] = mips_var

    def handleReturn(self, node: ASTNode):
        if node.getChildAmount() == 0:
            return
        mips_var = self.mips_map[node.getChild(0)]
        FunctionMet.handleReturn(mips_var)

    def handlePrintScanf(self, node: ASTNode, printf):
        """
        Create printf function
        """
        if printf:
            name = "printf"
        else:
            name = "scanf"

        if name not in self.special_functions_declared:
            if printf:
                function = Printf.printf(FunctionSymbolType(SymbolType("INT", False), []))
            else:
                function = Printf.scanf(FunctionSymbolType(SymbolType("INT", False), []))
            self.special_functions_declared[name] = function
        else:
            function = self.special_functions_declared[name]

        params = []
        for c in node.children:
            mips = self.mips_map.get(c)
            params.append(mips)

        return_value = FunctionMet.functionCall(function, params)
        self.mips_map[node] = return_value

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

            child_mips = self.mips_map[child]
            mips_var = Calculation.unary(child_mips, operator)

            if operator in ("++", "--"):
                super_child = child.getChild(0)

                u = self.mips_map[super_child]

                Declaration.assignment(u, mips_var)

            if post_incr:
                mips_var = child_mips
            if child_mips.symbol_type is None and child.text == "PHI":
                child_mips.symbol_type = SymbolType("BOOL", None)
            mips_var.symbol_type = child_mips.symbol_type

        if node.getChildAmount() == 3:

            operator_child = node.getChild(1)
            operator = operator_child.text

            left = self.mips_map.get(node.getChild(0))
            right = self.mips_map.get(node.getChild(2))

            if operator in ("&&", "||"):
                llvm_var = Calculation.unary(left, "+")
                self.mips_map[node] = llvm_var
                return

            mips_var = Calculation.operation(left, right, operator)

            if mips_var.symbol_type is None:
                if operator == "[]":
                    pass
                elif operator in ['<' ,'>', '>=' ,'<=', '==' , '!=']:
                    mips_var.symbol_type = SymbolType("BOOL", False)
                else:
                    mips_var.symbol_type = left.symbol_type

        #mips_var.symbol_type = node.getSymbolTable().getEntry()
        self.mips_map[node] = mips_var

    def handleConversions(self, node: ASTNode):
        """
        Handle a dereference
        :param node:
        :return:
        """
        var = self.mips_map.get(node.getChild(1))
        if node.getChild(1).text == "PHI":
            from_type = SymbolType("BOOL", False)
        else:
            from_type = var.symbol_type

        to_type = node.getChild(0).symbol_type
        if (to_type.getType() == from_type.getType()) and (to_type.getPtrAmount() == from_type.getPtrAmount()):
            other_mem = Memory(var.getAddress(), var.is_loaded)
            other_mem.symbol_type = to_type
            self.mips_map[node] = other_mem
        else:
            converted_var = Conversion.convert(var, to_type, from_type)
            self.mips_map[node] = converted_var

    def handleParameters(self, node: ASTNode):
        params = []
        if node.parent.text == "Function":
            return
        for i, p in enumerate(node.children):
            block = MipsSingleton.getInstance().getCurrentBlock()
            fp = Memory("fp", True)
            mem_obj = block.addui(fp, (i+1)*4)

            params.append(mem_obj)
            self.mips_map[p] = mem_obj

            param_identifier = p.getChild(0)

            entry = param_identifier.getSymbolTable().getEntry(param_identifier.text)

            mem_obj.symbol_type = SymbolTypePtr(entry.getTypeObject(), False)
            self.map_table.addEntry(MapEntry(param_identifier, mem_obj), entry)

        self.mips_map[node] = params

    def addOriginalCodeAsComment(self, node: ASTNode):
        if node.symbol_table is None or node.symbol_table.isRoot():  # LLVM thing in which you can't properly place comments in the global scope
            return

        code = self.codegetter.getLine(node)
        if code is not None:
            Comment.comment(code)

    def handle_IO(self):
        pass
