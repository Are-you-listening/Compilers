from src.parser.ASTVisitor import *


class CodeGetter(ASTVisitor):
    """
    precondition: this class is the first visitor on the AST, ie before any cleaner visitors change the tree
    """

    def __init__(self):
        self.codeLines = {}
        self.lineNrsChecked = []

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type in {"MULTILINE", "SINGLECOMMENT"}:
            return
        if node.linenr in self.codeLines:
            self.codeLines[node.linenr] += " " + str(node.text)
        else:
            self.codeLines[node.linenr] = node.text
        pass

    def getLine(self, node: ASTNode):
        lineNR = node.linenr
        if lineNR in self.lineNrsChecked:
            return
        self.lineNrsChecked.append(lineNR)

        if lineNR in self.codeLines:
            return self.codeLines[lineNR]
