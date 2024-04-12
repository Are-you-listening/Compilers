from src.parser.ASTVisitor import *
from src.parser.ASTConversion import *


class SwitchCleaner(ASTVisitor):
    """
    This visitor makes sure that the switch statement will get a good format
    The final format after this visitor will be an SWITCH node with the following children in order:
    node 0: switched value
    all other nodes: ASTnode with name Case or Default
    Case Node: First child: case condition, Second child: code block
    Case Default: First child: code block

    """

    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        """
        override the visit so we can remove after the traverse the nodes we don't need anymore

        :param ast: 
        :return: 
        """
        self.preorder(ast.root)

        for node in self.to_remove:
            node.parent.removeChild(node)

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
