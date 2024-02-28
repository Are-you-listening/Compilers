from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class UndeclaredConstrained(Constraint):
    """
    Checks for redefinition or redeclaration of variables
    """
    def __init__(self, lexer):
        super().__init__()
        self.lexer = lexer

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == self.lexer.IDENTIFIER:
            if not node.symbol_table.exists(node.text):
                ErrorExporter.undeclaredVariable(node.text)