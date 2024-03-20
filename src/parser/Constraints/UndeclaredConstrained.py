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
                self.errorNode = node

    def checkNode(self, node: ASTNode):
        if node.text == "Assignment":
            self.checkViableAssignment(node)

    def throwException(self):
        if self.errorNode is None:
            return
        ErrorExporter.undeclaredVariable(self.errorNode.text, self.errorNode.linenr)

    def checkViableAssignment(self, node):
        for child in node.children:
            if child.text == "Dereference":  # Go deeper
                self.checkViableAssignment(child)
            elif isinstance(child, ASTNodeTerminal):
                if child.type == "IDENTIFIER":
                    self.checkTerminalNode(child)
            else:
                self.checkViableAssignment(child)
