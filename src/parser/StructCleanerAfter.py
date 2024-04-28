from src.parser.ASTVisitor import *


class StructCleanerAfter(ASTVisitor):
    """
    This class will massage the struct node into our format
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.text != ".":
            return

        node.text = "[]"  # Change to gep format
        node.getSiblingNeighbour(1).type = "INT"  # Set the new type to INT
