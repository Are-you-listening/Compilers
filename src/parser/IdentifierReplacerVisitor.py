import copy
from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType

class IdentifierReplacerVisitor(ASTVisitor):
    def __init__(self):
        self.previousNode = None

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        # if the node is not under a dereference we can never replace it with a value
        # We keep replacing derefs with values until we encounter something that we can't replace
        while node.parent.text == "Dereference" and node.text != "Conversion":
            toReplace = node.text

            """
            the ++, and -- operator should not be evaluated by the value Adder, so we detect those situations
            and if they occur, we will skip this check
            """
            left_up_neighbour = node.parent.getSiblingNeighbour(-1)
            right_up_neighbour = node.parent.getSiblingNeighbour(1)
            pre_incr = (left_up_neighbour is not None and left_up_neighbour.text in ("++", "--"))
            post_incr = (right_up_neighbour is not None and right_up_neighbour.text in ("++", "--"))
            if post_incr or pre_incr:
                return

            if node.type != "IDENTIFIER":
                ErrorExporter.invalidDereference(node.linenr, node.type)
                return

            # get the symbolTable entry of the identifier we are going to replace
            entry = node.getSymbolTable().getEntry(toReplace)

            if not entry.isConst() and entry.firstUsed is not None or entry.is_referenced() or \
                    isinstance(entry.getTypeObject(), FunctionSymbolType):
                return

            # the variable is const, so we can replace it with its value
            # or the value has not been used before, so we can still replace it

            # from now on the identifier has been used,
            # but we only change it if it is actually hasn't been used before
            # we could have also gotten  here just because it is const
            if entry.firstUsed is None:
                entry.firstUsed = node

            """
            In case the value is None
            """
            if entry.value is None:
                ErrorExporter.uninitializedVariable(toReplace, node.linenr)
                return

            if entry.value.text in ("Expr", "Dereference"):
                return

            if entry.value.text == "Conversion":
                """
                This breaks things, the children all need to have a changed symbol table
                """
                temp = copy.deepcopy(entry.value)
                temp.parent = node.parent
                temp.symbol_table = node.symbol_table
                node = temp
            else:
                """
                changes IDENTIFIER -> its type
                """
                node.text = entry.value.text
                if entry.getType() == "INT":
                    node.type = "INT"

                elif entry.getType() == "CHAR":
                    node.type = "CHAR"

                elif entry.getType() == "FLOAT":
                    node.type = "FLOAT"

            # replaces a dereference -> identifier pair with the value of that identifier

            parent = node.parent
            grand_parent = parent.parent
            grand_parent.replaceChild(parent, node)

        return
