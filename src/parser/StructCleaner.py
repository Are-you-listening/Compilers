from src.parser.Tables.StructTable import *
from src.parser.ASTVisitor import *
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.AST import ASTNodeTypes
from src.internal_tools import *


class StructCleaner(ASTVisitor):
    """
    This class will massage the struct node into our format
    """

    def __init__(self):
        self.to_remove = set()
        self.table = StructTable(None)
        self.waiting_structs = {}

    def postorder(self, root: ASTNode):
        """for child in root.children:
            self.postorder(child)
        root.accept(self)"""

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack) - 1
            currentNode = stack[current_index]  # get top of stack without popping it

            if currentNode not in visited and currentNode.text in ("Function", "Code", "Scope"):
                """
                Create a new scope for the children
                """
                temp = StructTable(self.table)
                if self.table is not None:
                    self.table.nextTable(temp)
                self.table = temp

            do_visit = True
            for child in reversed(currentNode.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                currentNode.accept(self)
                stack.pop(current_index)

            visited.add(currentNode)

    def visit(self, ast: AST):
        self.to_remove = set()
        self.waiting_structs = {}
        self.table = StructTable(None)

        self.postorder(ast.root)

        for n in self.to_remove:
            n.parent.removeChild(n)

    def visitNode(self, node: ASTNode):
        node.structTable = self.table
        self.__cleanStruct(node)

        if node.text in ("Function", "Code", "Scope"):
            """
            Go 1 scope back, and make sure the node its scope is recalibrated
            Because function definition needs to be in a global scope
            """
            for k, v in self.waiting_structs.items():
                ErrorExporter.undeclaredTypedef(v[1], k)

            self.waiting_structs = {}

            if self.table.prev is not None:
                self.table = self.table.prev
                node.structTable = self.table

        self.__checkType(node)

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

        is_union = node.text == "Union"
        if is_union:
            self.table.addDataMember(structName, "union")  # Extra info to later check if it's a union or struct

        if structName in self.waiting_structs:
            v = self.waiting_structs[structName]

            self.waiting_structs.pop(structName)

            if not v[0] and not is_union:
                ErrorExporter.invalidStructUnionAssign(node.position, "Union", "Struct")

            if v[0] and is_union:
                ErrorExporter.invalidStructUnionAssign(node.position, "Struct", "Union")

        TypeNodeHandler.getInstance().BaseTypes.append(structName)

    def __checkType(self, node: ASTNode):
        """
        This function checks that a 'Type' node has a struct when needed, and same for union
        """
        if node.text != "Type":
            return
        if isinstance(node, ASTNodeTypes):
            return

        PreConditions.assertNOTEqual(node.getChildAmount(), 0)
        PreConditions.assertInstanceOff(node, ASTNode)

        is_struct = node.getChild(0).text == "struct"
        is_union = node.getChild(0).text == "union"

        if is_struct or is_union:
            is_union2 = node.structTable.isUnion(node.getChild(1).text, node.position, not self.has_ptr(node))
            if is_union2 is None:
                """
                We can have a ptr inside a struct to a struct that is later declared, so if we do not yet have this 
                struct. we will store this for later checks
                """
                self.waiting_structs[node.getChild(1).text] = (is_struct, node.position)
                return

            if is_union and not is_union2:
                ErrorExporter.invalidStructUnionAssign(node.position, "Union", "Struct")

            if is_struct and is_union2:
                ErrorExporter.invalidStructUnionAssign(node.position, "Struct", "Union")

    @staticmethod
    def has_ptr(node: ASTNode):
        """
        Check if a type node is a ptr
        """

        for c in node.children:
            if c.text == "*":
                return True

        return False


