class LLVMNode:
    """
    A node inside the AST
    """
    def __init__(self, text, parent, map_table):
        self.children = []
        self.text = text
        self.parent = parent
        self.map_table = map_table
        self.register = None
        self.type_tup = None
        self.dummy = True

    def addChild(self, node: "LLVMNode"):
        self.children.append(node)
        node.setParent(self)

    def setParent(self, parent: "LLVMNode"):
        self.parent = parent

    def getParent(self):
        return self.parent

    def accept(self, v):
        v.visitNode(self)

    def getMapTable(self):
        return self.map_table

    def addText(self, text: str):
        self.text += '\n'+text

    def store(self, text, map_table):
        self.text = text + self.text
        self.map_table = map_table
        self.dummy = False

    def getChild(self, index) -> "LLVMNode":
        return self.children[index]
