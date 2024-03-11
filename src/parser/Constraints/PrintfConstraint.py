from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class PrintfConstraint(Constraint):
    """
    Verifies if the typecorrectnes use by each printf function call
    """

    def __init__(self):
        super().__init__()

    def checkNode(self, node: ASTNodeTerminal):
        if node.text == "printf":
            printtype = self.getPrintType(node.children[0].text)
            variabletype = node.children[1].type

            if printtype != variabletype:
                ErrorExporter.invalidOperation(node.children[0].linenr, "printf", printtype, variabletype)

    def getPrintType(self, text):
        if text == "%s":
            return "STRING"
        elif text == "%d" or text == "%x":
            return "INT"
        elif text == "%f":
            return "FLOAT"
        elif text == "%c":
            return "CHAR"
