
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

    def setChild(self, index, child):
        self.children[index] = child
        child.parent = self


class ASTNodeTerminal(ASTNode):
    """
    A node inside the AST that contains a terminal
    """
    def __init__(self, text, parent, symbol_table, terminal_type):
        super(ASTNodeTerminal, self).__init__(text, parent, symbol_table)
        self.type = terminal_type

    def accept(self, v: ASTVisitor):
        v.visitNodeTerminal(self)


class AST:
    """Base AST class"""
    def __init__(self, root):
        self.root = root

    def traverse(self):
        pass
