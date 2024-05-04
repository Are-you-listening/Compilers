from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType
from src.parser.SwitchConverter import SwitchConverter


class CheckForFunction(ASTVisitor):
    def __init__(self):
        self.found = False

    def visit(self, astnode: ASTNode):
        self.postorder(astnode)
        return self.found

    def visitNode(self, node: ASTNode):
        if node.text in ("printf", "scanf"):
            self.found = True

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        entry = node.getSymbolTable().getEntry(node.text)
        if entry and isinstance(entry.getTypeObject(), FunctionSymbolType):
            self.found = True


def declaredPreviously(node: ASTNodeTerminal):
    current_table = node.getSymbolTable().prev
    while current_table is not None:
        if node.text in current_table.symbols:
            return True
        current_table = current_table.prev
    return False


class IdentifierReplacerVisitor(ASTVisitor):
    def __init__(self):
        self.previousNode = None

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        # if the node is not under a dereference node we can never replace it with a value
        # We keep replacing derefs with values until we encounter something that we can't replace
        while node.parent.text == "Dereference" and node.text != "Conversion":
            toReplace = node.text

            if toReplace not in node.getSymbolTable().symbols:
                if node.inLoop() and declaredPreviously(node) and not node.getSymbolTable().getEntry(node.text).isConst():
                    return

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
                ErrorExporter.invalidDereference(node.position, node.type)
                return

            # get the symbolTable entry of the identifier we are going to replace

            entry = node.getSymbolTable().getEntry(toReplace)


            if (not entry.isConst() and (entry.firstUsed is not None and entry.firstUsed != node)) or entry.is_referenced() or \
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
                ErrorExporter.uninitializedVariable(toReplace, node.position)
                return

            if entry.value.text in ("Expr", "Dereference"):
                return

            checker = CheckForFunction()
            if checker.visit(entry.value):
                """
                there is a function call in the value tree of the variable -> so we are not allowed to replace
                """
                return

            if entry.value.position.virtual_linenr >= node.position.virtual_linenr:
                return

            """
            changes IDENTIFIER -> its type,
            We make an exact copy of the subtree its values
            """

            temp = SwitchConverter.createCopy(entry.value)

            temp.parent = node.parent
            temp.symbol_table = node.symbol_table
            node = temp

            # replaces a dereference -> identifier pair with the value of that identifier

            parent = node.parent
            grand_parent = parent.parent
            grand_parent.replaceChild(parent, node)

        return
