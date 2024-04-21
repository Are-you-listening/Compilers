from src.parser.ASTVisitor import *


class EnumTypeMerger(ASTVisitor):
    """
    Formats declarations with enums to our format.

    E.g. enum IOReader status, 1 new node has the text "enum IOReader"
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        """
        When we create our enum declarations we come across the following type:
        'Type' node with 2 children: 'enum' 'weekday',
        we want to merge those 2 children into 1 child: 'enum weekday'

        :param node:
        :return:
        """
        if node.text != "Declaration":
            return

        if node.children[0].children[0].text != "enum":
            return

        """
        Merge the nodes 'enum' and '<ENUM NAME>' together; e.g. enum IOReader status, 1 new node has the text 
        'enum IOReader'
        """
        type_node = node.children[0]
        line = type_node.children[0].linenr
        table = type_node.children[0].symbol_table
        newname = "enum " + type_node.children[1].text

        """
        Override the type children
        """
        type_node.children = [ASTNodeTerminal(newname, type_node, table, "IDENTIFIER", line, None)]

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
