from src.parser.AST import AST
from src.parser.Tables.SymbolTable import *


class DynamicAllocation:

    @staticmethod
    def add_allocation(ast: AST):
        DynamicAllocation.__add_malloc(ast.root)

    @staticmethod
    def __add_malloc(root):
        param_list = [SymbolType("INT", False)]

        """
        Make func type
        """
        char_ptr_type = SymbolTypePtr(SymbolType("CHAR", False), False)

        function_type = FunctionSymbolType(char_ptr_type, param_list)
        symbol_entry = SymbolEntry(function_type, "malloc", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)
