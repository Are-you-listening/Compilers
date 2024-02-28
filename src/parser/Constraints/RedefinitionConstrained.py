from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class RedefinitionConstraint(Constraint):
    """
    Checks for redefinition or redeclaration of variables
    """
    def __init__(self, lexer):
        super().__init__()
        self.lexer = lexer

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == self.lexer.IDENTIFIER:
            if node.symbol_table.exists(node.text):
                if node.symbol_table.getEntry(node.text).firstUsed != node:
                    if node.parent.text=="Declaration":
                        ErrorExporter.redefinition(None,None,node.symbol_table.getEntry(node.text).type,node.text)