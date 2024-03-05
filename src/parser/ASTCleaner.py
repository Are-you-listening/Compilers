from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ASTCleaner(ASTVisitor):
    def __init__(self):
        self.operation_handler = COperationHandler()

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNodeTerminal):
        self.cleanComments(node)
        self.cleanLine(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.cleanUseless(node)
        self.cleanEqualSign(node)
        self.cleanEOF(node)

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

    @staticmethod
    def cleanComments(node: ASTNode):
        """
        make sure we put every part of a comment inside the same node
        :param node: AST node that we will check if it is a comment and if so, merge
        :return: Nothing
        """

        if node.text != "Comment":
            return

        resulting_comment = ""
        for child in node.children:
            resulting_comment += child.text

        node.clearChildren()
        comment_node = ASTNodeTerminal(resulting_comment, node, node.getSymbolTable(), "COMMENT")
        node.addChildren(comment_node)

    @staticmethod
    def cleanEOF(node: ASTNode):
        """
        <EOF> is useless
        """
        if node.text != "<EOF>":
            return

        node.parent.removeChild(node)

    @staticmethod
    def cleanLine(node: ASTNode):
        """
        The node 'Line' is useless
        """

        if node.text != "Line":
            return

        line_index = node.parent.findChild(node)

        node.parent.removeChild(node)

        for child in node.children:
            node.parent.insertChild(line_index, child)
