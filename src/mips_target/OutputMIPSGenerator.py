import sys
from src.parser.Tables.SymbolType import SymbolType
from src.parser.Tables.SymbolTypePtr import SymbolTypePtr
from src.parser.Tables.SymbolTypeArray import SymbolTypeArray
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType
import math
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.mips_target.MipsLibrary import *
from .MipsSingleton import MipsSingleton


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
    def declare(data_type: SymbolType, var_name: str, is_global=False):
        block = MipsSingleton.getInstance().getCurrentBlock()
        sp = RegisterManager.getInstance().getMemoryObject("sp")
        register_manager = RegisterManager.getInstance()
        var_memory = Memory(0, False)
        instr = None

        if is_global:
            # Add global variable to the .data section
            pass

        else:
            # Allocate space on the stack
            instr = block.addui(sp, sp, -4)

        # Register the variable in a separate dictionary
        register_manager.variable_map[var_name] = var_memory

        if instr is not None:
            return instr


    @staticmethod
    def assignment(store_reg, to_store, offset: int = 0):
        block = MipsSingleton.getInstance().getCurrentBlock()
        if isinstance(to_store, int):
            instr = block.li(store_reg, to_store)
        else:
            instr = block.lw(store_reg, to_store, offset)

        return instr

    @staticmethod
    def mipsLiteral(value, symbol_type: SymbolType):
        if symbol_type.getBaseType() == "FLOAT":
            value = float(value)
        if symbol_type.getBaseType() == "INT":
            value = int(value)
        if symbol_type.getBaseType() == "CHAR":
            """
            removes "'" before and after character
            """
            value = value[1:-1]
            """
            support right interpretation special characters like \n
            """
            if len(value) != 1:
                value = value.encode('utf-8').decode('unicode-escape')

            value = ord(value)  # Values are strings

        block = MipsSingleton.getInstance().getCurrentBlock()

        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False), None, None)
        block.addui(store_reg, Memory(0, True), value)
        return store_reg

    @staticmethod
    def string(text: str):
        """
        Take text but remove 'zero' byte
        """
        text = text.encode('utf-8').decode('unicode-escape')[:-1]

        index = MipsSingleton.getInstance().getStringIndex(text)
        label = f"str{index}"
        MipsSingleton.getInstance().getModule().addDataSegment(label, f""" "{text}" """, ".asciiz")

        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False), None, None)

        block.la(store_reg, label)

        return store_reg


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
        t4 = Memory(12, True)
        fp_register = Memory(30, True)
        v0 = Memory(2, True)
        a0 = Memory(4, True)

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

        """
        Read the next byte of the format string
        """
        print_char_loop.lb(t1, t0, 0)

        """
        When coming across a 'zero' byte stop with the looping
        """
        print_char_loop.beq(t1, zero, printf_char_loop_end.label)

        """
        load value 11, to register v0, so the system call prints a char
        """
        print_char_loop.addui(v0, zero, 11)

        """
        In case our char is a '%' (37 decimal), we see it as a special token, and we will check what we need to 
        print instead
        """
        print_char_loop.addui(t4, zero, 37)
        print_char_loop.beq(t1, t4, print_char_special_token.label)

        """
        store $t1, char value in $a0 for system call
        """
        print_char_special_token_after.add(a0, zero, t1)

        """
        Execute the print system call
        """
        print_char_special_token_after.systemCall()

        """
        Increase the format string ptr by 1
        """
        print_char_special_token_after.addui(t0, t0, 1)

        print_char_special_token_after.j(print_char_loop.label)

        """
        In case of a special tokens we look at the next character
        """
        print_char_special_token.addui(t0, t0, 1)

        """
        Load this next characters
        """
        print_char_special_token.lb(t2, t0, 0)

        print_char_special_token.addui(t4, zero, 100)
        print_char_special_token.beq(t2, t4, print_char_special_token_d.label)

        print_char_special_token.addui(t4, zero, 99)
        print_char_special_token.beq(t2, t4, print_char_special_token_c.label)

        """
        move $t1, $t2
        """
        print_char_special_token_after.add(t1, zero, t2)

        """
        After checking special character, go to block to do the print
        """
        print_char_special_token_end_if.j(print_char_special_token_after.label)

        """
        Load the latest parameter value for %d special case
        """
        """
        When special character == 'd', we will print an integer, that corresponds with next parameter
        """
        print_char_special_token_d.addui(v0, zero, 1)

        print_char_special_token_d.lw(t1, t3, 0)
        print_char_special_token_d.addui(t3, t3, 4)
        print_char_special_token_d.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %c special case
        """

        """
        When special character == 'c', we will print an char, that corresponds with next parameter
        """
        print_char_special_token_d.addui(v0, zero, 11)

        print_char_special_token_c.lb(t1, t3, 0)
        print_char_special_token_c.addui(t3, t3, 4)
        print_char_special_token_c.j(print_char_special_token_end_if.label)

        """
        Set return value to 0
        """
        printf_char_loop_end.addui(v0, zero, 0)

        return function


class Calculation:

    @staticmethod
    def operation(left, right, operator, store_reg):
        block = MipsSingleton.getInstance().getCurrentBlock()
        op_translate = {"+": block.add,
                        "-": block.sub,
                        "*": block.mul,
                        "/": block.div,
                        }
        mips_op = op_translate.get(operator, None)
        instr = mips_op(store_reg, left, right)

        return instr


class Function:
    @staticmethod
    def functionCall(func_name: str, params: list[Memory]):
        """
        Handle a function call
        """

        """
        store all the parameters on the stack so, the callee can access these later on
        """
        Function.storeParameters(params)

        block = MipsSingleton.getInstance().getCurrentBlock()
        block.jal(func_name)

    @staticmethod
    def storeParameters(params: list[Memory]):
        """
        Store parameters on the stack for later use
        """

        block = MipsSingleton.getInstance().getCurrentBlock()
        """
        allocate stack memory
        """
        alloc_size = (len(params)+1)*4
        sp_frame = Memory(29, True)

        block.addui(sp_frame, sp_frame, -alloc_size)
        for i, p in enumerate(params):
            block.sw(p, sp_frame, (i+1)*4)


class Comment:
    @staticmethod
    def comment(text):
        MipsSingleton.getInstance().getCurrentBlock().comment(text)
