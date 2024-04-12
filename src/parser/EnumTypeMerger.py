from src.parser.ASTVisitor import *


class EnumTypeMerger(ASTVisitor):
    """
    Formats declarations with enums to our format.

    E.g. enum IOReader status, 1 new node has the text "enum IOReader"
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        if node.text != "Declaration":
            return

        if node.children[0].children[0].text != "enum":
            return

        # Merge the nodes 'enum' and '<ENUM NAME>' together; e.g. enum IOReader status, 1 new node has the text "enum IOReader"
        typeNode = node.children[0]
        line = typeNode.children[0].linenr
        table = typeNode.children[0].symbol_table
        newname = "enum " + typeNode.children[1].text
        typeNode.children = [ASTNodeTerminal(newname, typeNode, table, "IDENTIFIER", line)]

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
