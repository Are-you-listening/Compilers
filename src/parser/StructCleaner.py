from src.parser.Tables.SymbolTable import *


class StructCleaner(ASTVisitor):
    """
    This class will massage the struct node into our format
    """

    def __init__(self):
        self.to_remove = set()
        self.structTable = {}  # Keep track of the indices of parameters e.g. {"kaas": ["melk", "fermented"]} melk has index 0, this will be used for adding the GEP instruction in LLVM

    def visit(self, ast: AST):
        self.to_remove = set()

        self.preorder(ast.root)
        for n in self.to_remove:
            n.parent.removeChild(n)

        return self.structTable

    def visitNode(self, node: ASTNode):
        self.__cleanStruct(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def __cleanStruct(self, node: ASTNode):
        if node.text not in ["Struct", "Union"]:
            return

        node.children = node.children[1:]
        structName = node.children[0].text
        node.children[0].type = ""
        self.structTable[structName] = []

        index = 1
        while index < len(node.children):
            child = node.children[index]
            if child.text in ["{", "}", ";", "struct", "union"]:  # Remove unnecessary characters
                self.to_remove.add(child)
            if child.text == "Declaration":  # The first child is the name of the struct; exclude it
                self.structTable[structName].append(child.children[1].text)
            index += 1

        for child in node.children:
            child.type = "STRUCTUNION"

        if node.text == "Union":
            self.structTable[structName].append("union")  # Extra info to later check if it's a union or struct

        BaseTypes.append(structName)
