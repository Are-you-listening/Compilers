from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class MainFoundConstraint(Constraint):
    """
    constraint to check if a main function is inside the code
    """
    def __init__(self):
        super().__init__()

    def checkNode(self, node: ASTNode):
        pass

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER" and node.text == "main" and node.parent.text == "Function":
            if node.symbol_table.getEntry(node.text).getType() != "INT":
                ErrorExporter.invalidMainType(node.position)
            self.accepted = True
            self.errorNode = node

    def throwException(self):
        if self.errorNode is None:
            ErrorExporter.mainNotFound(Position("", "", ""))
        else:
            ErrorExporter.mainNotFound(self.errorNode.position)
