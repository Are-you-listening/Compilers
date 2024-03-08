from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class UndeclaredConstrained(Constraint):
    """
    Checks for undeclared variables
    """
    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            if not node.symbol_table.exists(node.text):
                self.rejected = True
                self.errornode = node

    def throwException(self):
        if self.errornode is None:
            return
        ErrorExporter.undeclaredVariable(self.errornode.text)
