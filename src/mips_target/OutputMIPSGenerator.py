import sys
from src.parser.Tables.SymbolType import SymbolType
from src.parser.Tables.SymbolTypePtr import SymbolTypePtr
from src.parser.Tables.SymbolTypeArray import SymbolTypeArray
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType
import math
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.mips_target.MipsSingleton import MipsSingleton
from src.mips_target.MipsLibrary import *


class Declaration:

    @staticmethod
    def function(func_name: str, return_type: SymbolType, args: list):
        """
        change the current latest function
        """
        new_function = Function(func_name)

        MipsSingleton.getInstance().addFunction(new_function)

        return new_function

    @staticmethod
    def declare(data_type: SymbolType, var_name: str):
        block = MipsSingleton.getInstance().getCurrentBlock()
        register = block.getRegister()

        return register

    @staticmethod
    def assignment(store_reg, to_store, offset: int = 0):
        block = MipsSingleton.getInstance().getCurrentBlock()
        if isinstance(to_store, int):
            instr = block.li(store_reg, to_store)
        else:
            instr = block.lw(store_reg, to_store, offset)

        return instr


