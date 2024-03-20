from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class AmpersandConstraint(Constraint):
    """
    Verifies the integrity of the & operator
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.text == "&":
            rSibl = node.getSiblingNeighbour(1)
            if rSibl.text == "Expr" and rSibl.children[0].text != "-":  # This operation is only applicable on a single identifier, not on a literal/expr
                ErrorExporter.invalidOperatorPtr("", node.linenr)
                self.rejected = True
