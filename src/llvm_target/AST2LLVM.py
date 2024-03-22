from src.llvm_target.OutputStringGenerator import *
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
        self.control_flow_graph = ControlFlowGraph()

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.llvm_map = {}
        self.control_flow_graph = ControlFlowGraph()

        root = ast.root
        self.postorder(root)

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
        if node.text in ("Declaration", "Assignment", "Function"):
            if self.control_flow_graph.isEval():
                self.control_flow_graph.endEval()

        if node.text == "Declaration":
            self.handleDeclaration(node)
            self.addOriginalCodeAsComment(node)

        if node.text == "Function":
            self.map_table = self.map_table.prev

        if node.text == "Dereference":
            self.handleDereference(node)

        if node.text == "Assignment":
            self.handleAssignment(node)
            self.addOriginalCodeAsComment(node)

        if node.text == "Comment":
            self.handleComment(node)

        if node.text == "printf":
            self.handlePrintf(node)

        if node.text == "Expr":
            self.handleOperations(node)

        if node.text == "Conversion":
            self.handleConversions(node)

        if node.text == "Return":
            self.handleReturn(node)

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

        if node.text == "&&":
            llvm_var = self.handleLogicalOperations(node.getSiblingNeighbour(-1))
            self.control_flow_graph.addLogicalAnd()
            self.llvm_map[node] = llvm_var

        if node.text == "||":
            llvm_var = self.handleLogicalOperations(node.getSiblingNeighbour(-1))
            self.control_flow_graph.addLogicalOr()
            self.llvm_map[node] = llvm_var

        if node.getSiblingNeighbour(-1) is None:
            return

        if node.getSiblingNeighbour(-1).text in ("||", "&&"):
            llvm_var = self.handleLogicalOperations(node)
            self.llvm_map[node] = llvm_var

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
    def handleReturn(node: ASTNode):
        LLVMSingleton.getInstance().getCurrentBlock().ret_void()

    def handlePrintf(self, node: ASTNode):
        """
        Handle printf function
        :param node:
        :return:
        """
        formatSpecifier = node.children[0].text
        args = []

        for child in node.children[1:]:
            var_node = self.getVariableNode(child)
            if var_node is None:
                continue

            if isinstance(var_node, ASTNodeTerminal) and var_node.type == "IDENTIFIER":
                llvm_var = self.map_table.getEntry(var_node.text).llvm
                if llvm_var is not None:
                    args.append(llvm_var)

            elif isinstance(var_node, ASTNodeTerminal) and var_node.type in ("INT", "FLOAT", "CHAR"):
                llvm_literal = self.llvm_map.get(var_node)
                if llvm_literal is not None:
                    args.append(llvm_literal)

        Printf.printf(formatSpecifier, *args)

    def getVariableNode(self, node):
        """
        Recursive function to get the actual variable or literal node from a chain of dereference nodes.
        """
        if node.text == "Dereference":
            return self.getVariableNode(node.children[0])
        else:
            return node

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
                llvm_var = child

        if node.getChildAmount() == 3:
            operator = node.getChild(1).text

            """
            do special ControlFlow changes for logical operations
            """
            if operator in ("&&", "||"):
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
        type_text = type_node.children[0].text
        if type_node.getChildAmount() > 1:
            type_text += type_node.children[1].text

        return type_text

    def addOriginalCodeAsComment(self, node: ASTNode):
        """
        create a new LLVM node that contains the original C code and add it to the LLVM tree
        :param node: the node in the AST that we are currently handling
        :return:
        """
        code = self.codegetter.getLine(node.getChild(0))
        Declaration.addComment(code)

    def handleLogicalOperations(self, node):
        if not self.control_flow_graph.isEval():
            self.control_flow_graph.startEval()
        """
        add syntax to make bool on right spot
        """
        llvm_zero = Declaration.llvmLiteral("0", "INT", "")

        var = self.llvm_map[node]
        if isinstance(var, ir.values.Constant):
            self.control_flow_graph.const_value_map[LLVMSingleton.getInstance().getCurrentBlock()] = var
            return var

        llvm_var = Calculation.operation(var, llvm_zero, "!=")

        return llvm_var
