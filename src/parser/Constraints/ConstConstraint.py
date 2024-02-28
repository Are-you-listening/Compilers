from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class ConstConstraint(Constraint):
    """
    Verifies the integrity of the const variables
    """
    def checkNode(self, node: ASTNode):
        if node.text == "Assignment":
            if node.symbol_table.getEntry(node.getChild(0).text).const:
                ErrorExporter.constComplaint(node.getChild(0).text, "const")
        elif node.text == "Dereference":
            UnaryOps = ["++","--"]

            if node.getSiblingNeighbour(1) is not None:
                if node.getSiblingNeighbour(1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        ErrorExporter.constComplaint(node.getChild(0).text, "const")

            elif node.getSiblingNeighbour(-1) is not None:
                if node.getSiblingNeighbour(-1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        ErrorExporter.constComplaint(node.getChild(0).text,"const")