from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *
from src.parser.ASTConversion import *


class IncompatibleTypeOperationConstrained(Constraint):
    """
    Checks if the operations are of a compatible type
    """

    def __init__(self):
        super().__init__()
        self.incompatible = {
            "FLOAT": ["%", "|", "&", "~", "CHAR"],
            "CHAR": ["FLOAT"],
        }
        self.t = ASTConversion()
        self.rejected = False

    def getLeftType(self, parent):
        return str(self.t.getPoorestType(parent.children[0]))

    def getRightType(self, parent):
        if len(parent.children) >= 2:
            return str(self.t.getPoorestType(parent.children[1]))
        return None

    def checkTerminalNode(self, node: ASTNodeTerminal):
        parent = node.parent

        if parent.text not in ("Expr", "Declaration", "Assignment"):
            return

        ltype = self.getLeftType(parent)
        rtype = self.getRightType(parent)

        if (ltype in self.incompatible.keys() and rtype in self.incompatible[ltype]) or (rtype in self.incompatible.keys() and ltype in self.incompatible[rtype]):
            self.rejected = True
            self.errornode = node

    def throwException(self):
        node = self.errornode
        ErrorExporter.invalidOperation(node.linenr, node.parent.children[1].text, self.getLeftType(node.parent), self.getRightType(node.parent))