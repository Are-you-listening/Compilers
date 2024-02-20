from src.parser.ASTVisitor import *


class ASTOutput(ASTVisitor):
    def __init__(self):
        self.output = ""

    def visit(self, ast: AST):
        self.output = ""
        super().visit(ast)

    def visitNode(self, node: ASTNodeTerminal):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.output += node.text + ";"

    def getOutput(self):
        return self.output