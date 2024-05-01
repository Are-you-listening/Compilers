from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *
from src.parser.CTypes.COperationHandler import types


class CheckUnaryOps(Constraint):
    """
    Verifies the integrity of the & operator
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        pass

    def checkTerminalNode(self, node: ASTNodeTerminal):
        lsib = node.getSiblingNeighbour(-1)
        if node.text in ("++", "--") and lsib is not None and isinstance(lsib, ASTNodeTerminal):
            if node.getSiblingNeighbour(-1).type in types:
                ErrorExporter.invalidOperation(node.position, node.text, None, None)

    def throwException(self):
        pass
