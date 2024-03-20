from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class PrintfConstraint(Constraint):
    """
    Verifies the correct type was used for each printf function call
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.text == "printf":
            printType = self.getPrintType(node.children[0].text)
            variableType = node.children[1].type

            if printType != variableType:
                ErrorExporter.invalidOperation(node.children[0].linenr, "printf", printType, variableType)
                sys.exit()

    @staticmethod
    def getPrintType(text):
        if text == "%s":
            return "STRING"
        elif text == "%d" or text == "%x":
            return "INT"
        elif text == "%f":
            return "FLOAT"
        elif text == "%c":
            return "CHAR"
