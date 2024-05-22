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
from .PredifinedStructures import SpecialFunctions

class AccessWrapper:

    @staticmethod
    def access(location: Memory, index: Memory):

        block = MipsSingleton.getInstance().getCurrentBlock()

        symbol_type = location.symbol_type
        print(type(symbol_type.pts_to), type(symbol_type))

        location = block.lw(location, 0)

        offset = 4
        is_struct = False
        if isinstance(symbol_type, SymbolTypePtr):
            target = symbol_type.deReference()

            offset = target.getBytesUsed()

            if isinstance(target, SymbolTypeArray):
                offset = 4
                symbol_type = target
                print(offset)
            if isinstance(target, SymbolTypeStruct):

                """
                Special case, where the terminal int is encoded into a SymbolType
                """
                j = index.const_value
                offset = 0
                for i in range(0, j):
                    symbol_type = target.getElementType(i).deReference()
                    """
                    Weird hot fix
                    """

                    temp_offset = max(symbol_type.getBytesUsed(), 4)
                    symbol_type = target.getElementType(i)
                    offset += temp_offset
                is_struct = True

        if not is_struct:
            multiplier = block.li(offset)
            real_index = block.mul(index, multiplier)
            instr = block.addu(location, real_index)

        else:
            real_index = block.li(offset)
            instr = block.addu(location, real_index)

        instr.symbol_type = symbol_type
        print("ww", type(symbol_type))
        return instr


