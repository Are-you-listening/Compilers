from src.parser.ASTVisitor import *
from src.parser.ASTTableCreator import *


class ASTDereferencer(ASTVisitor):
    """
    Make sure identifiers are dereferenced if needed
    """

    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        self.postorder(ast.root)

        for d in self.to_remove:
            d.parent.removeChild(d)

    def visitNode(self, node: ASTNode):
        if node.text in ("Declaration", "Function", "Assignment", "Parameter"):
            left_child = node.getChild(0)
            if left_child.text == "Dereference":
                super_child = left_child.getChild(0)
                node.replaceChild(left_child, super_child)

        if node.text != "Expr":
            return
        """
        in case we user x[1][2], we still need to dereference this entire subtree
        """
        if node.getChildAmount() == 3 and node.getChild(1).text == "[]":
            temp = ""
            if node.getSiblingNeighbour(-1) is not None:
                temp = node.getSiblingNeighbour(-1).text
            if temp == "&":
                # remove the ampersand and don't add a dereference node
                # node.parent.parent.replaceChild(node.parent, node)
                return

            self.addDereference(node)
            return

        if node.getChildAmount() != 2:
            return

        left_child = node.getChild(0)
        right_child = node.getChild(1)
        if left_child.text == "*":
            ref = self.addDereference(right_child)
            node.parent.replaceChild(node, ref)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        Checks for terminal nodes that are identifiers
        If we found an identifier we do the following
        If it has a & before we will not dereference it
        If it has * or nothing it will be dereferenced
        the Unary operations are not useful anymore and so will be removed

        :param node:
        :return:
        """
        # Temp fix for the dereference on a function call
        if node.type != "IDENTIFIER" or (node.parent != None and node.parent.text == "FunctionCall"):
            return

        sibling_before = node.getSiblingNeighbour(-1)

        if sibling_before is None:
            self.addDereference(node)
            return

        if not isinstance(sibling_before, ASTNodeTerminal):
            self.addDereference(node)
            return

        if sibling_before.text == "&" and node.getSiblingNeighbour(-2) is None:  # Removes the de reference sign
            parent = node.parent

            node.getSymbolTable().reference(node.text)

            parent.removeChild(sibling_before)
            while parent.text in ("Expr", "Literal") and parent.getChildAmount() == 1:
                grand_parent = parent.parent
                grand_parent.replaceChild(parent, node)
                parent = grand_parent
            return

        if sibling_before.text == "*" and node.getSiblingNeighbour(-2) is None:  # Removes the dereference sign
            parent = node.parent

            parent.removeChild(sibling_before)
            #node = self.addDereference(node)

            if not self.isStructPtr(node):
                node = self.addDereference(node)

        new_node = self.addDereference(node)

        """Check if the dereference can replace parent 'literal'/ 'Expr'"""

        parent = new_node.parent
        while parent.text in ("Expr", "Literal") and parent.getChildAmount() == 1:
            grand_parent = parent.parent
            grand_parent.replaceChild(parent, new_node)
            parent = grand_parent

    @staticmethod
    def isStructPtr(node):
        type_entry = node.getSymbolTable().getEntry(node.text)
        if type_entry is None:
            return False
        type_object = type_entry.getTypeObject()

        if isinstance(type_object, SymbolTypePtr):
            pointee = type_object.pts_to
            while isinstance(pointee, SymbolTypePtr):
                pointee = pointee.pts_to
            return isinstance(type_object, SymbolTypePtr) and isinstance(pointee, SymbolTypeStruct)
        else:
            return False


    @staticmethod
    def addDereference(node):
        rsib = node.getSiblingNeighbour(1)
        if rsib is not None:
            if rsib.text == "[]":
                return

        # if node.parent.text == "Expr" and node.symbol_table.getEntry(node.text) is not None:
        #     type_object = node.symbol_table.getEntry(node.text).getTypeObject()
        #     if isinstance(type_object, SymbolTypePtr) and type_object.data_type == "PTR" and isinstance(type_object.pts_to, SymbolTypeStruct):
        #         return node


        new_node = ASTNode("Dereference", None, node.symbol_table, node.linenr, node.virtuallinenr)
        node.addNodeParent(new_node)
        return new_node
