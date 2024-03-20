from src.parser.AST import *


class Constraint:
    """
    Abstract class to add constraints that will be checked by the constraint checker
    """
    def __init__(self):
        self.accepted = False
        # if self.rejected is None, this means that it is not needed for this constraint
        self.rejected = None
        self.errorNode = None

    @abstractmethod
    def checkNode(self, node: ASTNode):
        pass

    @abstractmethod
    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def isAccepted(self):
        return self.accepted

    def isRejected(self):
        return self.rejected

    @abstractmethod
    def throwException(self):
        pass
