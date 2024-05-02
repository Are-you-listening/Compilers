from src.parser.AST import AST
from src.parser.Tables.SymbolTable import *


class FileIO:

    @staticmethod
    def add_io(ast: AST):
        FileIO.__add_fgets(ast.root)

    @staticmethod
    def __add_fgets(root):
        param_list = [SymbolTypePtr(SymbolType("CHAR", False), False), SymbolType("INT", False),
                      SymbolTypePtr(SymbolType("CHAR", False), False)]

        """
        Make func type
        """
        char_ptr_type = SymbolTypePtr(SymbolType("CHAR", False), False)

        function_type = FunctionSymbolType(char_ptr_type, param_list)
        symbol_entry = SymbolEntry(function_type, "fgets", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)


