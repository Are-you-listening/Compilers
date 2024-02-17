from abc import abstractmethod

from AST import *

class ASTVisitor:
    def visit(self, root):
        root.accept(self)
        for child in root.children:
            self.visit(child)

    @abstractmethod
    def visitNode(self, node: ASTNode):
        pass

    @abstractmethod
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

class dotVisitor(ASTVisitor):
    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

class constantFoldingVisitor(ASTVisitor):
    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

