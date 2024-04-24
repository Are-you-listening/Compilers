from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ASTCleanerAfter(ASTVisitor):
    """
    Cleaner after symbol table is created
    """
    def __init__(self):
        self.operation_handler = COperationHandler()
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        self.postorder(ast.root)

        for c in self.to_remove:
            c.parent.removeChild(c)

    def visitNode(self, node: ASTNodeTerminal):
        self.cleanDeclaration(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.cleanReturn(node)

    @staticmethod
    def cleanDeclaration(node: ASTNode):
        """
        The declaration type of function/declaration is no longer needed
        """
        if node.text not in ("Declaration", "Function", "Parameter"):
            return
        node.removeChild(node.getChild(0))

    def cleanReturn(self, node: ASTNodeTerminal):
        """
        Remove the useless 'return' terminal

        """
        if node.text != "return":
            return

        self.to_remove.add(node)
