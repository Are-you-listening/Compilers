from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *


class IdentifierReplacerVisitor(ASTVisitor):
    def __init__(self):
        self.previousNode = None
        pass

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        toReplace = node.text

        for entry in node.getSymbolTable().symbols.values():
            if entry.name == toReplace:
                if entry.const or entry.firstUsed is None:
                    # the variable is const, so we can replace it with it's value
                    # or the value has not been used before so we can still replace it
                    entry.firstUsed = node
                    if entry.value is not None:
                        node.text = entry.value
                        if entry.getType() == "INT":
                            node.type = "INT"

                        elif entry.getType() == "CHAR":
                            node.type = "CHAR"

                        elif entry.getType() == "FLOAT":
                            node.type = "FLOAT"

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
