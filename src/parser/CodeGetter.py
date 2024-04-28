from src.parser.ASTVisitor import *


class CodeGetter(ASTVisitor):
    """
    precondition: this class is the first visitor on the AST, ie before any cleaner visitors change the tree
    """

    def __init__(self):
        self.codeLines = {}
        self.highest_line_nr = -1

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type in {"MULTILINE", "SINGLECOMMENT"}:
            return

        if node.position.linenr in self.codeLines.keys():
            self.codeLines[node.position.linenr] += " " + str(node.text)
        else:
            self.codeLines[node.position.linenr] = node.text
        pass

    def getLine(self, node: ASTNode):
        lineNR = int(node.position.linenr)
        if lineNR is None or lineNR <= self.highest_line_nr:
            return

        output_text = ""
        for line_nr in range(self.highest_line_nr+1, lineNR+1):
            output_text += f"{self.codeLines.get(line_nr, '')} "
        self.highest_line_nr = lineNR

        """
        Remove last output message next line
        """
        return output_text
