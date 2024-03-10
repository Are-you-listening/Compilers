from src.parser.AST import *

class CodeGetter:
    def __init__(self):
        self.codelines = []

    def loadFile(self, filename):
        with open(filename, 'r') as codefile:
            self.codelines = codefile.readlines()
        codefile.close()

    def getLine(self, node: ASTNodeTerminal):
        lineNR = node.linenr - 1
        if 0 <= lineNR < len(self.codelines):
            return self.codelines[lineNR]