class UnaryWrapper:

    @staticmethod
    def Plus(mips_val):
        return mips_val

    @staticmethod
    def Min(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        instr = block.neg(mips_val)
        return instr



    @staticmethod
    def BitNot(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        instr = block.nor(mips_val, Memory(0, True))
        return instr

    @staticmethod
    def LogicalNot(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()
        instr = block.sltiu(mips_val, 1)
        return instr

    @staticmethod
    def Incr(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()

        value = 1
        if isinstance(mips_val.symbol_type, SymbolTypePtr):
            value = 4

        instr = block.addi(mips_val, value)
        return instr

    @staticmethod
    def Decr(mips_val):
        block = MipsSingleton.getInstance().getCurrentBlock()

        value = 1
        if isinstance(mips_val.symbol_type, SymbolTypePtr):
            value = 4

        instr = block.addi(mips_val, -value)
        return instr


class BinaryWrapper:
    @staticmethod
    def lessEqual(mips_val1, mips_val2):
        block = MipsSingleton.getInstance().getCurrentBlock()
        greater = block.sgt(mips_val1, mips_val2)
        instr = block.sltiu(greater, 1)
        return instr

    @staticmethod
    def greaterEqual(mips_val1, mips_val2):
        block = MipsSingleton.getInstance().getCurrentBlock()
        less = block.slt(mips_val1, mips_val2)
        instr = block.sltiu(less, 1)
        return instr

    @staticmethod
    def equal(mips_val1, mips_val2):
        block = MipsSingleton.getInstance().getCurrentBlock()
        instr = block.xor(mips_val1, mips_val2)
        instr = block.sltiu(instr, 1)
        return instr

    @staticmethod
    def notEqual(mips_val1, mips_val2):
        block = MipsSingleton.getInstance().getCurrentBlock()
        instr = block.xor(mips_val1, mips_val2)
        instr = block.sltiu(instr, 1)
        instr = block.sltiu(instr, 1)
        return instr


class Declaration:

    @staticmethod
    def declare(var_name: str, symbol_type: SymbolType, value=0, is_global=False):
        block = MipsSingleton.getInstance().getCurrentBlock()
        register_manager = RegisterManager.getInstance()
        instr = None

        if is_global:
            # Add global variable to the .data section
            module = MipsSingleton.getInstance().getModule()
            # if no initial value -> initialize to zero
            if symbol_type.getBaseType() == "FLOAT":
                special_info = ".float"
                #mem = block.l_s(var_name)

            elif isinstance(symbol_type, SymbolTypeArray):
                """
                make global array
                """
                values = [str(value) for i in range(symbol_type.size)]
                if isinstance(symbol_type.deReference(), SymbolTypeArray):
                    values = []
                    for i in range(symbol_type.size):
                        val = Declaration.declare(f".{i}.{var_name}", symbol_type.deReference(), value, is_global)
                        print("val", val)
                        values.append(str(val))

                module.addDataSegment(f".{var_name}", f"{','.join(values)}", special_info=".word")
                special_info = f".word"
                value = f".{var_name}"
            else:
                special_info = ".word"


                #mem = register_manager.allocate(block)
            module.addDataSegment(var_name, value, special_info=special_info)


            #instr = block.lw(mem, None, True, var_name)
            #instr = register_manager.getInstance().storeVariable(block, instr, symbol_type.getBytesUsed())
            instr = Memory(var_name, False)
            instr.symbol_type = SymbolTypePtr(symbol_type, False)

        else:
            #if symbol_type.getBaseType() == "FLOAT":
            print("st", type(symbol_type))
            instr = block.li(value)

            instr = register_manager.getInstance().storeVariable(block, instr, symbol_type)
            print("declared", instr, instr.symbol_type.getPtrTuple())

            instr.symbol_type = symbol_type

        return instr

    @staticmethod
    def assignment(store_location: Memory, to_store: Memory | Function):
        block = MipsSingleton.getInstance().getCurrentBlock()

        if isinstance(to_store, Function):
            to_store = block.la(f"function_{to_store.getFunctionName()}")

        RegisterManager.getInstance().loadIfNeeded(block, [store_location, to_store])
        instr = block.sw(to_store, store_location, 0)

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
        if isinstance(value, float):
            var_name = MipsSingleton.getInstance().getFloatName()
            MipsSingleton.getInstance().getModule().addDataSegment(var_name, value, special_info=".float")
            store_reg = MipsSingleton.getInstance().getCurrentBlock().l_s(var_name)  # Load float
        else:
            if isinstance(value, str) or -32768 <= value <= 32767:
                store_reg = block.addui(Memory(0, True), value)
            else:
                store_reg = block.ori(Memory(0, True), value)
        store_reg.symbol_type = symbol_type
        return store_reg

    @staticmethod
    def string(text: str):
        """
        Take text but remove 'zero' byte
        """
        text = text[:-1]

        index, found = MipsSingleton.getInstance().getStringIndex(text)

        label = f"str{index}"
        if not found:

            MipsSingleton.getInstance().getModule().addDataSegment(label, f""" "{text}" """, ".asciiz")

        block = MipsSingleton.getInstance().getCurrentBlock()
        store_reg = block.la(label)

        return store_reg


class Printf:
    @staticmethod
    def scanf():
        function: Function = MipsSingleton.getInstance().getModule().createFunction("scanf")
        function_function_scanf = function.createBlock()
        scanf_char_loop = function.createBlock()
        scanf_char_special_token = function.createBlock()
        scanf_char_special_token_d = function.createBlock()
        scanf_char_special_token_c = function.createBlock()
        scanf_char_special_token_x = function.createBlock()

        zero = Memory(0, True)
        v0 = Memory("v0", True)
        v1 = Memory("v1", True)
        a0 = Memory("a0", True)
        a1 = Memory("a1", True)
        a2 = Memory("a2", True)
        a3 = Memory("a3", True)
        fp = Memory("fp", True)
        sp = Memory("sp", True)
        t0 = Memory("t0", True)
        t1 = Memory("t1", True)
        t2 = Memory("t2", True)
        t3 = Memory("t3", True)
        t4 = Memory("t4", True)
        t5 = Memory("t5", True)
        t6 = Memory("t6", True)
        s0 = Memory("s0", True)
        s1 = Memory("s1", True)
        f0 = Memory("f0", True)

        change_labels_to_scanf_translate_hexCharToInt = []  # This construction is a pain

        """
        Point to first parameter
        """
        function_function_scanf.instructions.append(Addiu(t3, fp, 4))

        """
        Load format string in t0
        """
        function_function_scanf.instructions.append(Lw(t0, t3, 0))

        """
        Increase the parameter counter by 1 param
        """
        function_function_scanf.instructions.append(Addiu(t3, t3, 4))

        """
        Read the next byte of the format string
        """
        scanf_char_loop.instructions.append(Lb(t1, t0, 0))

        """
        When coming across a 'zero' byte stop with the looping
        """
        scanf_char_loop.beq(t1, zero, None)
        change_label_to_scanf_char_loop_end = scanf_char_loop.instructions[-1]

        scanf_char_loop.beq(t1, 37, scanf_char_special_token.label)

        scanf_char_loop.instructions.append(Li(v0, v0, 11))
        scanf_char_loop.move(a0, t1)
        scanf_char_loop.systemCall()
        scanf_char_loop.instructions.append(Addi(t0, t0, 1))
        scanf_char_loop.j(scanf_char_loop.label)

        """scanf_char_special_token"""
        temp_reg = scanf_char_special_token.addi(t0, 1)
        temp_reg.overrideMemory(t0)
        temp_reg = scanf_char_special_token.lb(t0, 0)
        temp_reg.overrideMemory(t2)
        scanf_char_special_token.beq(t2, 100, scanf_char_special_token_d.label)
        scanf_char_special_token.beq(t2, 99, scanf_char_special_token_c.label)
        scanf_char_special_token.beq(t2, 120, scanf_char_special_token_x.label)
        scanf_char_special_token.beq(t2, 115, None)
        change_label_to_scanf_char_special_token_s = scanf_char_special_token.instructions[-1]
        scanf_char_special_token.beq(t2, 102, None)
        change_label_to_scanf_char_special_token_f = scanf_char_special_token.instructions[-1]
        scanf_char_special_token.move(t1, t2)

        """scanf_char_special_token_d"""
        scanf_char_special_token_d.instructions.append(Li(v0, v0, 5))
        scanf_char_special_token_d.systemCall()
        scanf_char_special_token_d.instructions.append(Lw(t6, t3, 0))
        scanf_char_special_token_d.sw(v0, t6, 0)
        scanf_char_special_token_d.instructions.append(Addi(t3, t3, 4))
        scanf_char_special_token_d.instructions.append(Addi(t0, t0, 1))
        scanf_char_special_token_d.j(scanf_char_loop.label)

        """scanf_char_special_token_c"""
        scanf_char_special_token_c.instructions.append(Li(v0, v0, 12))
        scanf_char_special_token_c.systemCall()
        scanf_char_special_token_c.instructions.append(Lw(t6, t3, 0))
        scanf_char_special_token_c.sb(v0, t6)
        scanf_char_special_token_c.instructions.append(Addi(t3, t3, 4))
        scanf_char_special_token_c.instructions.append(Addi(t0, t0, 1))
        scanf_char_special_token_c.j(scanf_char_loop.label)

        """scanf_char_special_token_x"""
        scanf_char_special_token_x.instructions.append(Addi(a0, sp, 8))
        scanf_char_special_token_x.instructions.append(Li(a1, a1, 9))
        scanf_char_special_token_x.instructions.append(Li(v0, v0, 8))
        scanf_char_special_token_x.sw(zero, a0, 0)  # Make sure to set the space we are going to write in to zero
        scanf_char_special_token_x.sw(zero, a0, 4)
        scanf_char_special_token_x.systemCall()

        scanf_char_special_token_x.lw_function(a0, 0, s0)
        scanf_char_special_token_x.lw_function(a0, 4, s1)
        scanf_char_special_token_x.add(zero, zero, v0)

        scanf_char_special_token_x.move(a0, s1)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.add(zero, zero, a1)
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_7", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_7")

        scanf_char_special_token_x.move(a0, s1)
        scanf_char_special_token_x.sll(a0, 8, a0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_6", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_6")

        scanf_char_special_token_x.move(a0, s1)
        scanf_char_special_token_x.sll(a0, 16, a0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_5", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_5")

        scanf_char_special_token_x.move(a0, s1)
        scanf_char_special_token_x.sll(a0, 24, a0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_4", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_4")

        scanf_char_special_token_x.move(a0, s0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_3", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_3")

        scanf_char_special_token_x.move(a0, s0)
        scanf_char_special_token_x.sll(a0, 8, a0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_2", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_2")

        scanf_char_special_token_x.move(a0, s0)
        scanf_char_special_token_x.sll(a0, 16, a0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_1", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_1")

        scanf_char_special_token_x.move(a0, s0)
        scanf_char_special_token_x.sll(a0, 24, a0)
        scanf_char_special_token_x.srl(a0, 24, a0)
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, 1))
        scanf_char_special_token_x.la("scanf_char_special_token_x_return_0", v1)
        scanf_char_special_token_x.bne(a0, zero, None)
        change_labels_to_scanf_translate_hexCharToInt.append(scanf_char_special_token_x.instructions[-1])
        scanf_char_special_token_x.instructions.append(Addi(a1, a1, -1))
        scanf_char_special_token_x.manual_label("scanf_char_special_token_x_return_0")

        scanf_char_special_token_x.instructions.append(Lw(t6, t3, 0))
        scanf_char_special_token_x.sw(v0, t6, 0)
        scanf_char_special_token_x.instructions.append(Addi(t3, t3, 4))
        scanf_char_special_token_x.instructions.append(Addi(t0, t0, 1))
        scanf_char_special_token_x.j(scanf_char_loop.label)

        scanf_char_special_token_s = function.createBlock()
        change_label_to_scanf_char_special_token_s.label = scanf_char_special_token_s.label
        scanf_char_special_token_f = function.createBlock()
        change_label_to_scanf_char_special_token_f.label = scanf_char_special_token_f.label
        scanf_translate_hexCharToInt = function.createBlock()
        for change in change_labels_to_scanf_translate_hexCharToInt:  # Correct label usage
            change.label = scanf_translate_hexCharToInt.label

        scanf_translate_hexCharToInt_0 = function.createBlock()
        scanf_translate_hexCharToInt_1 = function.createBlock()
        scanf_translate_hexCharToInt_2 = function.createBlock()
        scanf_translate_hexCharToInt_3 = function.createBlock()
        scanf_translate_hexCharToInt_4 = function.createBlock()
        scanf_translate_hexCharToInt_5 = function.createBlock()
        scanf_translate_hexCharToInt_6 = function.createBlock()
        scanf_translate_hexCharToInt_7 = function.createBlock()
        scanf_translate_hexCharToInt_8 = function.createBlock()
        scanf_translate_hexCharToInt_9 = function.createBlock()
        scanf_translate_hexCharToInt_a = function.createBlock()
        scanf_translate_hexCharToInt_b = function.createBlock()
        scanf_translate_hexCharToInt_c = function.createBlock()
        scanf_translate_hexCharToInt_d = function.createBlock()
        scanf_translate_hexCharToInt_e = function.createBlock()
        scanf_translate_hexCharToInt_f = function.createBlock()
        scanf_power_16 = function.createBlock()
        scanf_power_16_while = function.createBlock()
        scanf_power_16_exit_pow = function.createBlock()

        """scanf_char_special_token_s"""
        scanf_char_special_token_s.instructions.append(Li(v0, v0, 8))
        scanf_char_special_token_s.instructions.append(Li(a1, a1, 512))
        scanf_char_special_token_s.instructions.append(Lw(a0, t3, 0))
        scanf_char_special_token_s.systemCall()
        scanf_char_special_token_s.instructions.append(Addi(t3, t3, 4))
        scanf_char_special_token_s.instructions.append(Addi(t0, t0, 1))
        scanf_char_special_token_s.j(scanf_char_loop.label)

        """scanf_char_special_token_f"""
        scanf_char_special_token_f.instructions.append(Li(v0, v0, 6))
        scanf_char_special_token_f.systemCall()

        scanf_char_special_token_f.mfc1(f0, v0)
        scanf_char_special_token_f.instructions.append(Lw(t6, t3, 0))
        scanf_char_special_token_f.sw(v0, t6, 0)
        scanf_char_special_token_f.instructions.append(Addi(t3, t3, 4))
        scanf_char_special_token_f.instructions.append(Addi(t0, t0, 1))
        scanf_char_special_token_f.j(scanf_char_loop.label)

        """scanf_translate_hexCharToInt"""
        scanf_translate_hexCharToInt.beq(a0, 48, scanf_translate_hexCharToInt_0.label)
        scanf_translate_hexCharToInt.beq(a0, 49, scanf_translate_hexCharToInt_1.label)
        scanf_translate_hexCharToInt.beq(a0, 50, scanf_translate_hexCharToInt_2.label)
        scanf_translate_hexCharToInt.beq(a0, 51, scanf_translate_hexCharToInt_3.label)
        scanf_translate_hexCharToInt.beq(a0, 52, scanf_translate_hexCharToInt_4.label)
        scanf_translate_hexCharToInt.beq(a0, 53, scanf_translate_hexCharToInt_5.label)
        scanf_translate_hexCharToInt.beq(a0, 54, scanf_translate_hexCharToInt_6.label)
        scanf_translate_hexCharToInt.beq(a0, 55, scanf_translate_hexCharToInt_7.label)
        scanf_translate_hexCharToInt.beq(a0, 56, scanf_translate_hexCharToInt_8.label)
        scanf_translate_hexCharToInt.beq(a0, 57, scanf_translate_hexCharToInt_9.label)
        scanf_translate_hexCharToInt.beq(a0, 97, scanf_translate_hexCharToInt_a.label)
        scanf_translate_hexCharToInt.beq(a0, 98, scanf_translate_hexCharToInt_b.label)
        scanf_translate_hexCharToInt.beq(a0, 99, scanf_translate_hexCharToInt_c.label)
        scanf_translate_hexCharToInt.beq(a0, 100, scanf_translate_hexCharToInt_d.label)
        scanf_translate_hexCharToInt.beq(a0, 101, scanf_translate_hexCharToInt_e.label)
        scanf_translate_hexCharToInt.beq(a0, 102, scanf_translate_hexCharToInt_f.label)
        #Else: Undefined character: go back
        scanf_translate_hexCharToInt.instructions.append(Addi(a1, a1, -1))
        scanf_translate_hexCharToInt.jr(v1)
        """scanf_translate_hexCharToInt_0"""
        temp_reg = scanf_translate_hexCharToInt_0.li(0)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_0.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_1"""
        temp_reg = scanf_translate_hexCharToInt_1.li(1)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_1.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_2"""
        temp_reg = scanf_translate_hexCharToInt_2.li(2)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_2.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_3"""
        temp_reg = scanf_translate_hexCharToInt_3.li(3)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_3.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_4"""
        temp_reg = scanf_translate_hexCharToInt_4.li(4)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_4.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_5"""
        temp_reg = scanf_translate_hexCharToInt_5.li(5)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_5.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_6"""
        temp_reg = scanf_translate_hexCharToInt_6.li(6)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_6.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_7"""
        temp_reg = scanf_translate_hexCharToInt_7.li(7)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_7.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_8"""
        temp_reg = scanf_translate_hexCharToInt_8.li(8)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_8.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_9"""
        temp_reg = scanf_translate_hexCharToInt_9.li(9)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_9.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_a"""
        temp_reg = scanf_translate_hexCharToInt_a.li(10)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_a.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_b"""
        temp_reg = scanf_translate_hexCharToInt_b.li(11)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_b.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_c"""
        temp_reg = scanf_translate_hexCharToInt_c.li(12)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_c.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_d"""
        temp_reg = scanf_translate_hexCharToInt_d.li(13)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_d.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_e"""
        temp_reg = scanf_translate_hexCharToInt_e.li(14)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_e.j(scanf_power_16.label)
        """scanf_translate_hexCharToInt_f"""
        temp_reg = scanf_translate_hexCharToInt_f.li(15)
        temp_reg.overrideMemory(a0)
        scanf_translate_hexCharToInt_f.j(scanf_power_16.label)

        """scanf_power_16"""
        scanf_power_16.move(a2, a1)
        temp_reg = scanf_power_16.li(1)
        temp_reg.overrideMemory(a3)
        scanf_power_16.beq(a2, zero, scanf_power_16_exit_pow.label)
        """scanf_power_16_while"""
        temp_reg = scanf_power_16_while.li(16)
        temp_reg = scanf_power_16_while.mul(a3, temp_reg)
        temp_reg.overrideMemory(a3)
        temp_reg = scanf_power_16_while.addi(a2, -1)
        temp_reg.overrideMemory(a2)
        scanf_power_16_while.bne(a2, zero, scanf_power_16_while.label)
        """scanf_power_16_exit_pow"""
        temp_reg = scanf_power_16_exit_pow.mul(a3, a0)
        temp_reg.overrideMemory(a3)
        scanf_power_16_exit_pow.add(a3, v0, v0)
        scanf_power_16_exit_pow.jr(v1)

        scanf_char_loop_end = function.createBlock()
        change_label_to_scanf_char_loop_end.label = scanf_char_loop_end.label

        """
        Set return value to 0
        """
        scanf_char_loop_end.instructions.append(Li(v0, v0, 1))

        function.endFunction()
        return function

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
        width_space_loop = function.createBlock()
        width_space_loop_after = function.createBlock()
        print_char_special_token = function.createBlock()
        print_char_special_token_end_if = function.createBlock()
        print_char_special_token_d_width = function.createBlock()
        print_char_special_token_d_width_loop = function.createBlock()
        print_char_special_token_d = function.createBlock()
        print_char_special_token_c = function.createBlock()
        print_char_special_token_s = function.createBlock()
        print_char_special_token_s_width_loop = function.createBlock()
        print_char_special_token_s_after = function.createBlock()
        print_char_special_token_x = function.createBlock()
        xwidth_space_loop = function.createBlock()
        print_x_first_skipper = function.createBlock()
        print_x_half_byte_loop = function.createBlock()
        print_x_half_byte_loop_after = function.createBlock()
        print_char_special_token_f = function.createBlock()
        printf_char_loop_end = function.createBlock()

        zero = Memory(0, True)
        t0 = Memory(8, True)
        t1 = Memory(9, True)
        t2 = Memory(10, True)
        t3 = Memory(11, True)
        t4 = Memory(12, True)
        t5 = Memory(13, True)
        t6 = Memory(14, True)
        t7 = Memory(15, True)
        t8 = Memory(24, True)
        t9 = Memory(25, True)
        fp_register = Memory(30, True)
        v0 = Memory(2, True)

        a0 = Memory(4, True)

        s0 = Memory(16, True)
        s1 = Memory(17, True)
        s2 = Memory(18, True)

        """
        Point to first parameter
        """
        temp_reg = print_base_block.addui(fp_register, 4)
        temp_reg.overrideMemory(t3)

        """
        Load format string in t0
        """
        temp_reg = print_base_block.lw(t3, 0)
        temp_reg.overrideMemory(t0)

        """
        Increase the parameter counter by 1 param
        """
        temp_reg = print_base_block.addui(t3, 4)
        temp_reg.overrideMemory(t3)

        """
        Read the next byte of the format string
        """
        lb_instr = print_char_loop.li(0)
        lb_instr.overrideMemory(t9)

        lb_instr = print_char_loop.lb(t0, 0)
        lb_instr.overrideMemory(t1)

        """
        When coming across a 'zero' byte stop with the looping
        """
        print_char_loop.beq(t1, zero, printf_char_loop_end.label)

        """
        load value 11, to register v0, so the system call prints a char
        """
        temp_reg = print_char_loop.addui(zero, 11)
        temp_reg.overrideMemory(v0)

        """
        In case our char is a '%' (37 decimal), we see it as a special token, and we will check what we need to 
        print instead
        """
        temp_reg = print_char_loop.addui(zero, 37)
        temp_reg.overrideMemory(t4)

        print_char_loop.beq(t1, t4, print_char_special_token.label)

        """
        width_space_loop
        """
        temp_reg = width_space_loop.li(1)
        temp_reg.overrideMemory(t8)

        temp_reg = width_space_loop.slt(t9, t8)
        temp_reg.overrideMemory(t7)

        width_space_loop.beq(t7, t8, width_space_loop_after.label)
        width_space_loop.move(t7, v0)

        temp_reg = width_space_loop.li(11)
        temp_reg.overrideMemory(v0)

        temp_reg = width_space_loop.li(32)
        temp_reg.overrideMemory(a0)

        temp_reg = width_space_loop.addui(s2, 1)
        temp_reg.overrideMemory(s2)
        width_space_loop.systemCall()

        temp_reg = width_space_loop.addui(t9, -1)
        temp_reg.overrideMemory(t9)

        width_space_loop.move(v0, t7)

        temp_reg = width_space_loop.li(0)
        temp_reg.overrideMemory(t8)

        width_space_loop.bne(t9, t8, width_space_loop.label)

        """
        store $t1, char value in $a0 for system call
        """

        temp_reg = width_space_loop_after.add(zero, t1)
        temp_reg.overrideMemory(a0)

        """
        Execute the print system call
        """
        temp_reg = width_space_loop_after.addui(s2, 1)
        temp_reg.overrideMemory(s2)
        width_space_loop_after.systemCall()

        """
        Increase the format string ptr by 1
        """
        temp_reg = width_space_loop_after.addui(t0, 1)
        temp_reg.overrideMemory(t0)

        width_space_loop_after.j(print_char_loop.label)

        """
        In case of a special tokens we look at the next character
        """
        temp_reg = print_char_special_token.addui(t0, 1)
        temp_reg.overrideMemory(t0)

        """
        Load this next characters
        """
        special_token = print_char_special_token.lb(t0, 0)
        special_token.overrideMemory(t2)

        temp_reg = print_char_special_token.addui(zero, 100)
        temp_reg.overrideMemory(t4)

        print_char_special_token.beq(t2, t4, print_char_special_token_d_width.label)

        temp_reg = print_char_special_token.addui(zero, 99)
        temp_reg.overrideMemory(t4)

        print_char_special_token.beq(t2, t4, print_char_special_token_c.label)

        temp_reg = print_char_special_token.addui(zero, 115)
        temp_reg.overrideMemory(t4)

        print_char_special_token.beq(t2, t4, print_char_special_token_s.label)

        temp_reg = print_char_special_token.addui(zero, 120)
        temp_reg.overrideMemory(t4)

        print_char_special_token.beq(t2, t4, print_char_special_token_x.label)

        temp_reg = print_char_special_token.addui(zero, 102)
        temp_reg.overrideMemory(t4)

        print_char_special_token.beq(t2, t4, print_char_special_token_f.label)

        """
        check value
        """
        temp_reg = print_char_special_token.li(47)
        temp_reg.overrideMemory(t7)
        temp_reg = print_char_special_token.li(58)
        temp_reg.overrideMemory(t8)
        temp_reg = print_char_special_token.slt(t7, t2)
        temp_reg.overrideMemory(t7)
        temp_reg = print_char_special_token.sgt(t8, t2)
        temp_reg.overrideMemory(t8)
        temp_reg = print_char_special_token.mips_and(t7, t8)
        temp_reg.overrideMemory(t7)
        print_char_special_token.move(t1, t2)

        temp_reg = print_char_special_token.li(1)
        temp_reg.overrideMemory(t8)
        print_char_special_token.bne(t7, t8, print_char_special_token_end_if.label)

        temp_reg = print_char_special_token.addui(t2, -48)
        temp_reg.overrideMemory(t7)

        temp_reg = print_char_special_token.li(10)
        temp_reg.overrideMemory(t8)
        temp_reg = print_char_special_token.mul(t9, t8)
        temp_reg.overrideMemory(t9)
        temp_reg = print_char_special_token.add(t9, t7)
        temp_reg.overrideMemory(t9)
        print_char_special_token.j(print_char_special_token.label)


        """
        move $t1, $t2
        """

        """
        After checking special character, go to block to do the print
        """
        print_char_special_token_end_if.j(print_char_special_token_after.label)

        """
        Load the latest parameter value for %d special case
        """
        temp_reg = print_char_special_token_d_width.lw(t3, 0)
        temp_reg.overrideMemory(t1)

        temp_reg = print_char_special_token_d_width_loop.li(10)
        temp_reg.overrideMemory(t7)

        temp_reg = print_char_special_token_d_width_loop.div(t1, t7)
        temp_reg.overrideMemory(t1)

        temp_reg = print_char_special_token_d_width_loop.addui(s2, 1)
        temp_reg.overrideMemory(s2)

        temp_reg = print_char_special_token_d_width_loop.li(1)
        temp_reg.overrideMemory(t7)

        temp_reg = print_char_special_token_d_width_loop.sub(t9, t7)
        temp_reg.overrideMemory(t9)

        temp_reg = print_char_special_token_d_width_loop.li(0)
        temp_reg.overrideMemory(t7)

        print_char_special_token_d_width_loop.bne(t7, t1, print_char_special_token_d_width_loop.label)

        """
        When special character == 'd', we will print an integer, that corresponds with next parameter
        """
        temp_reg = print_char_special_token_d.addui(s2, -1)
        temp_reg.overrideMemory(s2)

        temp_reg = print_char_special_token_d.addui(zero, 1)
        temp_reg.overrideMemory(v0)

        temp_reg = print_char_special_token_d.lw(t3, 0)
        temp_reg.overrideMemory(t1)
        temp_reg = print_char_special_token_d.addui(t3, 4)
        temp_reg.overrideMemory(t3)

        print_char_special_token_d.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %c special case
        """

        """
        When special character == 'c', we will print an char, that corresponds with next parameter
        """
        temp_reg = print_char_special_token_c.addi(t9, -1)
        temp_reg.overrideMemory(t9)

        temp_reg = print_char_special_token_c.addui(zero, 11)
        temp_reg.overrideMemory(v0)

        c_char = print_char_special_token_c.lb(t3, 0)
        c_char.overrideMemory(t1)

        temp_reg = print_char_special_token_c.addui(t3, 4)
        temp_reg.overrideMemory(t3)

        print_char_special_token_c.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %s special case
        """

        """
        When special character == 'f', we will print a string, that corresponds with next parameter
        """
        temp_reg = print_char_special_token_f.addi(t9, -8)
        temp_reg.overrideMemory(t9)

        temp_reg = print_char_special_token_f.addui(s2, 7)
        temp_reg.overrideMemory(s2)

        temp_reg = print_char_special_token_f.addui(zero, 2)
        temp_reg.overrideMemory(v0)

        temp_reg = print_char_special_token_f.lw(t3, 0)
        temp_reg.overrideMemory(t1)
        f12 = Memory("f12", True)
        print_char_special_token_f.mtc1(t1, f12)

        temp_reg = print_char_special_token_f.addui(t3, 4)
        temp_reg.overrideMemory(t3)
        print_char_special_token_f.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %s special case
        """
        temp_reg = print_char_special_token_s.lw(t3, 0)
        temp_reg.overrideMemory(t7)

        temp_reg = print_char_special_token_s_width_loop.lb(t7, 0)
        temp_reg.overrideMemory(t1)

        temp_reg = print_char_special_token_s_width_loop.li(0)
        temp_reg.overrideMemory(t8)
        print_char_special_token_s_width_loop.beq(t1, t8, print_char_special_token_s_after.label)

        temp_reg = print_char_special_token_s_width_loop.addui(s2, 1)
        temp_reg.overrideMemory(s2)

        temp_reg = print_char_special_token_s_width_loop.addi(t7, 1)
        temp_reg.overrideMemory(t7)

        temp_reg = print_char_special_token_s_width_loop.addi(t9, -1)
        temp_reg.overrideMemory(t9)

        print_char_special_token_s_width_loop.j(print_char_special_token_s_width_loop.label)

        """
        When special character == 's', we will print a string, that corresponds with next parameter
        """
        temp_reg = print_char_special_token_s_after.addui(zero, 4)
        temp_reg.overrideMemory(v0)

        temp_reg = print_char_special_token_s_after.addui(s2, -1)
        temp_reg.overrideMemory(s2)

        temp_reg = print_char_special_token_s_after.lw(t3, 0)
        temp_reg.overrideMemory(t1)

        temp_reg = print_char_special_token_s_after.addui(t3, 4)
        temp_reg.overrideMemory(t3)
        print_char_special_token_s_after.j(print_char_special_token_end_if.label)

        """
        Load the latest parameter value for %x special case
        """

        """
        When special character == 'x', we will print a string, that corresponds with next parameter
        """

        temp_reg = print_char_special_token_x.addui(zero, 11)
        temp_reg.overrideMemory(v0)

        """
        Initialize counter
        """
        temp_reg = print_char_special_token_x.li(0)
        temp_reg.overrideMemory(s0)

        temp_reg = print_char_special_token_x.addi(t9, -8)
        temp_reg.overrideMemory(t9)
        """
        x width
        """

        temp_reg = xwidth_space_loop.li(1)
        temp_reg.overrideMemory(t8)

        temp_reg = xwidth_space_loop.slt(t9, t8)
        temp_reg.overrideMemory(t7)

        xwidth_space_loop.beq(t7, t8, print_x_half_byte_loop.label)
        xwidth_space_loop.move(t7, v0)

        temp_reg = xwidth_space_loop.li(11)
        temp_reg.overrideMemory(v0)

        temp_reg = xwidth_space_loop.li(32)
        temp_reg.overrideMemory(a0)

        temp_reg = xwidth_space_loop.addui(s2, 1)
        temp_reg.overrideMemory(s2)
        xwidth_space_loop.systemCall()

        temp_reg = xwidth_space_loop.addui(t9, -1)
        temp_reg.overrideMemory(t9)

        xwidth_space_loop.move(v0, t7)

        temp_reg = xwidth_space_loop.li(0)
        temp_reg.overrideMemory(t8)

        xwidth_space_loop.bne(t9, t8, xwidth_space_loop.label)
        xwidth_space_loop.j(print_x_half_byte_loop.label)

        """
        Jump to skipper
        """
        print_char_special_token_x.j(print_x_first_skipper.label)

        x_char = print_x_first_skipper.lw(t3, 0)
        x_char.overrideMemory(t1)

        x_char = print_x_first_skipper.sllv(t1, s0)
        x_char.overrideMemory(t1)
        x_char = print_x_first_skipper.srl(t1, 28)
        x_char.overrideMemory(t1)

        temp_reg = print_x_first_skipper.li(0)
        temp_reg.overrideMemory(t6)

        print_x_first_skipper.bne(t1, t6, xwidth_space_loop.label)

        temp_reg = print_x_first_skipper.li(28)
        temp_reg.overrideMemory(t6)
        print_x_first_skipper.beq(t6, s0, xwidth_space_loop.label)

        temp_reg = print_x_first_skipper.addi(t9, 1)
        temp_reg.overrideMemory(t9)

        temp_reg = print_x_first_skipper.addui(s0, 4)
        temp_reg.overrideMemory(s0)

        print_x_first_skipper.j(print_x_first_skipper.label)

        """
        Start print loop
        """
        x_char = print_x_half_byte_loop.lw(t3, 0)
        x_char.overrideMemory(t1)

        """
        Display the first 4 bits as hex
        Using a mathematical formula we can make sure to display 'a-f', without need for any branches
        """
        temp_reg = print_x_half_byte_loop.li(28)
        temp_reg.overrideMemory(s1)

        print_x_half_byte_loop.beq(s0, s1, print_x_half_byte_loop_after.label)
        """
        Take 4 bits at a time
        """
        x_char = print_x_half_byte_loop.sllv(t1, s0)
        x_char.overrideMemory(t1)
        temp_reg = print_x_half_byte_loop.srl(t1, 28)
        temp_reg.overrideMemory(t1)

        """
        Print it to ascii character range starting with '0'
        """
        temp_reg = print_x_half_byte_loop.addui(t1, 48)
        temp_reg.overrideMemory(t1)

        temp_reg = print_x_half_byte_loop.addui(zero, 58)
        temp_reg.overrideMemory(t5)

        temp_reg = print_x_half_byte_loop.div(t1, t5)
        temp_reg.overrideMemory(t4)
        print_x_half_byte_loop.mflo(t4)
        temp_reg = print_x_half_byte_loop.andi(t4, 1)
        temp_reg.overrideMemory(t5)
        temp_reg = print_x_half_byte_loop.addi(t4, 38)
        temp_reg.overrideMemory(t4)
        temp_reg = print_x_half_byte_loop.mul(t5, t4)
        temp_reg.overrideMemory(t5)
        print_x_half_byte_loop.add(t5, t1, t1)

        """
        Display first 4 bits as hex
        """
        temp_reg = print_x_half_byte_loop.addui(zero, 11)
        temp_reg.overrideMemory(v0)

        print_x_half_byte_loop.add(zero, t1, a0)

        temp_reg = print_x_half_byte_loop.addui(s2, 1)
        temp_reg.overrideMemory(s2)
        print_x_half_byte_loop.systemCall()

        temp_reg = print_x_half_byte_loop.addui(s0, 4)
        temp_reg.overrideMemory(s0)

        temp_reg = print_x_half_byte_loop.li(28)
        temp_reg.overrideMemory(s1)

        print_x_half_byte_loop.beq(s0, s1, print_x_half_byte_loop_after.label)
        print_x_half_byte_loop.j(print_x_half_byte_loop.label)

        """
        Display the second part (last 4 bits)
        No seperate syscall will occur, but just the default syscall
        """
        x_char = print_x_half_byte_loop_after.lb(t3, 0)
        x_char.overrideMemory(t1)

        """
        Wipe all expect last 4 bites
        """
        temp_reg = print_x_half_byte_loop_after.sll(t1, 28)
        temp_reg.overrideMemory(t1)
        temp_reg = print_x_half_byte_loop_after.srl(t1, 28)
        temp_reg.overrideMemory(t1)

        """
        Print it to ascii character range starting with '0'
        """
        temp_reg = print_x_half_byte_loop_after.addui(t1, 48)
        temp_reg.overrideMemory(t1)

        temp_reg = print_x_half_byte_loop_after.addui(zero, 58)
        temp_reg.overrideMemory(t5)

        temp_reg = print_x_half_byte_loop_after.div(t1, t5)
        temp_reg.overrideMemory(t4)
        print_x_half_byte_loop_after.mflo(t4)
        temp_reg = print_x_half_byte_loop_after.andi(t4, 1)
        temp_reg.overrideMemory(t5)
        temp_reg = print_x_half_byte_loop_after.addi(t4, 38)
        temp_reg.overrideMemory(t4)
        temp_reg = print_x_half_byte_loop_after.mul(t5, t4)
        temp_reg.overrideMemory(t5)
        print_x_half_byte_loop_after.add(t5, t1, t1)

        temp_reg = print_x_half_byte_loop_after.addui(t3, 4)
        temp_reg.overrideMemory(t3)

        print_x_half_byte_loop_after.j(print_char_special_token_end_if.label)

        """
        Set return value to 0
        """
        printf_char_loop_end.move(v0, s2)

        function.endFunction()
        return function


class Calculation:
    @staticmethod
    def modulo(left, right):
        block = MipsSingleton.getInstance().getCurrentBlock()
        div_var = block.div(left, right)
        instr = block.mfhi(div_var)

        return instr

    @staticmethod
    def operation(left: Memory, right: Memory, operator):
        block = MipsSingleton.getInstance().getCurrentBlock()

        to_type = None

        is_ptr = False
        ptr = None
        not_ptr = None
        if isinstance(left, Memory) and isinstance(left.symbol_type, SymbolTypePtr) and operator in ["+", "-"]:
            is_ptr = True
            ptr = left
            not_ptr = right
            to_type = left.symbol_type

        if isinstance(right, Memory) and isinstance(right.symbol_type, SymbolTypePtr) and operator in ["+", "-"]:
            is_ptr = True
            ptr = right
            not_ptr = left
            to_type = right.symbol_type

        if is_ptr:
            li = block.li(max(ptr.symbol_type.deReference().getBytesUsed(), 4))
            mul = block.mul(not_ptr, li)
            if operator == "+":
                instr = block.addu(ptr, mul)
            else:
                instr = block.subu(ptr, mul)
            instr.symbol_type = to_type
            return instr


        op_translate = {"+": block.add,
                        "-": block.sub,
                        "()": FunctionMet.functionCall,
                        "*": block.mul,
                        "/": block.div,
                        "%": Calculation.modulo,
                        "<<": block.sll,
                        ">>": block.srl,
                        "&": block.mips_and,
                        "|": block.mips_or,
                        "^": block.xor,
                        "[]": AccessWrapper.access,
                        "<": block.slt,
                        ">": block.sgt,
                        "<=": BinaryWrapper.lessEqual,
                        ">=": BinaryWrapper.greaterEqual,
                        "==": BinaryWrapper.equal,
                        "!=": BinaryWrapper.notEqual
                        }

        mips_op = op_translate.get(operator, None)
        if isinstance(right, Memory):
            if mips_op == block.sll:
                mips_op = block.sllv
            elif mips_op == block.srl:
                mips_op = block.srlv

        instr = mips_op(left, right)
        if instr.symbol_type is None:
            instr.symbol_type = to_type

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


class FunctionMet:
    @staticmethod
    def functionCall(func_name, params: list[Memory]):
        """
        Handle a function call
        """

        """
        store all the parameters on the stack so, the callee can access these later on
        """

        FunctionMet.storeParameters(params)

        block = MipsSingleton.getInstance().getCurrentBlock()

        """
        Func ptrs have a register with the func name
        """
        if isinstance(func_name, Memory):
            block.jalr(func_name)
        else:
            block.jal(f"function_{func_name.getFunctionName()}")

        FunctionMet.loadParameters(params)

        """
        Store the return value in a specific register
        """
        free_register = RegisterManager.getInstance().allocate(block)
        block.move(free_register, Memory("v0", True))
        return free_register

    @staticmethod
    def storeParameters(params: list[Memory]):
        """
        Store parameters on the stack for later use
        """

        block = MipsSingleton.getInstance().getCurrentBlock()
        """
        allocate stack memory
        """
        alloc_size = (len(params))*4
        sp_frame = Memory(29, True)

        RegisterManager.getInstance().loadIfNeeded(block, params)

        block.addui_function(sp_frame, -alloc_size, sp_frame)
        for i, p in enumerate(params):
            block.sw(p, sp_frame, (i+1)*4)

    @staticmethod
    def loadParameters(params: list[Memory]):
        """
        Load parameters on the stack for later use
        """

        block = MipsSingleton.getInstance().getCurrentBlock()
        """
        allocate stack memory
        """
        alloc_size = (len(params)) * 4
        sp_frame = Memory(29, True)

        for i, p in enumerate(params):
            block.lw_function(sp_frame, (i + 1) * 4, p)

        block.addui_function(sp_frame, alloc_size, sp_frame)

    @staticmethod
    def handleReturn(return_value: Memory):
        block = MipsSingleton.getInstance().getCurrentBlock()

        v0 = Memory("v0", True)

        """
        Store return value in return register
        """
        block.move(v0, return_value)
        block.j(f"function_{block.function.getFunctionName()}_load")


class Comment:
    @staticmethod
    def comment(text):
        MipsSingleton.getInstance().getCurrentBlock().comment(text)


class Conversion:
    @staticmethod
    def convert(var, to_type, from_type):
        """
        dict we use to retrieve which conversion command to call
        """
        block = MipsSingleton.getInstance().getCurrentBlock()  # Get the current block

        """
        Special cases of casting between ptrs
        """

        if to_type.getPtrAmount() != from_type.getPtrAmount() and min(to_type.getPtrAmount(), from_type.getPtrAmount()) != 0:

            ptr_difference = from_type.getPtrAmount() - to_type.getPtrAmount()
            for t in range(max(ptr_difference, 0)):
                var = block.lw(var, 0)

            var.symbol_type = to_type
            return var


        conversion_dict = {("INT", "FLOAT"): lambda x: block.sitofp(x, Memory("f0", True)),
                           ("CHAR", "FLOAT"): lambda x: block.sitofp(x, Memory("f0", True)),
                           ("PTR", "FLOAT"): lambda x: block.sitofp(x, Memory("f0", True)),
                           ("BOOL", "FLOAT"): lambda x: block.sitofp(x, Memory("f0", True)),
                           ("FLOAT", "INT"): lambda x: block.fptosi(x),
                           ("FLOAT", "CHAR"): lambda x: block.slr(block.sll(block.fptosi(x), 24), 24),  # First convert to int, then to char
                           ("FLOAT", "PTR"): lambda x: block.fptosi(x),
                           ("FLOAT", "BOOL"): lambda x: BinaryWrapper.notEqual(block.fptosi(x), block.li(0)),
                           ("INT", "BOOL"): lambda x: BinaryWrapper.notEqual(x, block.li(0)),
                           ("PTR", "BOOL"): lambda x: BinaryWrapper.notEqual(x, block.li(0)),
                           ("INT", "CHAR"): lambda x: block.srl(block.sll(x, 24), 24),
                           ("CHAR", "INT"): lambda x: x,
                           ("BOOL", "INT"): lambda x: x,
                           ("BOOL", "CHAR"): lambda x: x,
                           ("INT", "PTR"): lambda x: x,
                           ("PTR", "INT"): lambda x: x,
                           ("CHAR", "BOOL"): lambda x: BinaryWrapper.notEqual(x, block.li(0))
                           }

        c = conversion_dict.get((from_type.getType(), to_type.getType()))
        var = c(var)
        var.symbol_type = to_type
        return var
