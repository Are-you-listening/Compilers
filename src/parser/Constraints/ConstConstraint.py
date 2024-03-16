from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class ConstConstraint(Constraint):
    """
    Verifies the integrity of the const variables
    """

    def __init__(self):
        super().__init__()
        self.node = None
        self.rejected = False

    def checkNode(self, node: ASTNode):
        self.node = node
        if node.text == "Assignment":
            entry = node.symbol_table.getEntry(
                node.getChild(0).text)
            if node.symbol_table.getEntry(node.getChild(0).text) != None and entry.const:
                if entry.getType() != "PTR":
                    self.rejected = True
        elif node.text == "Dereference":
            UnaryOps = ["++", "--"]

            if node.getSiblingNeighbour(1) is not None:
                if node.getSiblingNeighbour(1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        self.rejected = True

            elif node.getSiblingNeighbour(-1) is not None:
                if node.getSiblingNeighbour(-1).text in UnaryOps:
                    if node.symbol_table.getEntry(node.getChild(0).text).const:
                        self.rejected = True

    def checkTerminalNode(self, node: ASTNodeTerminal):
        entry = node.symbol_table.getEntry(node.text)

        if entry is not None:
            if entry.getType() == "PTR":
                if node.parent.text == "Dereference" and node.parent.parent.text == "Dereference" and node.symbol_table.getEntry(
                        node.text).const:
                    self.node = node.parent
                    self.rejected = True

    def throwException(self):
        ErrorExporter.constComplaint(self.node.getChild(0).linenr, self.node.getChild(0).text, "const")
