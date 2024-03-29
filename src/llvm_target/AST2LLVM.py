from src.llvm_target.OutputLLVMGenerator import *
from src.llvm_target.MapTable.MapTable import *
from src.llvm_target.ControlFlow.ControlFlowGraph import *
from src.parser.CodeGetter import *
from llvmlite import ir


class AST2LLVM(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self, codegetter: CodeGetter, fileName):
        self.map_table = MapTable(None)
        self.codegetter = codegetter
        self.llvm_map = {}
        self.fileName = fileName
        self.root = None
        self.control_flow_map = {}
        self.eval_scope_node = None

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.llvm_map = {}

        self.control_flow_map = {}

        self.root = ast.root
        self.postorder(self.root)
        self.eval_scope_node = None

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
                self.map_table = MapTable(self.map_table)
                self.handleFunction(currentNode)

            if currentNode.text == "Expr" and currentNode.getChildAmount() == 3 and currentNode.getChild(1).text in (
                    "&&", "||"):
                if self.eval_scope_node is None:
                    self.eval_scope_node = currentNode

            childNotVisited = False
            for child in reversed(currentNode.getChildren()):
                if child not in visited:
                    stack.append(child)
                    childNotVisited = True
            if not childNotVisited:
                # print(currentNode.text)  # debug print
                currentNode.accept(self)
                visited.add(currentNode)
                stack.pop()

    def visitNode(self, node: ASTNode):
        """
        Visit function to construct LLVM
        :param node:
        :return:
        """

        if node.text == "Declaration":
            self.handleDeclaration(node)

        if node.text == "Function":
            self.map_table = self.map_table.prev

        if node.text == "Dereference":
            self.handleDereference(node)

        if node.text == "Assignment":
            self.handleAssignment(node)

        if node.text == "Comment":
            self.handleComment(node)

        if node.text == "printf":
            self.handlePrintf(node)

        if node.text == "Expr":
            self.handleOperations(node)

        if node.text == "Conversion":
            self.handleConversions(node)

        if node.text == "Return":
            self.handleReturn()

        self.addOriginalCodeAsComment(node)

        for child in node.children:
            cf = self.control_flow_map.get(child, None)
            if cf is not None:
                self.control_flow_map[node] = cf
                break

        if self.eval_scope_node == node:
            cf = self.control_flow_map.get(node, None)
            phi = cf.endEval()
            self.llvm_map[node] = phi
            self.eval_scope_node = None

        if node.text == "Start" and self.llvm_map.get(node, None) is None:
            self.control_flow_map[node] = ControlFlowGraph()

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            entry = self.map_table.getEntry(node.text)

            """
            identifiers of declarations and functions are not yet defined
            """
            if entry is None:
                return

            self.llvm_map[node] = entry.llvm

        if node.type in ("INT", "FLOAT", "CHAR"):
            llvm_var = Declaration.llvmLiteral(node.text, node.type, "")
            self.llvm_map[node] = llvm_var

        if node.text in ("||", "&&"):
            """
            make left side start
            """
            if self.control_flow_map.get(node.getSiblingNeighbour(-1), None) is None:
                left = ControlFlowGraph()
                self.control_flow_map[node.getSiblingNeighbour(-1)] = left
                left.startEval()

            """
            make new block, because right side of a logical expression is in another block
            """
            new_block = LLVMSingleton.getInstance().addBlock()
            LLVMSingleton.getInstance().setCurrentBlock(new_block)

    @staticmethod
    def handleFunction(node: ASTNode):
        var_child: ASTNode = node.getChild(0)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()

        Declaration.function(var_child.text, data_type, ptrs)

        """
        add value to map to map var to address register
        """

    def handleDeclaration(self, node):
        """
        ask the var type, and search its value in the symbol table
        """
        var_child: ASTNode = node.getChild(0)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()
        """
        all children of type_child are terminals
        """
        llvm_var = Declaration.declare(data_type, ptrs)
        """
        store var in llvm map
        """
        self.llvm_map[node] = llvm_var

        """
        add value to map to map var to address register
        """
        self.map_table.addEntry(MapEntry(var_child.text, llvm_var))

        """
        see assignment to declaration as assignment
        """
        if node.getChildAmount() == 2:
            self.handleAssignment(node)

    def __del__(self):
        # print(LLVMSingleton.getInstance().getModule())
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
        llvm_var = Declaration.assignment(store_reg, to_store_reg, store_reg.align)

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

    @staticmethod
    def handleComment(node: ASTNode):
        comment_text = node.children[0].text
        Declaration.addComment(comment_text)

    @staticmethod
    def handleReturn():
        LLVMSingleton.getInstance().getCurrentBlock().ret(ir.Constant(ir.IntType(32), 0))

    def handlePrintf(self, node: ASTNode):
        """
        Handle printf function
        :param node:
        :return:
        """
        formatSpecifier = node.children[0].text
        args = []

        """
        load part of printf statement we want to print
        """
        for child in node.children[1:]:
            llvm_var = self.llvm_map.get(child, None)
            if llvm_var is not None:
                args.append(llvm_var)

        Printf.printf(formatSpecifier, *args)

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

            """
            when ! is inside a logical expression
            """

            sub_control_graph_right = self.control_flow_map.get(node.getChild(1), None)
            if operator == "!" and self.eval_scope_node is not None and sub_control_graph_right is not None:
                own_sub_control = ControlFlowGraph.mergeLogicalNot(sub_control_graph_right)

                self.control_flow_map[node.getChild(0)] = own_sub_control
                self.control_flow_map[node.getChild(1)] = own_sub_control

                self.llvm_map[node] = self.llvm_map[node.getChild(1)]
                return

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

            operator = node.getChild(1).text

            """
            do special ControlFlow changes for logical operations
            """
            if operator in ("&&", "||"):
                """
                fot logical operations we make new blocks, for the control flow, and we use the control flow graph
                bottom up to create this correctly
                """
                if node.getChild(1).text == "&&":
                    """
                    add a logical 'AND' component to the control flow graph
                    """
                    self.handleLogicalOperations(node.getChild(1))

                if node.getChild(1) is not None and node.getChild(1).text == "||":
                    """
                    add a logical 'OR' component to the control flow graph
                    """
                    self.handleLogicalOperations(node.getChild(1))

                self.llvm_map[node] = self.llvm_map[node.getChild(2)]

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

    @staticmethod
    def getConversionType(type_node: ASTNode):
        """"
        Extract the type of the AST node
        """
        type_text = ""
        ptr_text = ""

        for child in type_node.children:
            if child.text == "const":
                continue
            if "*" in child.text:
                ptr_text += child.text
            else:
                type_text += child.text

        return type_text, ptr_text

    def addOriginalCodeAsComment(self, node: ASTNode):
        """
        create a new LLVM node that contains the original C code and add it to the LLVM tree
        :param node: the node in the AST that we are currently handling
        :return:
        """
        if node.getChildAmount() == 0:
            return
        code = self.codegetter.getLine(node.getChild(0))
        if code is not None:
            Declaration.addComment(code)

    def handleLogicalOperations(self, node):
        """
        handle operations part of a logical operation
        """

        """
        check if an eval is started, if not start 1, An Eval is just a pending evaluation of the control flow,
        with its corresponding branches
        """

        """
        left subgroup is guaranteed, right is not
        """
        sub_control_graph_left = self.control_flow_map.get(node.getSiblingNeighbour(-1), None)
        sub_control_graph_right = self.control_flow_map.get(node.getSiblingNeighbour(1), None)

        if sub_control_graph_right is None:
            sub_control_graph_right = ControlFlowGraph(False)

        if not sub_control_graph_right.isEval():
            sub_control_graph_right.startEval()

        if node.text == "&&":
            own_sub_control = ControlFlowGraph.mergeLogicalAnd(sub_control_graph_left, sub_control_graph_right)

        if node.text == "||":
            own_sub_control = ControlFlowGraph.mergeLogicalOr(sub_control_graph_left, sub_control_graph_right)

        self.control_flow_map[node] = own_sub_control
        self.control_flow_map[node.getSiblingNeighbour(-1)] = own_sub_control
        self.control_flow_map[node.getSiblingNeighbour(1)] = own_sub_control

    def getControlFlowGraph(self):
        return self.control_flow_map.get(self.root, None)
