from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class StructCleanerAfter(ASTVisitor):
    """
    This class will massage the struct node into our format
    """

    def __init__(self, structTable):
        self.structTable = structTable  # Keep track of the indices of parameters e.g. {"kaas": ["melk", "fermented"]} melk has index 0, this will be used for adding the GEP instruction in LLVM

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.text != ".":
            return

        rsib = node.getSiblingNeighbour(1)  # Init some standard data
        lsib = node.getSiblingNeighbour(-1)
        table = node.symbol_table

        """
        Retrieve the name of the struct
        """
        structName = table.getEntry(lsib.text).getTypeObject().data_type

        node.text = "[]"  # Change to gep format
        identifier = rsib.text
        rsib.text = self.structTable[structName].index(identifier)  # Replace the identifier name with the struct index it refers to
        rsib.type = "INT"  # Set the new type to INT



