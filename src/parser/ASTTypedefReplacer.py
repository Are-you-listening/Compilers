from src.parser.ASTVisitor import *

BaseTypes = ["INT", "FLOAT", "CHAR"]


class ASTTypedefReplacer(ASTVisitor):
    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        if node.text == "Type" and self.containsNonBaseType(node.children):
            table = node.typedef_table
            table.translate(node)

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
