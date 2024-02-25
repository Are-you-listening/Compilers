from src.parser.ASTVisitor import *

class IdentifierReplacerVisitor(ASTVisitor):
    def __init__(self, lexer):
        self.lexer = lexer

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        toReplace = node.text

        for entry in node.getSymbolTable().symbols:
            if entry.name == toReplace:
                node.text = entry.value

                # don't know how this would interact with const types
                if entry.type == "int":
                    node.type = self.lexer.INT

                elif entry.type == "char":
                    node.type = self.lexer.CHAR

                elif entry.type == "float":
                    node.type = self.lexer.FLOAT
