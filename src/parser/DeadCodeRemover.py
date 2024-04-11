from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class DeadCodeRemover(ASTVisitor):
    def __init__(self):
        self.to_remove = set()
        self.first_block = False

    def visit(self, ast: AST):
        self.to_remove = set()
        self.postorder(ast.root)
        self.first_block = False

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
            if self.first_block:
                """
                ignore if the first node inside a function is 'unreachable'
                because is reached at start of function call
                """
                self.first_block = False
                return

            """
            When our block is unreachable (no reverse edges), we will remove this block, and
            Also cascade these changes to other blocks that might only be reachable when this block is reachable
            """

            if len(node.vertex.reverse_edges) == 0:
                node.vertex.remove_edges()
                self.to_remove.add(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        Remove deadcode that is unreachable because of a return, continue or break statement

        :param node: node we check
        """

        """
        Approach: We detect a Return, Continue or break -> We will tickle up, and remove everything that comes after 
        the node/ parent node containing
        the terminator
        """

        if node.text not in ("return", "continue", "break"):
            return

        pre_delete_node = node
        while not (isinstance(pre_delete_node, ASTNodeBlock) and pre_delete_node.text == "Block"):
            pre_parent = pre_delete_node.parent
            pre_delete_index = pre_parent.findChild(pre_delete_node)
            for c in pre_parent.children[pre_delete_index+1:]:
                self.to_remove.add(c)

            pre_delete_node = pre_parent
