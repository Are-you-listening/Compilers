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

        # first check if this node is still present in the tree and hasn't been replaced
        for child in node.children:
            if child.parent != node:
                return

        """
        When we come across a Declaration, ... We need to remove 1 dereference node on the left side
        because we assign our value to the mem location not the value
        """
        if node.text in ("Declaration", "Function", "Assignment", "Parameter"):
            self.removeDereference(node.getChild(0), False)

        if node.text != "Expr":
            return

        operator = node.getChild(1).text

        # if we have already moved the ampersand up we detect it here and don't add a dereference node
        if node.getChildAmount() == 4 and node.getChild(0).text == "&" and node.getChild(2).text == "[]":
            node.removeChild(node.getChild(0))
            return

        if node.getChildAmount() == 3 and operator in ("()", "[]"):
            """
            '()' and '[]' are kinda similar to the '&' type, so in these cases we also need to 
            remove the dereference from the value whose 'index' we want to access
            """
            error = True
            if operator == "()":
                error = False

            self.removeDereference(node.getChild(0), error)

            """
            When accessing a [], we still need a dereference
            """
            if operator == "[]":
                self.addDereference(node)
            return

        if node.getChildAmount() != 2:
            return

        if node.getChild(0).text == "&":
            self.removeDereference(node.getChild(1))

            """
            Remove '&' terminal
            """
            self.to_remove.add(node.getChild(0))

            """
            In case we have a 'Expr' node without any children we want to remove it, because it doesn't have any 
            use anymore
            """
            node.parent.replaceChild(node, node.getChild(1))

        if node.getChild(0).text == "*":
            self.addDereference(node.getChild(1))

            """
            Remove '*' terminal
            """
            self.to_remove.add(node.getChild(0))

            """
            In case we have a 'Expr' node without any children we want to remove it, because it doesn't have any 
            use anymore
            """
            node.parent.replaceChild(node, node.getChild(1))

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
        # Temp fix for  dereference on a function call
        if node.type != "IDENTIFIER" or (node.parent is not None and node.parent.text == "FunctionCall"):
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

            # move the ampersand up, otherwise it is removed here and the dereference node is added like usual
            grand_parent = parent.parent
            if grand_parent.text == "Expr" and grand_parent.getChildAmount() == 3 and grand_parent.getChild(1).text == "[]":
                sibling_before.parent = grand_parent
                grand_parent.insertChild(0, sibling_before)
                parent.removeChild(sibling_before)
                grand_parent.replaceChild(parent, node)
                return

        """
        Each identifier gets a dereference node by default, unless it is a Function Call
        """
        self.addDereference(node)

    @staticmethod
    def addDereference(node):
        """
        Add a Dereference node to the parent
        """

        new_node = ASTNode("Dereference", None, node.symbol_table, node.position, node.structTable)
        node.addNodeParent(new_node)
        return new_node

    @staticmethod
    def removeDereference(node: ASTNode, error=True):
        """
        Remove a Dereference, if it is a dereference node
        """

        if node.text == "Dereference":
            super_child = node.getChild(0)
            node.parent.replaceChild(node, super_child)
        elif error:
            ErrorExporter.LValueReference(node.position)
