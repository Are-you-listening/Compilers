from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class ConstConstraint(Constraint):
    """
    Verifies the integrity of the const variables
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        if node.text == "Assignment":
            entry = node.symbol_table.getEntry(
                node.getChild(0).text)

            if node.symbol_table.getEntry(node.getChild(0).text) is not None and entry.const:
                if entry.getType() != "PTR":
                    ErrorExporter.constComplaint(node.getChild(0).linenr, node.getChild(0).text, "const")
                    self.rejected = True
        elif node.text == "Dereference":
            UnaryOps = ["++", "--"]

            if node.getSiblingNeighbour(1) is not None:
                if node.getSiblingNeighbour(1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        ErrorExporter.constComplaint(node.getChild(0).linenr, node.getChild(0).text, "const")
                        self.rejected = True

            elif node.getSiblingNeighbour(-1) is not None:
                if node.getSiblingNeighbour(-1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        ErrorExporter.constComplaint(node.getChild(0).linenr, node.getChild(0).text, "const")
                        self.rejected = True

    def checkTerminalNode(self, node: ASTNodeTerminal):
        entry = node.symbol_table.getEntry(node.text)

        if entry is not None:
            if entry.getType() == "PTR":
                if (node.parent.text == "Dereference" and node.parent.parent.text == "Dereference"
                        and node.symbol_table.getEntry(node.text).const):
                    node = node.parent
                    ErrorExporter.constComplaint(node.getChild(0).linenr, node.getChild(0).text, "const")
                    self.rejected = True

    def throwException(self):
        pass
