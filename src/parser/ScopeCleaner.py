from src.parser.AST import ASTNodeBlock
from src.parser.ASTVisitor import *


class ScopeCleaner(ASTVisitor):
    """
    Remove Scope Nodes
    """
    def visitNode(self, node: ASTNode):
        if node.text != "Scope":
            return

        scope_index = node.parent.findChild(node)
        for c in reversed(node.children):
            node.parent.insertChild(scope_index, c)
            c.parent = node.parent

        node.parent.removeChild(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

