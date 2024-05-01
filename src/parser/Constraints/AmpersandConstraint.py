from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class AmpersandConstraint(Constraint):
    """
    Verifies the integrity of the & operator
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        pass

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.text == "&":
            rSibl = node.getSiblingNeighbour(1)
            # This operation is only applicable on a single identifier, not on a literal/expr
            if rSibl.text == "Expr" and rSibl.children[0].text not in ["-", "~", "!", "+", "&",
                                                                       "*"]:
                if rSibl.children[1].text != '[]':  # Exclude array operations
                    ErrorExporter.invalidOperatorPtr("", node.position)
                    self.rejected = True

    def throwException(self):
        pass
