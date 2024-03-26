from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class RedefinitionConstraint(Constraint):
    """
    Checks for redefinition or redeclaration of variables
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            print("redef1", node.text)
            if node.symbol_table.exists(node.text):
                print("f2", node.symbol_table.getEntry(node.text).firstDeclared.text)
                if node.symbol_table.getEntry(node.text).firstDeclared != node:
                    if node.parent.text == "Declaration":
                        if node.parent.findChild(node) != 1:  # If it is no rvalue (index 1)
                            print("redef", node.text)
                            self.rejected = True
                            self.errorNode = node

    def throwException(self):
        if self.errorNode is None:
            # this should never happen but who knows
            return
        node = self.errorNode
        ErrorExporter.redefinition(node.linenr, node.symbol_table.getEntry(node.text).getType(), node.text)
