from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class RedefinitionConstraint(Constraint):
    """
    Checks for redefinition or redeclaration of variables
    """
    def __init__(self):
        super().__init__()

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            if node.symbol_table.exists(node.text):
                if node.symbol_table.getEntry(node.text).firstDeclared != node:
                    if node.parent.text=="Declaration":
                        self.accepted = True
                        ErrorExporter.redefinition(node.linenr,node.symbol_table.getEntry(node.text).getType(), node.text)