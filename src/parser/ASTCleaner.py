from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ASTCleaner(ASTVisitor):
    def __init__(self):
        self.operation_handler = COperationHandler()

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.cleanUseless(node)
        self.cleanEqualSign(node)

    def cleanUseless(self, node: ASTNodeTerminal):
        """
        Cleanup the tree by removing nodes(Expr and Literal) that have single child
        """
        parent = node.parent
        if parent is None:
            return

        grand_parent = parent.parent
        if grand_parent is None:
            return

        if parent.getChildAmount() == 1 and (parent.text in ("Literal", "Expr")):
            index = grand_parent.findChild(parent)
            grand_parent.setChild(index, node)
            # Overwrite index of parent with node

            self.visitNodeTerminal(node)

    @staticmethod
    def cleanEqualSign(node: ASTNodeTerminal):
        """
        when having a declaration of an assignment the sign '=' is not needed anymore.
        """

        if node.text == "=":
            node.parent.removeChild(node)
