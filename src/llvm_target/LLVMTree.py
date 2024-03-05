class LLVMNode:
    """
    A node inside the AST
    """
    def __init__(self, text, parent):
        self.children = []
        self.text = text
        self.parent = parent

    def addChild(self, node: "LLVMNode"):
        self.children.append(node)
        node.setParent(self)

    def setParent(self, parent: "LLVMNode"):
        self.parent = parent

    def getParent(self):
        return self.parent

    def accept(self, v):
        v.visitNode(self)
