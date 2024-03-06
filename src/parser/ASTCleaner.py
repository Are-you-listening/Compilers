from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ASTCleaner(ASTVisitor):
    def __init__(self):
        self.operation_handler = COperationHandler()
        self.to_remove = [] # list of child parent of nodes we need to remove, can't be done directly because loops

    def visit(self, ast: AST):
        root = ast.root
        self.to_remove = []
        self.postorder(root)

        for c, p in self.to_remove:
            p.removeChild(c)

    def visitNode(self, node: ASTNode):
        self.cleanUseless(node)
        self.cleanComments(node)
        self.cleanLine(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.cleanEqualSign(node)
        self.cleanEOF(node)

    def cleanUseless(self, node: ASTNode):

        """
        Cleanup the tree by removing nodes(Expr and Literal) that have single child
        """

        if node is None:
            return

        parent = node.parent
        if parent is None:
            return

        if node.getChildAmount() == 1 and (node.text in ("Literal", "Expr")):
            index = parent.findChild(node)
            parent.setChild(index, node.getChild(0))
            # Overwrite index of parent with node

    def cleanEqualSign(self, node: ASTNodeTerminal):
        """
        when having a declaration of an assignment the sign '=' is not needed anymore.
        """

        if node.text == "=":
            self.to_remove.append((node, node.parent))


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
