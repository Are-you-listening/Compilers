from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class MainFoundConstraint(Constraint):
    """
    constraint to check if an main function is inside the code
    """
    def __init__(self):
        super().__init__()

    def checkNode(self, node: ASTNode):
        pass

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER" and node.text == "main" and node.parent.text == "Function":
            self.accepted = True

    def throwException(self):
        ErrorExporter.mainNotFound()

