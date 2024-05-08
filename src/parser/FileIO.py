from src.parser.AST import AST
from src.parser.Tables.SymbolTable import *
from src.parser.Tables.TypeNodehandler import TypeNodeHandler


class FileIO:

    @staticmethod
    def add_io(ast: AST):

        FileIO.__add_fopen(ast.root)
        FileIO.__add_fgets(ast.root)
        FileIO.__add_fputs(ast.root)
        FileIO.__add_fclose(ast.root)

    @staticmethod
    def add_file_type():
        FileIO.__add_IO_file()

    @staticmethod
    def __add_fopen(root):

        param_list = [SymbolTypePtr(SymbolType("CHAR", False), False), SymbolTypePtr(SymbolType("CHAR", False), False)]

        """
        Make func type
        """
        return_type = SymbolTypePtr(TypeNodeHandler.getInstance().getStruct("0_IO_FILE"), False)

        function_type = FunctionSymbolType(return_type, param_list)
        symbol_entry = SymbolEntry(function_type, "fopen", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)

    @staticmethod
    def __add_fclose(root):
        param_list = [SymbolTypePtr(TypeNodeHandler.getInstance().getStruct("0_IO_FILE"), False)]

        """
        Make func type
        """
        return_type = SymbolType("VOID", False)

        function_type = FunctionSymbolType(return_type, param_list)
        symbol_entry = SymbolEntry(function_type, "fclose", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)

    @staticmethod
    def __add_fgets(root):
        param_list = [SymbolTypePtr(SymbolType("CHAR", False), False), SymbolType("INT", False),
                      SymbolTypePtr(TypeNodeHandler.getInstance().getStruct("0_IO_FILE"), False)]

        """
        Make func type
        """
        char_ptr_type = SymbolTypePtr(SymbolType("CHAR", False), False)

        function_type = FunctionSymbolType(char_ptr_type, param_list)
        symbol_entry = SymbolEntry(function_type, "fgets", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)

    @staticmethod
    def __add_fputs(root):
        param_list = [SymbolTypePtr(SymbolType("CHAR", False), False),
                      SymbolTypePtr(TypeNodeHandler.getInstance().getStruct("0_IO_FILE"), False)]

        """
        Make func type
        """
        int_type = SymbolType("CHAR", False)

        function_type = FunctionSymbolType(int_type, param_list)
        symbol_entry = SymbolEntry(function_type, "fputs", None, root, None)
        symbol_entry.function_is_defined = True
        root.getSymbolTable().add(symbol_entry)


    @staticmethod
    def __add_IO_file():
        file_struct_param = []

        """
        List of all the values the _IO_FILE has in the clang reference, we will make
        this struct an opaque type in LLVm, so we don't have to define the entries we are never planning 
        to user
        """

        file_struct_param.append(SymbolTypePtr(SymbolType("CHAR", False), False))
        file_struct_param.append(SymbolTypePtr(SymbolType("CHAR", False), False))

        file_struct = SymbolTypeStruct("0_IO_FILE", file_struct_param)

        TypeNodeHandler.getInstance().addStructType("0_IO_FILE", file_struct)
