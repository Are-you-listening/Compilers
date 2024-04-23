from src.parser.ASTVisitor import *


class DebugVisitor(ASTVisitor):

    def __init__(self):
        pass

    def visitNode(self, node: ASTNode):
        if node.text == "WHILE":
            pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
