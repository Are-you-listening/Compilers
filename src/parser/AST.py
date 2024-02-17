from ASTVisitor import *


class ASTNode:
    def __init__(self, text):
        self.children = []
        self.text = text

    def add_children(self, child):
        self.children.append(child)

    def accept(self, v: ASTVisitor):
        v.visitNode(self)


class ASTNodeTerminal(ASTNode):
    def __init__(self, text, type):
        super(ASTNodeTerminal, self).__init__(text)
        self.type = type

    def accept(self, v: ASTVisitor):
        v.visitNodeTerminal(self)

class AST:
    def __init__(self, root):
        self.root = root

    def traverse(self):
        pass
