from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *


class ASTDereferencer(ASTVisitor):
    """
    Make sure identifiers are dereferenced if needed
    """
    def __init__(self):
        pass

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        if node.text in ("Declaration", "Function", "Assignment"):
            left_child = node.getChild(0)
            if left_child.text == "Dereference":
                super_child = left_child.getChild(0)
                node.replaceChild(left_child, super_child)

        if node.text != "Expr":
            return

        if node.getChildAmount() != 2:
            return

        left_child = node.getChild(0)
        right_child = node.getChild(1)

        if left_child.text == "*":
            # if right_child.text == "Expr" or node.symbol_table.getEntry(right_child.text) == None: # This operation is only applicapble on a single identifier, not on a literal or expr/rvalue
            #     ErrorExporter.invalidOperatorPtr("on rvalue", left_child.linenr)

            ref = self.addDereference(right_child)
            node.parent.replaceChild(node, ref)
            node.removeChild(left_child)

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
        if node.type != "IDENTIFIER":
            return

        sibling_before = node.getSiblingNeighbour(-1)

        if sibling_before is None:
            self.addDereference(node)
            return

        if not isinstance(sibling_before, ASTNodeTerminal):
            self.addDereference(node)
            return

        """removes the de reference sign"""
        if sibling_before.text == "&" and node.getSiblingNeighbour(-2) is None:


            parent = node.parent
            parent.removeChild(sibling_before)
            while parent.text in ("Expr", "Literal") and parent.getChildAmount() == 1:
                grand_parent = parent.parent
                grand_parent.replaceChild(parent, node)
                parent = grand_parent
            return

        """removes the de reference sign"""
        if sibling_before.text == "*" and node.getSiblingNeighbour(-2) is None:
            parent = node.parent
            parent.removeChild(sibling_before)
            self.addDereference(node)

        new_node = self.addDereference(node)

        """Check if the dereference can replace parent 'literal'/ 'Expr'"""

        parent = new_node.parent
        while parent.text in ("Expr", "Literal") and parent.getChildAmount() == 1:
            grand_parent = parent.parent
            grand_parent.replaceChild(parent, new_node)
            parent = grand_parent

    @staticmethod
    def addDereference(node):
        new_node = ASTNode("Dereference", None, node.symbol_table)
        node.addNodeParent(new_node)

        return new_node
