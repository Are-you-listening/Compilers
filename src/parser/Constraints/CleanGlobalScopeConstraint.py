from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class CleanGlobalScope(Constraint):
    """
    This constraint is to make sure that everything in the global scope is allowed to be there, so no expressions
    for example '1+2;' is not allowed in the global scope
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        if node.text in ["Expr", "FunctionCall", "printf", "scanf"] and node.getSymbolTable().isRoot() and node.parent.text == "Code":
            self.errorNode = node
            self.throwException()

    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def throwException(self):
        self.rejected = True
        ErrorExporter.InvalidGlobalExpression(self.errorNode.linenr)

    def isRejected(self):
        return self.rejected
