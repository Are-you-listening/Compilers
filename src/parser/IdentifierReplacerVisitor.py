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

        if node.type != "IDENTIFIER":
            return

        # get the symbolTable entry of the identifier we are going to replace
        entry = node.getSymbolTable().getEntry(toReplace)

        if entry.const or entry.firstUsed is None:
            # the variable is const, so we can replace it with its value
            # or the value has not been used before, so we can still replace it

            # from now on the identifier has been used
            entry.firstUsed = node

            if entry.value is not None:
                node.text = entry.value
                if entry.getType() == "INT":
                    node.type = "INT"

                elif entry.getType() == "CHAR":
                    node.type = "CHAR"

                elif entry.getType() == "FLOAT":
                    node.type = "FLOAT"

                # replaces the dereference -> identifer with the value of the identifier
                parentsiblings = node.parent.parent.children
                for i in range(len(parentsiblings)):
                    if parentsiblings[i] == node.parent:
                        node.parent = parentsiblings[i].parent
                        parentsiblings[i] = node
                        break

            else:
                ErrorExporter.uninitializedVariable(toReplace)
        else:
            # print("variable is not const -> not replacing")
            pass
        return
