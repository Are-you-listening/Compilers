from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *
from src.parser.ASTConversion import *


class IncompatibleTypeOperationConstrained(Constraint):
    """
    Checks if the operations are of a compatible type
    """

    def __init__(self, lexer):
        super().__init__()
        self.lexer = lexer
        self.incompatible = {
            "FLOAT": ["%", "|", "&", "~", "CHAR", str(self.lexer.CHAR)],
            "CHAR": ["FLOAT", str(self.lexer.FLOAT)],
            str(self.lexer.FLOAT): ["char"],
            str(self.lexer.CHAR): ["float", "%", "|", "&", "~", "char"]
        }
        self.t = ASTConversion(self.lexer)

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

        t = ASTConversion(self.lexer)
        type = node.type
        if node.type == self.lexer.IDENTIFIER:
            type = node.symbol_table.getEntry(node.text).type
        type = str(type)
        print(type)
        print(ltype)
        print(rtype)
        print("t")


        #if rtype in self.incompatible[ltype]:
            #print(self.incompatible[ltype])
        #print(self.incompatible[ltype])

        #if (ltype in self.incompatible.keys() and rtype in self.incompatible[ltype]) or (rtype in self.incompatible.keys() and ltype in self.incompatible[rtype]):
        #    ErrorExporter.invalidOperation(node.linenr, parent.children[1].text, ltype, rtype)

# 36 float
# 35 char