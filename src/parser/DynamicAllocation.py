from src.parser.AST import AST
from src.parser.Tables.SymbolTable import *


class DynamicAllocation:

    @staticmethod
    def add_allocation(ast: AST):
        DynamicAllocation.__add_malloc(ast.root)
        DynamicAllocation.__add_calloc(ast.root)
        DynamicAllocation.__add_free(ast.root)
        DynamicAllocation.__add_realloc(ast.root)

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

    @staticmethod
    def __add_calloc(root):
        param_list = [SymbolType("INT", False), SymbolType("INT", False)]

        """
        Make func type
        """
        char_ptr_type = SymbolTypePtr(SymbolType("CHAR", False), False)

        function_type = FunctionSymbolType(char_ptr_type, param_list)
        symbol_entry = SymbolEntry(function_type, "calloc", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)

    @staticmethod
    def __add_free(root):

        param_list = [SymbolTypePtr(SymbolType("CHAR", False), False)]

        """
        Make func type
        """
        function_type = FunctionSymbolType(SymbolType("VOID", False), param_list)
        symbol_entry = SymbolEntry(function_type, "free", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)

    @staticmethod
    def __add_realloc(root):
        param_list = [SymbolTypePtr(SymbolType("CHAR", False), False), SymbolType("INT", False)]

        """
        Make func type
        """
        function_type = FunctionSymbolType(SymbolTypePtr(SymbolType("CHAR", False), False), param_list)
        symbol_entry = SymbolEntry(function_type, "realloc", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)