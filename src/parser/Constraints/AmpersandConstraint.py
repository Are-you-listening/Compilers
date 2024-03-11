from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class AmpersandConstraint(Constraint):
    """
    Verifies the integrity of the & operator
    """

    def __init__(self):
        super().__init__()

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.text == "&":
            rsibl = node.getSiblingNeighbour(1)
            if rsibl.text == "Expr" or node.symbol_table.getEntry(
                    rsibl.text) is None:  # This operation is only applicable on a single identifier, not on a
                # literal/expr
                ErrorExporter.invalidOperatorPtr("", node.linenr)
                self.rejected = True
