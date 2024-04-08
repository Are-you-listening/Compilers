from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class DeadCodeRemover(ASTVisitor):
    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        self.postorder(ast.root)

        for c in self.to_remove:
            c.parent.removeChild(c)

    def visitNode(self, node: ASTNode):
        pass

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


