from src.parser.ASTVisitor import *


class ASTOutput(ASTVisitor):
    """
    Makes a print format output of the yield of the AST
    """
    def __init__(self, round_amount=-1):
        self.output = ""
        self.round_amount = round_amount

    def visit(self, ast: AST):
        self.output = ""
        super().visit(ast)

    def visitNode(self, node: ASTNodeTerminal):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        out = node.text
        if out[0] == "'" and out[-1] == "'":
            out = out[1:-1]

        if node.type == "FLOAT" and self.round_amount > 0:
            out = format(float(out), f".{self.round_amount}f")

        self.output += out + ";"

    def getOutput(self):
        return self.output