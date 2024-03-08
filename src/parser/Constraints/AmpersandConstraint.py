from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class AmpersandConstraint(Constraint):
    """
    Verifies the integrity of the const variables
    """

    def __init__(self):
        super().__init__()

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.text == "&":
            rsibl = node.getSiblingNeighbour(1)
            if rsibl.text == "Expr" or node.symbol_table.getEntry(
                    rsibl.text) == None:  # This operation is only applicapble on a single identifier, not on a literal
                ErrorExporter.invalidOperatorPtr("", node.linenr)
                self.rejected = True
