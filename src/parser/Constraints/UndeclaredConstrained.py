from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class UndeclaredConstrained(Constraint):
    """
    Checks for redefinition or redeclaration of variables
    """
    def __init__(self):
        super().__init__()


    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            if not node.symbol_table.exists(node.text):
                self.accepted = True
                ErrorExporter.undeclaredVariable(node.text)