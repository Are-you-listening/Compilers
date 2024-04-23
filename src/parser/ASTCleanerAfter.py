from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ASTCleanerAfter(ASTVisitor):
    """
    Cleaner after symbol table is created
    """
    def __init__(self):
        self.operation_handler = COperationHandler()

    def visit(self, ast: AST):
        self.postorder(ast.root)

    def visitNode(self, node: ASTNodeTerminal):
        self.cleanDeclaration(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def cleanDeclaration(node: ASTNode):
        """
        The declaration type of function/declaration is no longer needed
        """
        if node.text not in ("Declaration", "Function", "Parameter"):
            return
        node.removeChild(node.getChild(0))
