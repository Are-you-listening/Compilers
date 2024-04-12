from src.parser.ASTVisitor import *


class BlacklistVisitor(ASTVisitor):
    """
    This visitor removes blacklist nodes

    """
    def __init__(self):
        self.blacklist = ['(', ')', ';', '{', '}', ',', ':']

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        index = 0
        if node.text in self.blacklist:
            for child in node.parent.children:
                if child == node:
                    node.parent.children.pop(index)
                    node.parent = None
                    break
                index += 1
