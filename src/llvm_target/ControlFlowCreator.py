from src.parser.Tables.SymbolTable import *
from src.llvm_target.LLVMSingleton import *
from src.llvm_target.OutputLLVMGenerator import *
from src.llvm_target.ControlFlow.ControlFlowGraph import *


class ControlFlowCreator(ASTVisitor):
    """
    Creates the control flow graph for the code

    """

    def __init__(self):
        self.control_flow_map = {}
        self.eval_scope_node = None
        self.root = None
        self.add_block = []
        self.last_vertex = None
        self.to_remove = []

    def visit(self, ast: AST):
        self.control_flow_map = {}
        self.eval_scope_node = None
        self.add_block = []
        self.last_vertex = None
        self.to_remove = []

        self.root = ast.root
        self.postorder(self.root)

        for t in self.to_remove:
            t_children = t.children

            index = t.parent.findChild(t)
            t.parent.removeChild(t)

            for i, child in enumerate(t_children):
                t.parent.insertChild(index+i, child)

        for ast_block, node in self.add_block:
            node.addNodeParent(ast_block)

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
                self.handleFunction(currentNode)

            if currentNode.text == "Expr" and currentNode.getChildAmount() == 3 and currentNode.getChild(1).text in (
                    "&&", "||"):
                if self.eval_scope_node is None:
                    self.eval_scope_node = currentNode
                    self.eval_first = True

            childNotVisited = False
            for child in reversed(currentNode.getChildren()):
                if child not in visited and child not in stack:
                    stack.append(child)
                    childNotVisited = True
            if not childNotVisited:
                currentNode.accept(self)
                stack.pop()

            visited.add(currentNode)

    def visitNode(self, node: ASTNode):
        """
        Check all the children and take the child control flow graph

        :param node:
        :return:
        """

        if node.text == "Expr":
            self.handleOperations(node)

        if node.text == "Function":
            """
            Add a block for start function
            """
            cf = self.control_flow_map.get(node.getChild(1), None)
            if cf is None:
                cf = ControlFlowGraph()
            self.control_flow_map[node.getChild(1)] = cf

            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), node.parent.linenr, cf.root)
            self.last_vertex = cf.root
            self.add_block.append((ast_block, node.getChild(0)))

        merge_list = []
        for child in node.children:
            cf = self.control_flow_map.get(child, None)
            if cf is not None and cf not in merge_list:
                merge_list.append(cf)

        if len(merge_list) == 1:
            cf = merge_list[0]
            self.control_flow_map[node] = cf
        elif len(merge_list) >= 2:
            cf = merge_list[0]
            for i, cfg in enumerate(merge_list):
                if i == 0:
                    continue
                cf = ControlFlowGraph.default_merge(cf, cfg)

            self.control_flow_map[node] = cf

        if self.eval_scope_node == node:
            pass
            cf = self.control_flow_map.get(node, None)
            cf.endEval()

            """
            Add a block before the next node starts
            """

            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), node.parent.linenr,
                                     cf.accepting)
            self.last_vertex = cf.accepting

            cf.accepting.use_phi = True

            self.add_block.append((ast_block, node))

            self.eval_scope_node = None
            self.eval_first = False

        if node.text == "Start" and self.control_flow_map.get(node, None) is None:
            self.control_flow_map[node] = ControlFlowGraph()

    def visitNodeTerminal(self, node: ASTNodeTerminal):

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

            cfg = self.control_flow_map.get(node.getSiblingNeighbour(-1), None)

            """
            Insert an AST BLOCK
            """

            if node.text == "&&":
                block = cfg.accepting
            else:
                block = cfg.reject

            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), node.parent.linenr, block)
            self.last_vertex = block

            self.add_block.append((ast_block, node))

    @staticmethod
    def handleFunction(node: ASTNode):
        """
        Create a new function

        :param node: the function node
        :return:
        """
        var_child: ASTNode = node.getChild(0)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()

        Declaration.function(var_child.text, data_type, ptrs)

    def handleOperations(self, node: ASTNode):
        """
        Handle operation !
        :param node:
        :return:
        """

        if node.getChildAmount() == 2:
            operator_child = node.getChild(0)
            operator = operator_child.text
            """
            when ! is inside a logical expression
            """
            sub_control_graph_right = self.control_flow_map.get(node.getChild(1), None)
            if operator == "!" and self.eval_scope_node is not None and sub_control_graph_right is not None:
                own_sub_control = ControlFlowGraph.mergeLogicalNot(sub_control_graph_right)
                self.to_remove.append(operator_child)
                self.to_remove.append(node)

                self.control_flow_map[node.getChild(0)] = own_sub_control
                self.control_flow_map[node.getChild(1)] = own_sub_control

        if node.getChildAmount() == 3:

            """
            do special ControlFlow changes for logical operations
            """

            operator_child = node.getChild(1)
            operator = operator_child.text

            if operator in ("&&", "||"):
                """
                fot logical operations we make new blocks, for the control flow, and we use the control flow graph
                bottom up to create this correctly
                """
                if operator == "&&":
                    """
                    add a logical 'AND' component to the control flow graph
                    """
                    self.handleLogicalOperations(operator_child)

                if operator == "||":
                    """
                    add a logical 'OR' component to the control flow graph
                    """
                    self.handleLogicalOperations(operator_child)

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
