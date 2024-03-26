import copy
from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *


class IdentifierReplacerVisitor(ASTVisitor):
    def __init__(self, ast: AST):
        super().__init__(ast)
        self.previousNode = None

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        # if the node is not under a dereference we can never replace it with a value
        # We keep replacing derefs with values until we encounter something that we can't replace
        while node.parent.text == "Dereference" and node.text != "Conversion":
            toReplace = node.text

            if node.type != "IDENTIFIER":
                return

            # get the symbolTable entry of the identifier we are going to replace
            entry = node.getSymbolTable().getEntry(toReplace)

            if entry.const or entry.firstUsed is None:
                # the variable is const, so we can replace it with its value
                # or the value has not been used before, so we can still replace it

                # from now on the identifier has been used,
                # but we only change it if it is actually hasn't been used before
                # we could have also gotten  here just because it is const
                if entry.firstUsed is None:
                    entry.firstUsed = node

                if entry.value is not None:
                    if entry.value.text in ("Expr", "Dereference"):
                        return
                    if entry.value.text == "Conversion":
                        temp = copy.deepcopy(entry.value)
                        temp.parent = node.parent
                        temp.symbol_table = node.symbol_table
                        node = temp
                    else:
                        node.text = entry.value.text
                        if entry.getType() == "INT":
                            node.type = "INT"

                        elif entry.getType() == "CHAR":
                            node.type = "CHAR"

                        elif entry.getType() == "FLOAT":
                            node.type = "FLOAT"

                    # replaces a dereference -> identifier pair with the value of that identifier
                    parentSiblings = node.parent.parent.children
                    for i in range(len(parentSiblings)):
                        if parentSiblings[i] == node.parent:
                            node.parent = parentSiblings[i].parent
                            parentSiblings[i] = node
                            break

                else:
                    ErrorExporter.uninitializedVariable(toReplace, node.linenr)
                    break
            else:
                # print("variable is not const -> not replacing")
                break
        return
