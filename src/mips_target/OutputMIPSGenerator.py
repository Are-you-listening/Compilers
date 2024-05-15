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


class Printf:
    @staticmethod
    def printf():
        """
        Implementation of ReferenceAssembly>printf.asm
        :return:
        """

        function: Function = MipsSingleton.getInstance().getModule().createFunction("printf")
        print_base_block = function.createBlock()
        print_char_loop = function.createBlock()
        print_char_special_token_after = function.createBlock()
        print_char_special_token = function.createBlock()
        print_char_special_token_end_if = function.createBlock()
        print_char_special_token_d = function.createBlock()
        print_char_special_token_c = function.createBlock()
        printf_char_loop_end = function.createBlock()

        zero = Memory(0, True)
        t0 = Memory(8, True)
        t1 = Memory(9, True)
        t2 = Memory(10, True)
        t3 = Memory(11, True)
        fp_register = Memory(30, True)

        """
        Point to first parameter
        """
        print_base_block.addui(t3, fp_register, 4)

        """
        Load format string in t0
        """
        print_base_block.lw(t0, t3, 0)

        """
        Increase the parameter counter by 1 param
        """
        print_base_block.addui(t3, t3, 4)

        print_char_loop.lb(t1, t0, 0)
        print_char_loop.beq(t1, zero, printf_char_loop_end.label)

        return function


class Comment:
    @staticmethod
    def comment(text):
        MipsSingleton.getInstance().getCurrentBlock().comment(text)
