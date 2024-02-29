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

    def getLeftType(self, parent):
        return str(self.t.getPoorestType(parent.children[0]))

    def getRightType(self, parent):
        if len(parent.children) >= 3:
            return str(self.t.getPoorestType(parent.children[2]))
        return None

    def checkTerminalNode(self, node: ASTNodeTerminal):
        parent = node.parent

        if parent.text != "Expr":
            return

        ltype = self.getLeftType(parent)
        rtype = self.getRightType(parent)

        if (ltype in self.incompatible.keys() and rtype in self.incompatible[ltype]) or (rtype in self.incompatible.keys() and ltype in self.incompatible[rtype]):
            ErrorExporter.invalidOperation(node.linenr, parent.children[1].text, ltype, rtype)
            self.accepted = True
