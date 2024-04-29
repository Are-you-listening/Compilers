from src.parser.ASTVisitor import *


class CodeGetter(ASTVisitor):
    """
    precondition: this class is the first visitor on the AST, ie before any cleaner visitors change the tree
    """

    def __init__(self):
        self.codeLines = {}
        self.highest_line_nrs = {}

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "COMMENT":
            return

        if (node.position.file, node.position.linenr) in self.codeLines.keys():
            self.codeLines[(node.position.file, node.position.linenr)] += " " + str(node.text)
        else:
            self.codeLines[(node.position.file, node.position.linenr)] = node.text
            self.highest_line_nrs[node.position.file] = -1
        pass

    def getLine(self, node: ASTNode):
        position = node.position
        if position is None:
            lineNR = None
            file = None
        else:
            lineNR = node.position.linenr
            file = node.position.file
        if lineNR is None or lineNR <= self.highest_line_nrs[file]:
            return

        output_text = ""
        for line_nr in range(self.highest_line_nrs[file]+1, lineNR+1):
            output_text += f"{self.codeLines.get((file, line_nr), '')} "
        self.highest_line_nrs[file] = lineNR

        """
        Remove last output message next line
        """
        return output_text
