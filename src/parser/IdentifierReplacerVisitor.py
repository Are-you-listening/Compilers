from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *


class IdentifierReplacerVisitor(ASTVisitor):
    def __init__(self, lexer):
        self.lexer = lexer

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        toReplace = node.text

        for entry in node.getSymbolTable().symbols.values():
            if entry.name == toReplace:
                if entry.const:
                    # the variable is const, so we can replace it with it's value
                    if entry.value is not None:
                        node.text = entry.value
                        if entry.type == "int":
                            node.type = self.lexer.INT

                        elif entry.type == "char":
                            node.type = self.lexer.CHAR

                        elif entry.type == "float":
                            node.type = self.lexer.FLOAT

                        # find the declaration node 1 level higher and replace it with a terminal node
                        parentsiblings = node.parent.parent.children
                        for i in range(len(parentsiblings)):
                            if parentsiblings[i] == node.parent:
                                node.parent = parentsiblings[i].parent
                                parentsiblings[i] = node
                                break

                        pass
                    else:
                        ErrorExporter.uninitializedVariable(toReplace)
                else:
                    #print("variable is not const -> not replacing")
                    pass
            return
