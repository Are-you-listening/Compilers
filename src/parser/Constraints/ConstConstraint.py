from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class ConstConstraint(Constraint):
    """
    Verifies the integrity of the const variables
    """
    def __init__(self):
        super().__init__()
        self.node = None

    def checkNode(self, node: ASTNode):
        self.node = node
        if node.text == "Assignment":
            if node.symbol_table.getEntry(node.getChild(0).text).const:
                self.throwExceptionA()
        elif node.text == "Dereference":
            UnaryOps = ["++","--"]

            if node.getSiblingNeighbour(1) is not None:
                if node.getSiblingNeighbour(1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        self.throwExceptionA()

            elif node.getSiblingNeighbour(-1) is not None:
                if node.getSiblingNeighbour(-1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        self.throwExceptionA()

    def throwExceptionA(self):
        self.accepted = True
        ErrorExporter.constComplaint(self.node.getChild(0).linenr, self.node.getChild(0).text, "const")