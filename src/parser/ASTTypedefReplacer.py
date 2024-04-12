from src.parser.ASTVisitor import *

BaseTypes = ["INT", "FLOAT", "CHAR", "VOID"]


class TypedefTable:  # Prevent circular inclusion
    pass


class ASTTypedefReplacer(ASTVisitor):
    def __init__(self):
        self.typedefTable = TypedefTable(None)
        self.typedef_table_map = {}
        self.to_remove = []

    def visit(self, ast: AST):

        self.typedefTable = TypedefTable(None)
        self.typedef_table_map = {}
        self.to_remove = []

        self.preorder(ast.root)

        for r in self.to_remove:
            r.parent.removeChild(r)

    def preorder(self, root: ASTNode):
        """root.accept(self)
        for child in root.children:
            self.preorder(child)"""

        """
        function overrides preorder of parent, so It can correctly manage the typedef tables
        """

        stack = [root]
        while len(stack) > 0:
            # pop() takes the last element of the list
            # just keep in mind that the end of the list is the top of the stack
            currentNode = stack.pop()
            currentNode.accept(self)
            # reverse the order of the children because the later the node in the list the sooner it will be visited
            for child in reversed(currentNode.getChildren()):
                stack.append(child)

            """
            make sure to have the typedef of the right scope
            AST terminals do not have a mapped typedef
            """
            if isinstance(currentNode, ASTNodeTerminal):
                continue
            self.typedefTable = self.typedef_table_map[currentNode]

    def visitNode(self, node: ASTNode):
        if node.text == "Function":
            """
            creates new typedef (scope specific)
            """
            new_type_def = TypedefTable(self.typedefTable)
            self.typedefTable.nextTable(new_type_def)
            self.typedefTable = new_type_def

        if node.text == "Typedef":
            """
            when we come across a Typedef, we extend our typedef table with the provided typedef
            """

            """
            add the typedef type subtree to the typedef in the table
            """
            table = self.typedefTable
            table.addTypeDef(node)  # Add it to the table
            self.to_remove.append(node)

        if node.text == "Type" and self.containsNonBaseType(node.children):
            """
            When we have a certain type, we will compare this type with the typedef table, and replace typedefs accordingly
            """
            table = self.typedef_table_map[node.parent]
            table.translate(node)

        """
        make an association between each node and the typedef table
        """
        self.typedef_table_map[node] = self.typedefTable

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def isBaseType(child: ASTNode):
        """
        Check if the node is a BaseType Type Node
        :param child: ASTNode
        :return:
        """
        if child.text in BaseTypes:
            return True
        return False

    @staticmethod
    def getTypeName(children: list):
        """
        Retrieve the identifier string of the type
        :param children: List of AST Nodes
        :return: identifier in string format
        """
        index = 0
        for child in children:
            if child.text != '*' and child.text != "const":
                return child.text, index
            index += 1

    @staticmethod
    def containsNonBaseType(children: list):
        for child in children:
            if child.text != '*' and child.text != "const" and not ASTTypedefReplacer.isBaseType(child):
                return True
        return False


from src.parser.Tables.TypedefTable import TypedefTable