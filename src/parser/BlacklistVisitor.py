from src.parser.ASTVisitor import *


class BlacklistVisitor(ASTVisitor):
    """
    This visitor removes blacklist nodes

    """
    def __init__(self):
        self.blacklist = ['(', ')', ';', '{', '}', ',', ':']
        self.to_remove = set()

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.text in self.blacklist:
            self.to_remove.add(node)

    def visit(self, ast: AST):
        self.preorder(ast.root)
        for node in self.to_remove:
            node.parent.removeChild(node)
