
class ASTVisitor:
    pass


class ASTNode:
    """
    A node inside the AST
    """
    def __init__(self, text, parent, symbol_table):
        self.children = []
        self.text = text
        self.parent = parent
        self.symbol_table = symbol_table

    def addChildren(self, child):
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

    def findType(self, type: str):
        for child in self.children:
            if child.text == type:
                return child
        return None

    def setChild(self, index, child):
        self.children[index] = child
        child.parent = self

    def getSymbolTable(self):
        return self.symbol_table


class ASTNodeTerminal(ASTNode):
    """
    A node inside the AST that contains a terminal
    """
    def __init__(self, text, parent, symbol_table, terminal_type, operation_type=None):
        super(ASTNodeTerminal, self).__init__(text, parent, symbol_table)
        self.type = terminal_type
        self.operation_type = operation_type

    def accept(self, v: ASTVisitor):
        v.visitNodeTerminal(self)


class AST:
    """Base AST class"""
    def __init__(self, root):
        self.root = root

    def traverse(self):
        pass

from src.parser.ASTVisitor import *
