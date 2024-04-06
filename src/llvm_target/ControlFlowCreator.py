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
        self.to_move = []
        self.last_vertex = None
        self.to_remove = []
        self.function_node = None

    def visit(self, ast: AST):
        self.control_flow_map = {}
        self.eval_scope_node = None
        self.to_move = []
        self.last_vertex = None
        self.to_remove = []
        self.function_node = None

        self.root = ast.root
        self.postorder(self.root)

        for ast_block, function_node in self.to_move:
            """
            All the blocks we needed to add will be add here, after the hole tree is visited
            """
            ast_block.move(function_node.getChild(1))

        for t in self.to_remove:
            t_children = t.children

            index = t.parent.findChild(t)
            t.parent.removeChild(t)
            for i, child in enumerate(t_children):
                t.parent.insertChild(index+i, child)

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

            current_index = len(stack) - 1
            currentNode = stack[current_index]  # get top of stack without popping it

            if currentNode.text == "Function" and currentNode not in visited:
                """
                Creates a simple function
                """
                self.handleFunction(currentNode)
                self.function_node = currentNode

            if currentNode.text == "Expr" and currentNode.getChildAmount() == 3 and currentNode.getChild(1).text in (
                    "&&", "||"):
                if self.eval_scope_node is None:
                    self.eval_scope_node = currentNode
                    self.eval_first = True

            do_visit = True
            for child in reversed(currentNode.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                currentNode.accept(self)
                stack.pop(current_index)

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
            This will create the general start block of the function
            """

            cf = self.control_flow_map.get(node.getChild(1), None)
            if cf is None:
                cf = ControlFlowGraph()
            self.control_flow_map[node.getChild(1)] = cf

            """
            Create a block with the entire code base being a child
            """
            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), node.parent.linenr, cf.root)
            self.last_vertex = cf.root
            node.getChild(1).addNodeChildEmerge(ast_block)

        """
        Merge the control flow graphs of multiple control flows
        That occur after each other
        """
        merge_list = []
        for child in node.children:
            cf = self.control_flow_map.get(child, None)
            if cf is not None and cf not in merge_list:
                merge_list.append(cf)

        if len(merge_list) > 0:
            """
            Do default merges when a control flow graph exists
            """
            cf = merge_list[0]
            for i, cfg in enumerate(merge_list):
                if i == 0 or cf.isEval():
                    continue
                cf = ControlFlowGraph.default_merge(cf, cfg)

            self.control_flow_map[node] = cf

        if self.eval_scope_node == node:
            """
            Action when the evaluation of an logical expression ends
            """
            cf = self.control_flow_map.get(node, None)
            cf.endEval()

            """
            Search for most recent parent Code/Block
            """
            target_node = node
            while target_node.parent.text not in ("Code", "Block"):

                target_node = target_node.parent

            code_node = target_node.parent

            """
            Add a new block for everything that comes after the logical expression (because we cannot continue in the block before the expression)
            """
            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), node.parent.linenr,
                                     cf.accepting)

            """
            Replace the subtree, that contained the actual expression and replace it by a "PHI" node, 
            indicating a PHI instruction (The PHI instruction will refer to the result calculated in the removed subtree)
            The subtree will still exist in another block, because it will be inserted in de code again
            """
            phi_node = ASTNodeBlock("PHI", node.parent, node.parent.getSymbolTable(), node.parent.linenr, cf.accepting)

            node.parent.replaceChild(node, phi_node)

            """
            Insert subtree in code again, at the position just before the place that uses the PHI
            """
            code_node.children.insert(code_node.findChild(target_node), node)
            node.parent = code_node

            self.last_vertex = cf.accepting
            cf.accepting.use_phi = True

            """
            Put the part after an expression into a new BLOCK
            """
            target_node.parent.addNodeChildEmerge(ast_block, target_node)

            self.to_move.append((ast_block, self.function_node))

            self.eval_scope_node = None

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

            cfg = self.control_flow_map.get(node.getSiblingNeighbour(-1), None)

            """
            Insert an AST BLOCK
            """

            if node.text == "&&":
                block = cfg.accepting
            else:
                block = cfg.reject

            """
            Give the sub expression a new block, and add it to the to move list, to indicate only want to move the block 
            after the traverse (Because the function block is only created at the end) and we don't want to break the 
            traverse structure
            """
            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), node.parent.linenr, block)
            self.last_vertex = block

            """
            Add the block NODE as parent of the subexpression
            """
            node.parent.addNodeChildEmerge(ast_block, node.getSiblingNeighbour(1))

            self.to_move.append((ast_block, self.function_node))

            """
            The node '&&' or '||' has no use anymore so it can be removed,
            When this node is removed an 'Expr' with 1 child remains, which is just useless and not clean
            So this node will also be removed
            """
            self.to_remove.append(node)
            self.to_remove.append(node.parent)

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
            sub_control_graph_right = ControlFlowGraph()

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
