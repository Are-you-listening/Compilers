from src.parser.ASTVisitor import *
from src.parser.ASTConversion import *


class SwitchConverter(ASTVisitor):
    """
    This visitor makes sure that the switch statement will be converted to a if else statement
    The receiving format for this visitor will be an SWITCH node with the following children in order:
    node 0: switched value
    all other nodes: ASTnode with name Case or Default
    Case Node: First child: case condition, Second child: code block
    Case Default: First child: code block

    """

    def visit(self, ast: AST):
        """
        override the visit so we can remove after the traverse the nodes we don't need anymore

        :param ast: 
        :return: 
        """
        self.preorder(ast.root)


    def visitNode(self, node: ASTNode):
        if node.text != "SWITCH":
            return

        """
        Remove the 'Switch' keyword child
        """

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
