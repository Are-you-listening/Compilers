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

class UnaryWrapper:
    @staticmethod
    def Plus(mips_val):
        return mips_val

    @staticmethod
    def Min(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
        instr = block.neg(store_reg, mips_val)
        return instr

    @staticmethod
    def BitNot(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
        instr = block.nor(store_reg, mips_val, Memory(0, True))
        return instr

    @staticmethod
    def LogicalNot(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
        instr = block.sltiu(store_reg, mips_val, 1)
        return instr

    @staticmethod
    def Incr(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
        instr = block.addi(store_reg, mips_val, 1)
        return instr
    @staticmethod
    def Decr(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
        instr = block.addi(store_reg, mips_val, -1)
        return instr
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
    def declare(var_name: str, value=0, is_global=False):
        block = MipsSingleton.getInstance().getCurrentBlock()
        register_manager = RegisterManager.getInstance()
        var_memory = Memory(0, False)
        instr = None

        if is_global:
            # Add global variable to the .data section
            module = MipsSingleton.getInstance().getModule()
            # if no initial value -> initialize to zero
            module.addDataSegment(var_name, value, special_info=".word")

        else:
            store_reg = RegisterManager.getInstance().allocate(block, var_memory)
            instr = block.li(store_reg, value)


        # Register the variable in a separate dictionary
        register_manager.variable_map[var_name] = var_memory

        return instr

    @staticmethod
    def assignment(store_location: Memory, to_store: Memory):
        block = MipsSingleton.getInstance().getCurrentBlock()
        instr = block.add(store_location, to_store, Memory(0, True))

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
        text = text[:-1]

        index = MipsSingleton.getInstance().getStringIndex(text)
        label = f"str{index}"
        MipsSingleton.getInstance().getModule().addDataSegment(label, f""" "{text}" """, ".asciiz")

        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
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
        print_char_special_token_s = function.createBlock()
        print_char_special_token_x = function.createBlock()
        printf_char_loop_end = function.createBlock()

        zero = Memory(0, True)
        t0 = Memory(8, True)
        t1 = Memory(9, True)
        t2 = Memory(10, True)
        t3 = Memory(11, True)
        t4 = Memory(12, True)
        t5 = Memory(13, True)
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

        print_char_special_token.addui(t4, zero, 115)
        print_char_special_token.beq(t2, t4, print_char_special_token_s.label)

        print_char_special_token.addui(t4, zero, 120)
        print_char_special_token.beq(t2, t4, print_char_special_token_x.label)

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
        print_char_special_token_c.addui(v0, zero, 11)

        print_char_special_token_c.lb(t1, t3, 0)
        print_char_special_token_c.addui(t3, t3, 4)
        print_char_special_token_c.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %s special case
        """

        """
        When special character == 's', we will print a string, that corresponds with next parameter
        """
        print_char_special_token_s.addui(v0, zero, 4)

        print_char_special_token_s.lw(t1, t3, 0)
        print_char_special_token_s.addui(t3, t3, 4)
        print_char_special_token_s.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %x special case
        """

        """
        When special character == 'x', we will print a string, that corresponds with next parameter
        """
        print_char_special_token_x.addui(v0, zero, 4)

        print_char_special_token_x.lb(t1, t3, 0)

        """
        Display the first 4 bits as hex
        Using a mathematical formula we can make sure to display 'a-f', without need for any branches
        """

        """
        Take last 4 bytes
        """
        print_char_special_token_x.srl(t1, t1, 4)

        """
        Print it to ascii character range starting with '0'
        """
        print_char_special_token_x.addui(t1, t1, 48)

        print_char_special_token_x.addui(t5, zero, 58)
        print_char_special_token_x.div(t4, t1, t5)
        print_char_special_token_x.mflo(t4)
        print_char_special_token_x.andi(t5, t4, 1)
        print_char_special_token_x.addi(t4, t4, 38)
        print_char_special_token_x.mul(t5, t5, t4)
        print_char_special_token_x.add(t1, t5, t1)

        """
        Display first 4 bits as hex
        """
        print_char_special_token_x.addui(v0, zero, 11)
        print_char_special_token_x.add(a0, zero, t1)
        print_char_special_token_x.systemCall()

        """
        Display the second part (last 4 bits)
        No seperate syscall will occur, but just the default syscall
        """
        print_char_special_token_x.lb(t1, t3, 0)

        """
        Wipe all expect last 4 bites
        """
        print_char_special_token_x.sll(t1, t1, 28)
        print_char_special_token_x.srl(t1, t1, 28)

        """
        Print it to ascii character range starting with '0'
        """
        print_char_special_token_x.addui(t1, t1, 48)

        print_char_special_token_x.addui(t5, zero, 58)
        print_char_special_token_x.div(t4, t1, t5)
        print_char_special_token_x.mflo(t4)
        print_char_special_token_x.andi(t5, t4, 1)
        print_char_special_token_x.addi(t4, t4, 38)
        print_char_special_token_x.mul(t5, t5, t4)
        print_char_special_token_x.add(t1, t5, t1)

        print_char_special_token_x.addui(t3, t3, 4)
        print_char_special_token_x.j(print_char_special_token_end_if.label)

        """
        Set return value to 0
        """
        printf_char_loop_end.addui(v0, zero, 0)

        function.endFunction()

        return function


class Calculation:
    @staticmethod
    def modulo(store_reg, left, right):
        block = MipsSingleton.getInstance().getCurrentBlock()

        block.div(store_reg, left, right)
        instr = block.mfhi(store_reg)

        return instr

    @staticmethod
    def operation(left, right, operator):
        block = MipsSingleton.getInstance().getCurrentBlock()

        if operator != "()":
            store_reg = RegisterManager.getInstance().allocate(block, Memory(None, False))
        else:
            store_reg = Memory(None, True)

        op_translate = {"+": block.add,
                        "-": block.sub,
                        "()": Function.functionCall,
                        "*": block.mul,
                        "/": block.div,
                        "%": Calculation.modulo,
                        "<<": block.sll,
                        ">>": block.srl,
                        "&": block.mips_and,
                        "|": block.mips_or,
                        "^": block.xor
                        }
        mips_op = op_translate.get(operator, None)
        instr = mips_op(store_reg, left, right)

        return instr

    @staticmethod
    def unary(mips_val, op: str):
        op_translate = {"-": UnaryWrapper.Min,
                        "+": UnaryWrapper.Plus,
                        "~": UnaryWrapper.BitNot,
                        "!": UnaryWrapper.LogicalNot,
                        "++": UnaryWrapper.Incr,
                        "--": UnaryWrapper.Decr
                        }
        mips_op = op_translate.get(op, None)
        mips_var = mips_op(mips_val)
        return mips_var





class Function:
    @staticmethod
    def functionCall(return_register: Memory, func_name, params: list[Memory]):
        """
        Handle a function call
        """

        """
        store all the parameters on the stack so, the callee can access these later on
        """

        Function.storeParameters(params)

        block = MipsSingleton.getInstance().getCurrentBlock()
        block.jal(f"function_{func_name.getFunctionName()}")

        """
        Store the return value in a specific register
        """
        return Memory("v0", True)

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

    @staticmethod
    def handleReturn(return_value: Memory):
        block = MipsSingleton.getInstance().getCurrentBlock()

        v0 = Memory("v0", True)
        zero = Memory("zero", True)

        """
        Store return value in return register
        """
        block.add(v0, zero, return_value)
        block.j(f"function_{block.function.getFunctionName()}_load")


class Comment:
    @staticmethod
    def comment(text):
        MipsSingleton.getInstance().getCurrentBlock().comment(text)
