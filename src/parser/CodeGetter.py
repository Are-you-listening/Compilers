from src.parser.ASTVisitor import *

class CodeGetter(ASTVisitor):
    """
    precondition: this class is the first visitor on the AST, ie before any cleaner visitors change the tree
    """
    def __init__(self):
        self.codelines = {}

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.linenr in self.codelines:
            self.codelines[node.linenr] += " " + node.text
        else:
            self.codelines[node.linenr] = node.text
        pass

    def getLine(self, node: ASTNodeTerminal):
        lineNR = node.linenr
        if node.linenr in self.codelines:
            return self.codelines[lineNR]
