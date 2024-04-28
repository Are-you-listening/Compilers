from src.parser.ASTVisitor import *


class VirtualLineVisitor(ASTVisitor):
    def __init__(self):
        """
        Initialize virtual line counter
        """
        self.virtual_line = 1

    def visitNode(self, node: ASTNode):
        """
        Assign virtual line nr
        """
        node.position.virtual_linenr = self.virtual_line

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        Give each line a virtual line nr, which can be used to compare to noes their order
        """
        if node.text == ';':
            self.virtual_line += 1
        node.position.virtual_linenr = self.virtual_line
