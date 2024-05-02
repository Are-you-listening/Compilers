from src.parser.AST import ASTNodeBlock
from src.parser.ASTVisitor import *


class DeadCodeRemover(ASTVisitor):
    def __init__(self):
        self.to_remove = set()
        self.first_block = False
        self.cfg_table = {}
        self.reachable = set()

    def visit(self, ast: AST, cfgs):
        self.to_remove = set()
        self.cfg_table = cfgs
        self.first_block = False
        self.reachable = set()
        self.reachability_list()

        self.postorder(ast.root)


        for c in self.to_remove:
            c.parent.removeChild(c)

    def postorder(self, root: ASTNode):
        """override post order"""

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack)-1
            currentNode = stack[current_index]  # get top of stack without popping it

            if currentNode.text == "Function" and currentNode not in visited:
                self.first_block = True

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

        if isinstance(node, ASTNodeBlock) and node.text == "Block":
            """
            Remove code blocks whose vertex are not reachable from the start of the function
            """
            if node.vertex not in self.reachable:
                node.vertex.remove_edges()
                self.to_remove.add(node)

        self.check_dead_code(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.check_dead_code(node)

    def check_dead_code(self, node: ASTNode):
        """
        Remove deadcode that is unreachable because of a return, continue or break statement

        :param node: node we check
        """

        """
        Approach: We detect a Return, Continue or break -> We will tickle up, and remove everything that comes after 
        the node/ parent node containing
        the terminator
        """
        if isinstance(node, ASTNodeTerminal):
            if node.text not in ("continue", "break"):
                return

        elif node.text != "Return":
            return

        pre_delete_node = node
        while not (isinstance(pre_delete_node, ASTNodeBlock) and pre_delete_node.text in "Block"):
            pre_parent = pre_delete_node.parent
            pre_delete_index = pre_parent.findChild(pre_delete_node)
            for c in pre_parent.children[pre_delete_index + 1:]:
                self.to_remove.add(c)

            pre_delete_node = pre_parent

    def reachability_list(self):
        self.reachable = set()

        for function_name, cfg in self.cfg_table.items():
            stack = [cfg.root]
            self.reachable.add(cfg.root)

            while len(stack) > 0:
                vertex = stack.pop()
                for e in vertex.edges:
                    if e.to_vertex in self.reachable:
                        continue
                    stack.append(e.to_vertex)
                    self.reachable.add(e.to_vertex)

