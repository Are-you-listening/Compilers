from abc import abstractmethod
from src.parser.AST import ASTNode, AST, ASTNodeTerminal


class ASTVisitor:
    """
    Abstract visitor for the AST
    """

    def visit(self, ast: AST):
        root = ast.root
        self.preorder(root)

    def preorder(self, root: ASTNode):
        root.accept(self)
        for child in root.children:
            self.preorder(child)

    def postorder(self, root: ASTNode):
        for child in root.children:
            self.postorder(child)
        root.accept(self)

    @abstractmethod
    def visitNode(self, node: ASTNode):
        pass

    @abstractmethod
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
