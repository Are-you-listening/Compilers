from src.parser.ASTVisitor import *


class VirtualLineVisitor(ASTVisitor):
    def __init__(self):
        self.virtual_line = 1

    def visitNode(self, node: ASTNode):
        node.virtuallinenr = self.virtual_line

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.text == ';':
            self.virtual_line += 1
        node.virtuallinenr = self.virtual_line
