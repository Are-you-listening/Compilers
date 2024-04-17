from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class ArrayCleaner(ASTVisitor):
    """
    This class will check if their exists an array node for a declaration ex: int a[5], and translate it
    to a type in ex: -> int* a, we will still need to take into account, how much memory we need to allocate
    We do this by making the type look like the following
    Type -> subtrees: 'int', ('*', with type: ARRAY_5 (size), to encode our array size)
    """

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
