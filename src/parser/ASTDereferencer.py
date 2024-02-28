from src.parser.ASTVisitor import *


class ASTDereferencer(ASTVisitor):
    """
    Make sure identifiers are dereferenced if needed
    """
    def __init__(self, lexer):
        self.lexer = lexer

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        Checks for terminal nodes that are identifiers
        If we found an identifier we do the following
        If it has a & before we will not dereference it
        If it has * or nothing it will be dereferenced
        the Unary operations are not usefull anymore and so will be removed

        :param node:
        :return:
        """
        if node.type != self.lexer.IDENTIFIER:
            return

        sibling_before = node.getSiblingNeighbour(-1)

        if sibling_before is None:
            return
        if not isinstance(sibling_before, ASTNodeTerminal):
            return

        """removes the de reference sign"""
        if sibling_before.text == "&":
            parent = node.parent
            parent.removeChild(sibling_before)
            return

        """removes the de reference sign"""
        if sibling_before.text == "*":
            parent = node.parent
            parent.removeChild(sibling_before)

        new_node = ASTNode("Dereference", None, node.symbol_table)
        node.addNodeParent(new_node)

        """Check if the dereference can replace parent 'literal'/ 'Expr'"""

        parent = new_node.parent
        while parent.text in ("Expr", "Literal") and parent.getChildAmount() == 1:
            grand_parent = parent.parent
            grand_parent.replaceChild(parent, new_node)
            parent = grand_parent
