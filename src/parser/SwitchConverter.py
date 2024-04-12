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
    def __init__(self):
        self.break_map = {}

    def visit(self, ast: AST):
        """
        override the visit so we can remove after the traverse the nodes we don't need anymore
        self.break_map = {}

        :param ast: 
        :return: 
        """
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):

        """
        Update the break map (indicating if the subtree has a break)
        """

        for c in node.children:
            if c in self.break_map:
                self.break_map[node] = c
                break

        if node.text != "SWITCH":
            return

        """
        Translate all the children to IF Else
        By constantly creating a subtree
        """
        for child in node.children:
            has_break = self.break_map.get(child, None) is not None


        """
        Remove the 'Switch' keyword child
        """

    def visitNodeTerminal(self, node: ASTNodeTerminal):

        if node.text != "break":
            return

        self.break_map[node] = node

    def createEqual(self):
        pass