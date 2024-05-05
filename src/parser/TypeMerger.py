from src.parser.ASTTypedefReplacer import *
from src.parser.AST import ASTNodeTypes

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

        if isinstance(node, ASTNodeTypes):
            return

        if node.parent.text in ["Struct", "Union"] and node == node.parent.children[0]:   # The first type node is the struct its self
            return

        if node.children[0].type in ["STRUCTUNION"]:
            return

        mergeType = node.children[0].text[0:6]

        if mergeType not in ["enum", "struct", "union"]:
            return

        """
        Merge the nodes 'enum' and '<ENUM NAME>' together; e.g. enum IOReader status, 1 new node has the text 
        'enum IOReader'
        """
        position = node.children[0].position
        table = node.children[0].symbol_table
        if mergeType in ["struct", "union"]:
            newname = node.children[1].text
        else:
            newname = f"{mergeType} {node.children[1].text}"

        """
        Override the type children
        """
        oldKids = node.children
        node.children = [ASTNodeTerminal(newname, node, table, "IDENTIFIER", position, node.structTable)]
        if len(oldKids) > 2:
            node.children += oldKids[2:]

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
