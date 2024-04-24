from src.parser.ASTVisitor import *
from src.parser.ASTTypedefReplacer import *


class TypeMerger(ASTVisitor):
    """
    Formats declarations with enums, structs to our format.

    E.g. enum IOReader status, 1 new node has the text "enum IOReader"
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        """
        When we create our enum declarations we come across the following type:
        'Type' node with 2 children: 'enum' 'weekday',
        we want to merge those 2 children into 1 child: 'enum weekday'

        The same happens for structs.

        :param node:
        :return:
        """
        if node.text != "Type":
            return

        if node.parent.text == "Struct" and node == node.parent.children[0]:   # The first type node is the struct its self
            return

        if node.children[0].type == "STRUCT":
            return

        mergeType = node.children[0].text[0:6]

        if mergeType not in ["enum", "struct"]:
            return

        """
        Merge the nodes 'enum' and '<ENUM NAME>' together; e.g. enum IOReader status, 1 new node has the text 
        'enum IOReader'
        """
        line = node.children[0].linenr
        table = node.children[0].symbol_table
        if mergeType == "struct":
            newname = node.children[1].text
        else:
            newname = mergeType + " " + node.children[1].text

        """
        Override the type children
        """
        oldKids = node.children
        node.children = [ASTNodeTerminal(newname, node, table, "IDENTIFIER", line, None)]
        if len(oldKids) > 2:
            node.children += oldKids[2:]

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
