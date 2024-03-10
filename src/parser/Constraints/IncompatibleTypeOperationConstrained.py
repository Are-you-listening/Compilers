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
            "PTR": ["+", "/", "*", "^", ">>", "<<", "%", "|", "INT", "FLOAT", "CHAR"],  # - (binary)
            "PTRU": ["~", "-", "+"]  # ! is allowed  , disallowed Unary operands
        }
        self.t = ASTConversion()
        self.rejected = False
        self.type = None

    def getLeftType(self, parent):
        try:
            return str(self.t.getPoorestType(parent.children[0]))
        except:
            return None

    def getRightType(self, parent):
        try:
            if len(parent.children) == 2:
                type = str(self.t.getPoorestType(parent.children[1]))
                if type == "None":
                    return None, parent.children[1].text
                elif type == "PTR" and len(parent.children) == 2:
                    return None, "PTRU"
                return type
            elif len(parent.children) == 3:
                type = str(self.t.getPoorestType(parent.children[2]))
                mtype = str(self.t.getPoorestType(parent.children[1]))
                if mtype == "None":
                    mtype = parent.children[1].text
                return mtype, type
            return None,None
        except:
            return None, None

    def checkTerminalNode(self, node: ASTNodeTerminal):
        parent = node.parent

        if parent.text not in ("Expr", "Declaration", "Assignment"):
            return

        ltype = self.getLeftType(parent)
        temp = self.getRightType(parent)
        mtype = temp[0]
        rtype = temp[1]
        types = [ltype, mtype, rtype]

        if "!" in types and "PTR" in types: # 2 Known exceptions expressions which are still applicable
            return
        elif "-" in types and "PTR" == ltype and ("INT" in types or "CHAR" in types):
            return

        if ltype in self.incompatible.keys() and rtype in self.incompatible[ltype]:
            self.rejected = True
            self.type = ltype
            self.errornode = node
        elif rtype in self.incompatible.keys() and ltype in self.incompatible[rtype]:
            self.rejected = True
            self.type = rtype
            self.errornode = node
        elif ltype in self.incompatible.keys() and mtype in self.incompatible[ltype]:
            self.rejected = True
            self.type = ltype
            self.errornode = node
        elif mtype in self.incompatible.keys() and ltype in self.incompatible[mtype]:
            self.rejected = True
            self.type = mtype
            self.errornode = node
        elif mtype in self.incompatible.keys() and rtype in self.incompatible[mtype]:
            self.rejected = True
            self.type = ltype
            self.errornode = node
        elif rtype in self.incompatible.keys() and mtype in self.incompatible[rtype]:
            self.rejected = True
            self.type = rtype
            self.errornode = node

    def throwException(self):
        node = self.errornode
        operation = node.parent.children[1].text
        if self.type == "PTRU":
            self.type = "PTR"
            operation = node.parent.children[0].text
        ErrorExporter.invalidOperation(node.linenr, operation, self.type, "")
