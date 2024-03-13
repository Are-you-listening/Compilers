from src.parser.ASTVisitor import *
from src.llvm_target.OutputStringGenerator import *
from src.llvm_target.MapTable.MapTable import *
from src.llvm_target.ControlFlow.ControlFlowGraph import *
from src.parser.CodeGetter import *
from llvmlite import ir


class AST2LLVM(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self, codegetter : CodeGetter):
        self.map_table = MapTable(None)
        self.codegetter = codegetter
        self.llvm_map = {}
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
        while (len(stack) > 0):
            currentnode = stack[-1]  # get top of stack without popping it

            if currentnode.text == "Function" and currentnode not in visited:
                visited.add(currentnode)
                self.map_table = MapTable(self.map_table)
                self.handleFunction(currentnode)

            childnotvisited = False
            for child in reversed(currentnode.getChildren()):
                if child not in visited:
                    stack.append(child)
                    childnotvisited = True
            if not childnotvisited:
                # print(currentnode.text)  # debug print
                currentnode.accept(self)
                visited.add(currentnode)
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

    def handleFunction(self, node: ASTNode):
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
        print(LLVMSingleton.getInstance().getModule())

        with open('output/output.ll', 'w') as f:
            f.write(str(LLVMSingleton.getInstance().getModule()))

    def handleAssignment(self, node: ASTNode):
        left_child = node.getChild(0)
        store_reg = self.map_table.getEntry(left_child.text).llvm
        right_child = node.getChild(1)
        to_store_reg = self.llvm_map.get(right_child, None)

        dt, ptr = left_child.getSymbolTable().getEntry(left_child.text).getPtrTuple()
        llvm_var = Declaration.assignment(store_reg, to_store_reg, dt, ptr)
        self.llvm_map[node] = llvm_var

    def handleDereference(self, node: ASTNode):
        """
        Handle a dereference
        :param datatype_tup:
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

    def handleComment(self, node: ASTNode):
        comment_text = node.children[0].text
        Declaration.addComment(comment_text)

    def handlePrintf(self, node: ASTNode):
        formatSpecifier = node.children[0].text
        args = []

        # Loop through each child after the format specifier
        for child in node.children[1:]:
            # Get the actual variable or literal node from the dereference chain
            var_node = self.getVariableNode(child)
            if var_node is None:
                print("Error: Unable to find variable node for argument.")
                continue

            if isinstance(var_node, ASTNodeTerminal) and var_node.type == "IDENTIFIER":
                # Get the LLVM IR representation of the variable from the symbol table
                llvm_var = self.map_table.getEntry(var_node.text).llvm
                if llvm_var is not None:
                    args.append(llvm_var)
                else:
                    # Handle case when LLVM IR representation is not found
                    print(f"Error: LLVM IR representation not found for identifier {var_node.text}")
            elif isinstance(var_node, ASTNodeTerminal) and var_node.type in ("INT", "FLOAT", "CHAR"):
                # If the variable node is a literal, use its LLVM IR directly
                llvm_literal = self.llvm_map.get(var_node)
                if llvm_literal is not None:
                    args.append(llvm_literal)
                else:
                    # Handle case when LLVM IR representation is not found
                    print(f"Error: LLVM IR representation not found for literal {var_node.text}")
            else:
                # Handle unsupported or unexpected argument types
                print(f"Error: Unsupported or unexpected argument type encountered: {var_node}")

        # Call Printf.printf() function with the format specifier and arguments
        Printf.printf(formatSpecifier, *args)

    def getVariableNode(self, node):
        """
        Recursive function to get the actual variable or literal node from a chain of dereference nodes.
        """
        if node.text == "Dereference":
            # If the node is a dereference node, recursively get the variable node from its child
            return self.getVariableNode(node.children[0])
        else:
            # If the node is not a dereference node, return the node itself
            return node

    def handleOperations(self, node: ASTNode):
        """
        Handle Arithmetic operations
        :param node:
        :return:
        """

        if node.getChildAmount() == 2:
            pass
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
        print("still need to do")

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

