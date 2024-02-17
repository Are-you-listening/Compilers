
class ASTVisitor:
    pass

class ASTNode:
    def __init__(self, text, parent):
        self.children = []
        self.text = text
        self.parent = parent

    def add_children(self, child):
        self.children.append(child)

    def getChild(self, index):
        return self.children[index]

    def accept(self, v: ASTVisitor):
        v.visitNode(self)

    def getChildAmount(self):
        return len(self.children)

    def getTerminalAmount(self):
        count = 0
        for child in self.children:
            if isinstance(child, ASTNodeTerminal):
                count += 1

        return count


    def findChild(self, child):
        return self.children.index(child)

    def setChild(self, index, child):
        self.children[index] = child
        child.parent = self


class ASTNodeTerminal(ASTNode):
    def __init__(self, text, parent, type):
        super(ASTNodeTerminal, self).__init__(text, parent)
        self.type = type

    def accept(self, v: ASTVisitor):
        v.visitNodeTerminal(self)

class AST:
    def __init__(self, root):
        self.root = root

    def traverse(self):
        pass

from src.parser.ASTVisitor import *
