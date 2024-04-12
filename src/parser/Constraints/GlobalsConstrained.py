from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class UndeclaredConstrained(Constraint):
    """
    Checks for undeclared variables
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        if node.text == "Assignment" and node.getChild(0).symbol_table.isRoot():  # Only implicit declarations are allowed for globals, e.g. int x = 5; is allowed but int x; x = 5; ISN'T
            ErrorExporter.GlobalsNonImplicitDeclaration(node.getChild(0).linenr)

        if node.text == "Declaration":   # Global declarations neither allow assigment of other globals
            if node.getChildAmount() > 1:
                table = node.getChild(1).symbol_table
                if table.isRoot() and table.EntryExists():
                    ErrorExporter.GlobalsInvalidDeclaration(node.getChild(0).linenr)
