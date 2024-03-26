from src.parser.ASTVisitor import *


class CodeGetter(ASTVisitor):
    """
    precondition: this class is the first visitor on the AST, ie before any cleaner visitors change the tree
    """

    def __init__(self, ast: AST):
        super().__init__(ast)
        self.codeLines = {}

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.linenr in self.codeLines:
            self.codeLines[node.linenr] += " " + node.text
        else:
            self.codeLines[node.linenr] = node.text
        pass

    def getLine(self, node: ASTNode):
        lineNR = node.linenr
        if node.linenr in self.codeLines:
            return self.codeLines[lineNR]
