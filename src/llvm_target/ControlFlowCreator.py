from src.parser.Tables.SymbolTable import *
from src.llvm_target.OutputLLVMGenerator import *
from src.llvm_target.ControlFlow.ControlFlowGraph import *
from src.parser.AST import ASTNodeBlock
from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import ErrorExporter


class ControlFlowCreator(ASTVisitor):
    """
    Creates the control flow graph for the code

    """

    def __init__(self):
        self.control_flow_map = {}
        self.eval_scope_node = None
        self.root = None
        self.to_remove = set()

        """
        Maps function name to its corresponding control flow graph
        """
        self.function_map = {}

    def visit(self, ast: AST):
        self.control_flow_map = {}
        self.eval_scope_node = None
        """
        Maps function name to its corresponding control flow graph
        """
        self.function_map = {}

        self.to_remove = set()

        self.root = ast.root
        self.postorder(self.root)

        self.move_blocks()

        """
        Remove the nodes itself, but keep their children, and make the children
        part of the children of the parent of the node we remove
        """
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

            if currentNode.text == "Expr" and currentNode.getChildAmount() == 3 and currentNode.getChild(1).text in (
                    "&&", "||"):
                if self.eval_scope_node is None:
                    self.eval_scope_node = currentNode

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
            if node.getChildAmount() < 3:
                return
            cf, is_new = self.get_make_cfg(node.getChild(2))

            if len(cf.abnormal_terminator_nodes["BREAK"]) > 0:
                ErrorExporter.invalidBreak(cf.abnormal_terminator_nodes["BREAK"][0].abnormally_ended_position)
            if len(cf.abnormal_terminator_nodes["CONTINUE"]) > 0:
                ErrorExporter.invalidContinue(cf.abnormal_terminator_nodes["CONTINUE"][0].abnormally_ended_position)

            self.control_flow_map[node.getChild(2)] = cf
            ControlFlowGraph.check_return_statement(cf)

            """
            Create a block with the entire code base being a child
            """

            ast_block = ASTNodeBlock("Block", node, node.getSymbolTable(), cf.root, node.position, node.structTable)
            ast_block2 = ASTNodeBlock("Block", node, node.getSymbolTable(), cf.root, node.position, node.structTable)

            node.getChild(1).addNodeParent(ast_block)
            node.getChild(2).addNodeChildEmerge(ast_block2)

            """
            Map CFG for function
            """
            self.function_map[node.getChild(0).text] = cf

        """
        With an IF statement 2 situations occur:
        - Single IF statement
        - If Else Statement
        """
        if node.text == "IF":
            self.handleIf(node)

        if node.text == "WHILE":
            self.handleWhile(node)

        if node.text == "Return":
            new_cfg = ControlFlowGraph()

            new_cfg.root.abnormally_ended_position = node.position
            new_cfg.add_abnormal_terminator("RETURN", new_cfg.root)

            self.control_flow_map[node] = new_cfg

        """
        Merge the control flow graphs of multiple control flows
        That occur after each other
        """
        if self.control_flow_map.get(node, None) is None:

            merge_list = []
            for child in node.children:
                cf = self.control_flow_map.get(child, None)
                if cf is not None and cf not in merge_list and cf not in self.function_map.values():
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
            self.handle_eval_scope_end(node)

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
            ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), block, node.parent.position, node.parent.structTable)

            """
            Add the block NODE as parent of the subexpression
            """
            node.parent.addNodeChildEmerge(ast_block, node.getSiblingNeighbour(1))

            """
            The node '&&' or '||' has no use anymore so it can be removed,
            When this node is removed an 'Expr' with 1 child remains, which is just useless and not clean
            So this node will also be removed
            """
            self.to_remove.add(node)
            self.to_remove.add(node.parent)

        if node.text == "break":
            new_cfg = ControlFlowGraph()

            new_cfg.root.abnormally_ended_position = node.position
            new_cfg.add_abnormal_terminator("BREAK", new_cfg.root)

            self.control_flow_map[node] = new_cfg

        if node.text == "continue":
            new_cfg = ControlFlowGraph()

            new_cfg.root.abnormally_ended_position = node.position
            new_cfg.add_abnormal_terminator("CONTINUE", new_cfg.root)

            self.control_flow_map[node] = new_cfg

    @staticmethod
    def handleFunction(node: ASTNode):
        """
        Create a new function

        :param node: the function node
        :return:
        """
        var_child: ASTNode = node.getChild(0)
        function_type = None
        current_table = node.getSymbolTable()
        while current_table is not None:
            type_entry = current_table.getEntry(var_child.text)
            if type_entry:
                function_type = type_entry.getTypeObject()
                while isinstance(function_type, SymbolTypePtr):
                    function_type = function_type.pts_to
                if isinstance(function_type, FunctionSymbolType):
                    break
            current_table = current_table.prev

        args = function_type.getParameterTypes()

        if LLVMSingleton.getInstance().getFunction(var_child.text) is None:
            Declaration.function(var_child.text, function_type.return_type, args)

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
                self.to_remove.add(operator_child)
                self.to_remove.add(node)

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
        return self.function_map

    def handle_eval_scope_end(self, node: ASTNode):
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
        ast_block = ASTNodeBlock("Block", node.parent, node.parent.getSymbolTable(), cf.accepting, node.parent.position,
                                 node.parent.structTable)

        """
        Replace the subtree, that contained the actual expression and replace it by a "PHI" node, 
        indicating a PHI instruction (The PHI instruction will refer to the result calculated in the removed subtree)
        The subtree will still exist in another block, because it will be inserted in de code again
        """
        phi_node = ASTNodeBlock("PHI", node.parent, node.parent.getSymbolTable(), cf.accepting, node.parent.position, node.parent.structTable)

        node.parent.replaceChild(node, phi_node)

        """
        Insert subtree in code again, at the position just before the place that uses the PHI
        """
        code_node.children.insert(code_node.findChild(target_node), node)
        node.parent = code_node

        """
        Put the part after an expression into a new BLOCK
        """
        target_node.parent.addNodeChildEmerge(ast_block, target_node)

        self.eval_scope_node = None

    def get_make_cfg(self, node):
        """
        Get the control flow graph of the node, if the node does not have a CFg, create one

        :param node:
        :return:
        """

        cf = self.control_flow_map.get(node, None)

        is_new = False

        if cf is None:
            cf = ControlFlowGraph()
            is_new = True

        return cf, is_new

    def move_blocks(self):
        """
        Do preorder traverse BFS to move 'Block' under the 'Code' node of the function it belongs to
        """

        stack = [self.root]
        visited = set()

        to_move = []
        function_node = None

        while len(stack) > 0:
            # pop() takes the last element of the list
            # just keep in mind that the end of the list is the top of the stack
            currentNode = stack.pop()

            if currentNode.text == "Function":
                function_node = currentNode

            if isinstance(currentNode, ASTNodeBlock) and currentNode.text == "Block":
                """
                If a block has no children, it means that the block does nothing, so in these cases we will
                just skip this block
                """
                to_move.append((currentNode, function_node))

            visited.add(currentNode)

            for child in reversed(currentNode.getChildren()):
                if child not in visited and child not in stack:
                    stack.append(child)

        for ast_block, function_node in to_move:
            """
            All the blocks we needed to add will be add here, after the hole tree is visited
            """

            ast_block.move(function_node.getChild(function_node.getChildAmount()-1))

    def handleIf(self, node: ASTNode):
        """
        Handle if statement node
        :return:
        """
        if_cfg, is_new = self.get_make_cfg(node.getChild(1))

        """
        Create block for if statement
        """
        ast_block = ASTNodeBlock("Block", node, node.getSymbolTable(), if_cfg.root, node.position,  node.structTable)
        node.getChild(1).addNodeParent(ast_block)
        else_cfg = None

        """
        In case we also have an 'Else' part  
        """
        if node.getChildAmount() == 3:
            else_cfg, is_new = self.get_make_cfg(node.getChild(2))

            """
            Create block for else statement
            """
            ast_block = ASTNodeBlock("Block", node, node.getSymbolTable(), else_cfg.root, node.position,  node.structTable)
            node.getChild(2).addNodeParent(ast_block)

        final_cfg = ControlFlowGraph.if_statement(if_cfg, else_cfg)

        """
        the 'IF' node is not needed anymore
        """
        self.to_remove.add(node)

        """
        Add block for after the if statement
        """
        self.add_after(node, final_cfg)

        self.control_flow_map[node] = final_cfg

    def handleWhile(self, node: ASTNode):
        loop_cfg, is_new = self.get_make_cfg(node.getChild(1))
        original_root = loop_cfg.root

        final_cfg, condition_vertex = ControlFlowGraph.while_statement(loop_cfg, node.getChild(0).text == "1")

        """
        Create block for condition
        """
        ast_block = ASTNodeBlock("Block", node, node.getSymbolTable(), condition_vertex, node.position, node.structTable)

        condition_node = node.getChild(0)
        condition_node.addNodeParent(ast_block)

        """
        Create block for inside the while loop
        """
        ast_block = ASTNodeBlock("Block", node, node.getSymbolTable(), original_root, node.position,  node.structTable)

        loop_node = node.getChild(1)
        loop_node.addNodeParent(ast_block)

        """
        Create a block for after the loop
        """

        self.add_after(node, final_cfg)

        """
        remove the node with the name "WHILE"
        """
        self.to_remove.add(node)

        self.control_flow_map[node] = final_cfg

    def add_after(self, node: ASTNode, final_cfg: ControlFlowGraph):
        """
                Search for most recent parent Code/Block, To determine which nodes
                will be checked after the if statement is done. This is in another block, so we need to add a Block node
                After our if statement
                """

        target_node = node
        while target_node.parent.text not in ("Code", "Block"):
            target_node = target_node.parent

        code_node = target_node.parent

        """
        Put the code coming after this statement in a seperate block
        """
        after = target_node.getSiblingNeighbour(1)

        ast_block = ASTNodeBlock("Block", code_node, code_node.getSymbolTable(), final_cfg.accepting, code_node.position, code_node.structTable)

        if after is not None:

            """
            When this loop occurs, It means a block will be changed by another block, so we will
            Remove its block from the control flow graph and from our code
            """
            while isinstance(after, ASTNodeBlock) and after.getChildAmount() > 0:
                if after.vertex is not None:
                    final_cfg.remove_vertex(after.vertex)
                    after.vertex = None

                code_node = after
                self.to_remove.add(after)

                after = after.getChild(0, False)

            code_node.addNodeChildEmerge(ast_block, after)
        else:
            """
            Put block at the end
            """
            code_node.addChildren(ast_block)
