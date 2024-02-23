from abc import abstractmethod
from src.parser.AST import *


class Constraint:
    """
    Abstact class to add constraints that will be checked by the constraint checker
    """
    def __init__(self):
        self.accepted = False

    @abstractmethod
    def checkNode(self, node: ASTNode):
        pass

    @abstractmethod
    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def isAccepted(self):
        return self.accepted

    @abstractmethod
    def throwException(self):
        pass
