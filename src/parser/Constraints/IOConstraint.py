from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class IOConstraint(Constraint):
    """

    """

    def __init__(self, includeSTDIO):
        super().__init__()
        self.rejected = False
        self.includeSTDIO = includeSTDIO

    def checkNode(self, node: ASTNode):
        if node.text in ["printf", "scanf", "fgets", "fopen", "fclose", "fputs"]:
            if not self.includeSTDIO:  # Check if stdio is included
                ErrorExporter.undeclaredVariable(node.text, node.position, "function")
            else:
                self.accepted = True

    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def throwException(self):
        self.rejected = True
        exit()

    def isRejected(self):
        return self.rejected
