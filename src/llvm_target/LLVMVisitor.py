from abc import abstractmethod
from src.llvm_target.LLVMTree import *


class LLVMVisitor:
    """
    Abstract visitor for the AST
    """

    def visit(self, llvm_node: LLVMNode):

        self.preorder(llvm_node)

    def preorder(self, root: LLVMNode):
        root.accept(self)
        for child in root.children:
            self.preorder(child)

    def postorder(self, root: LLVMNode):
        for child in root.children:
            self.postorder(child)
        root.accept(self)

    @abstractmethod
    def visitNode(self, root: LLVMNode):
        pass

