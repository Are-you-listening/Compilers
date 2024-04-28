from src.parser.Tables.StructTable import *
from src.parser.ASTVisitor import *
from src.parser.ASTTypedefReplacer import BaseTypes


class StructCleaner(ASTVisitor):
    """
    This class will massage the struct node into our format
    """

    def __init__(self):
        self.to_remove = set()
        self.table = StructTable(None)

    def visit(self, ast: AST):
        self.to_remove = set()

        self.postorder(ast.root)
        for n in self.to_remove:
            n.parent.removeChild(n)

    def visitNode(self, node: ASTNode):
        if node.text in ["Function", "Code"]:
            temp = StructTable(self.table)
            if self.table is not None:
                self.table.nextTable(temp)
            self.table = temp
        else:
            self.__cleanStruct(node)

        node.structTable = self.table

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        node.structTable = self.table

    def __cleanStruct(self, node: ASTNode):
        if node.text not in ["Struct", "Union"]:
            return

        node.children = node.children[1:]
        structName = node.children[0].text
        node.children[0].type = ""
        self.table.add(structName)

        index = 1
        while index < len(node.children):
            child = node.children[index]
            if child.text in ["{", "}", ";", "struct", "union"]:  # Remove unnecessary characters
                self.to_remove.add(child)
            if child.text == "Declaration":  # The first child is the name of the struct; exclude it
                self.table.addDataMember(structName, child.children[1].text)
            index += 1

        for child in node.children:
            child.type = "STRUCTUNION"

        if node.text == "Union":
            self.table.addDataMember(structName, "union")  # Extra info to later check if it's a union or struct

        BaseTypes.append(structName)
