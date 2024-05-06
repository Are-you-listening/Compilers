from src.parser.ASTVisitor import *
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
from src.parser.IdentifierReplacerVisitor import IdentifierReplacerVisitor
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType
from src.parser.Tables.SymbolTypePtr import SymbolTypePtr

class ValueAdderVisitor(ASTVisitor):
    """
    AST visitor that adds identifier values to the symbol table
    """

    def __init__(self):
        self.placeable_list = {}

    def visit(self, ast: AST):
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):
        if node.text in ("Declaration", "Assignment", "printf", "Conversion", "IF", "Return", "WHILE"):

            # there are 2 children: identifier and value

            """
            When printf, return, ... has no children their is nothing to replace
            """
            if node.getChildAmount() == 0:
                return

            if node.inLoop():
                IdentifierReplacerVisitor(True).preorder(node.getChild(0))
                return

            if node.text == "printf":
                for i in range(1, len(node.children)):
                    IdentifierReplacerVisitor(False).preorder(node.getChild(i))
                return

            ident = node.getChild(0)

            self.handlePropagation(node, ident)

        else:
            return

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type != "IDENTIFIER":
            return
        if node.getSymbolTable().getEntry(node.text):
            entry = node.getSymbolTable().getEntry(node.text)
        if entry.firstUsed is None and node != entry.firstDeclared:
            entry.firstUsed = node

    def handlePropagation(self, node: ASTNode, ident):
        if ident.text == "Dereference":
            return

        val = node.getChild(-1)
        if val == ident and node.text == "Declaration":
            # this means that it is a declaration without a value
            return

        entry = ident.getSymbolTable().getEntry(ident.text)
        """
        printF does not have an entry
        """
        if entry is not None:
            entry.value = val
        # If the left side has a dereference this means that it is a pointer,
        # so we only do replacements on the left side and don't change anything in the symbol table

        """
        before here was deprecated code and checks, the code was always True/False so we removed it
        because these situation cannot occur
        """
        # replace all the identifiers in the RHS with their symbol table value
        replacer = IdentifierReplacerVisitor(False)
        replacer.preorder(val)

        # it is possible that some identifiers have been replaced with their values,
        # so we retry the constant folding and see if we are able to get a single value out of it
        constantFolder = ConstantFoldingVisitor()
        constantFolder.postorder(val)

        val = node.getChild(-1)

        """
        printF does not have an entry
        """
        if entry is not None:
            entry.value = val
