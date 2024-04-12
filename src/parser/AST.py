import copy


class ASTVisitor:  # Prevent circular inclusion
    pass


class ASTNode:
    """
    A node inside the AST
    """

    def __init__(self, text, parent, symbol_table, linenr, vlinenr):
        self.children = []
        self.text = text
        self.parent = parent
        self.symbol_table = symbol_table
        self.linenr = linenr
        self.virtuallinenr = vlinenr

    def __hash__(self):
        return id(self)

    def __eq__(self, other):
        return id(self) == id(other)

    def addChildren(self, child):
        self.children.append(child)

    def getChild(self, index, block_ignore=True) -> "ASTNode":
        child = self.children[index]

        """
        SKip AST Node Blocks
        """

        if block_ignore:
            while isinstance(child, ASTNodeBlock) and child.text == "Block":
                child = child.getChild(0)

        return child

    def getChildren(self):
        return self.children

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

    def getSiblingNeighbour(self, direction):
        """
        Get access of a simpling
        direction gives the relative direction index:
        direction -1: left sibling, direction 1: right sibling
        :param direction:
        :return:
        """
        index = self.parent.findChild(self)
        index += direction
        if 0 > index or index >= self.parent.getChildAmount():
            return None
        return self.parent.getChild(index, False)

    def addNodeParent(self, node):
        """
        adds a new node as parent of itself
        :return:
        """
        self.parent.replaceChild(self, node)
        self.parent = node
        node.addChildren(self)

    def addNodeChildEmerge(self, node, from_child=None, to_child=None):
        """
        adds a new node as child having all its children
        :return:
        """

        if from_child is None:
            from_index = 0
        else:
            from_index = self.findChild(from_child)

        if to_child is None:
            to_index = len(self.children)
        else:
            to_index = self.findChild(to_child)

        for i, c in enumerate(self.children):
            if i < from_index or i >= to_index:
                continue

            node.addChildren(c)
            c.parent = node

        temp_list = self.children[:from_index]
        temp_list.append(node)
        temp_list.extend(self.children[to_index:])

        self.children = temp_list
        node.parent = self

    def removeChild(self, child):
        self.children.remove(child)

    def replaceChild(self, old_child, new_child):
        new_child.parent = self
        old_child.parent = None
        index = self.children.index(old_child)
        self.children[index] = new_child

    def clearChildren(self):
        self.children = []

    def insertChild(self, index: int, new_child):
        self.children.insert(index, new_child)
        new_child.parent = self

    def typedefReplaceChildren(self, kids, index):
        for kid in kids:
            if kid == kids[0]:
                newKid = copy.deepcopy(kid)
                newKid.symbol_table = kid.symbol_table

                self.replaceChild(self.children[index],
                                  newKid)  # Replace the first one with the first of the new types
            else:  # Simple insert the rest
                newKid = copy.deepcopy(kid)
                self.children.insert(index + 1, newKid)
                newKid.parent = self

    def move(self, to_parent):
        self.parent.removeChild(self)

        to_parent.addChildren(self)

        self.parent = to_parent


class ASTNodeTerminal(ASTNode):
    """
    A node inside the AST that contains a terminal
    """

    def __init__(self, text, parent, symbol_table, terminal_type, linenr, vlinenr):
        super(ASTNodeTerminal, self).__init__(text, parent, symbol_table, linenr, vlinenr)
        self.type = terminal_type

    def accept(self, v: ASTVisitor):
        v.visitNodeTerminal(self)


class ASTNodeBlock(ASTNode):
    def __init__(self, text, parent, symbol_table, linenr, vertex, vlinenr):
        super().__init__(text, parent, symbol_table, linenr, vlinenr)
        self.vertex = vertex
        self.vertex.node_link = self

    def replaceVertex(self, new_vertex):
        self.vertex = new_vertex


class AST:
    """Base AST class"""

    def __init__(self, root):
        self.root = root

    def traverse(self):
        pass


from src.parser.ASTVisitor import *
