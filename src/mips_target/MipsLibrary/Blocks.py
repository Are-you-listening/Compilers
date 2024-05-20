from .Instructions import *
from .Memory import Memory, RegisterManager
from src.parser.Tables.SymbolType import SymbolType


class Block:

    @staticmethod
    def __range_check(immediate: int):
        """Split the immediate into two parts for the `lui` instruction and the remainder"""
        # Check if the immediate value is within the 16-bit signed integer range
        if -32768 <= immediate <= 32767:
            return 0, immediate

        # For large positive or negative values, ensure we handle 32-bit signed values correctly
        if immediate < 0:
            immediate = (1 << 32) + immediate

        # Split the immediate value into upper and lower 16-bit parts
        lui_value = (immediate >> 16) & 0xFFFF
        remainder = immediate & 0xFFFF

        # Adjust remainder to fit within the 16-bit signed integer range
        if remainder & 0x8000:  # Check if the highest bit (sign bit) is set
            remainder -= 0x10000  # Adjust to a negative value in the 16-bit range

        return lui_value, remainder

    def __handle_large_immediate(self, rt, rs, immediate, instruction_class):
        lui_value, remainder = Block.__range_check(immediate)

        instructions = []

        if lui_value != 0:
            # Add the lui instruction to load upper immediate value
            lui_instr = Lui(rt, lui_value)
            instructions.append(lui_instr)

            # Add the specific instruction with the remainder
            instr = instruction_class(rt, rt, remainder)
        else:
            # Use the instruction directly if no lui part is needed
            instr = instruction_class(rt, rs, remainder)

        instructions.append(instr)
        self.instructions.extend(instructions)
        return instr.getAddress()

    def __init__(self, label: str = None, function= None):
        self.label = label
        self.instructions: list[Instruction] = []
        self.function = function

    def li(self, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)
        return self.__handle_large_immediate(rt, rt, immediate, Li)

    def lw(self, rs: Memory, load_value: int, load_global=False, global_name=""):
        """
        load word function

        :param rs:
        :param load_value:
        :param rt:
        :param load_global:
        :param global_name:
        :return:
        """
        rt = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rs])

        instr = Lw(rt, rs, load_value, load_global, global_name)
        self.instructions.append(instr)
        return instr.getAddress()

    def lw_function(self, rs: Memory, load_value: int, rt: Memory):
        """
        This Lw function is used for function frame ptr and RegisterManager, and LoadParameters overhead ONLY.
        The reason it is, is because we cannot have any spill overhead during this procedure

        """


        instr = Lw(rt, rs, load_value, False, "")
        self.instructions.append(instr)
        return instr.getAddress()

    def lb(self, rs: Memory, load_value: int):

        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Lb(rt, rs, load_value)
        self.instructions.append(instr)
        return instr.getAddress()

    def addi(self, rs: Memory, load_value: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        return self.__handle_large_immediate(rt, rs, load_value, Addi)

    def addui(self, rs: Memory, load_value: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        return self.__handle_large_immediate(rt, rs, load_value, Addiu)

    def addui_function(self, rs: Memory, load_value: int, rt: Memory):
        """
        This addUI function is used for function frame ptr and RegisterManager, and LoadParameters overhead ONLY.
        :return:
        """

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Addiu(rt, rs, load_value)
        self.instructions.append(instr)
        return instr.getAddress()

    def andi(self, rs: Memory, load_value: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        return self.__handle_large_immediate(rt, rs, load_value, Andi)

    def beq(self, rt: Memory, rs: Memory, label: str):
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        instr = Beq(rt, rs, label)
        self.instructions.append(instr)
        return instr.getAddress()

    def bne(self, rt: Memory, rs: Memory, label: str):
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        instr = Bne(rt, rs, label)
        self.instructions.append(instr)
        return instr.getAddress()

    def ori(self, rs: Memory, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        return self.__handle_large_immediate(rt, rs, immediate, Ori)

    def slti(self, rs: Memory, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        return self.__handle_large_immediate(rt, rs, immediate, Slti)

    def sltiu(self, rs: Memory, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        return self.__handle_large_immediate(rt, rs, immediate, Sltiu)

    def sw(self, rt: Memory, rs: Memory, immediate: int):
        RegisterManager.getInstance().loadIfNeeded(self, [rt, rs])
        return self.__handle_large_immediate(rt, rs, immediate, Sw)

    def sw_spill(self, rt: Memory, rs: Memory, immediate: int):
        """
        Store function that only be used in spill, because it will not load
        the variable it needs to store
        """

        return self.__handle_large_immediate(rt, rs, immediate, Sw)

    def __moveToC1(self, lst: list[Memory]):
        temp = []
        for i in range(0, len(lst)):
            fi = Memory(f"f{i}", True)
            instr = Mtc1(lst[i], fi)
            self.instructions.append(instr)
            temp.append(fi)
        return temp

    def add(self, rs: Memory, rt: Memory, rd: Memory = None, loadable: bool = True):
        if rd is None:
            rd = RegisterManager.getInstance().allocate(self)

        if loadable:
            RegisterManager.getInstance().loadIfNeeded(self, [rs, rt, rd])

        if rs.symbol_type is not None and rs.symbol_type.getBaseType() == "FLOAT" and rs.symbol_type.isBase():
            instr = Add_s(self.__moveToC1([rd, rs, rs]))
            self.instructions.append(instr)

            rd = self.mfc1(instr.return_value, rd)
            rd.symbol_type = SymbolType("FLOAT", None)
            return rd
        else:
            instr = Add(rd, rs, rt)
            self.instructions.append(instr)

        return instr.getAddress()

    def addu(self, rs: Memory, rt: Memory):

        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt, rd])

        instr = Addu(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def jr(self, rd: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rd])

        instr = Jr(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def move(self, rt: Memory, rs: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Move(rt, rs)
        self.instructions.append(instr)
        return instr.getAddress()

    def mips_and(self, rs: Memory, rt: Memory):

        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = And(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def mips_or(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Or(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def nor(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])
        instr = Nor(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def xor(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Xor(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def mips_not(self, rs: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs])

        instr = Not(rd, rs)
        self.instructions.append(instr)
        return instr.getAddress()

    def sll(self, rt: Memory, shamt: int):
        rd = RegisterManager.getInstance().allocate(self)
        instr = Sll(rd, rt, shamt)
        self.instructions.append(instr)
        return instr.getAddress()

    def slt(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Slt(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def sgt(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Sgt(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def srl(self, rt: Memory, shamt: int):
        rd = RegisterManager.getInstance().allocate(self)
        instr = Srl(rd, rt, shamt)
        self.instructions.append(instr)
        return instr.getAddress()

    def sub(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        if rs.symbol_type is not None and rs.symbol_type.data_type == "FLOAT":
            instr = Div_s(self.__moveToC1([rd, rs, rs]))
            self.instructions.append(instr)

            self.mfc1(instr.return_value, rd)
            rd.symbol_type = SymbolType("FLOAT", None)
            return rd
        else:
            instr = Sub(rd, rs, rt)
            self.instructions.append(instr)

        return instr.getAddress()

    def subu(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Subu(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def la(self, label: str):
        rt = RegisterManager.getInstance().allocate(self)
        instr = La(rt, label)
        self.instructions.append(instr)
        return rt

    def j(self, label: str):
        instr = J(label)
        self.instructions.append(instr)
        return instr.getAddress()

    def div(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        if rs.symbol_type is not None and rs.symbol_type.data_type == "FLOAT":
            instr = Div_s(self.__moveToC1([rd, rs, rs]))
            self.instructions.append(instr)
            self.mfc1(instr.return_value, rd)
            rd.symbol_type = SymbolType("FLOAT", None)
            return rd
        else:
            instr = Div(rd, rs, rt)
            self.instructions.append(instr)

        return instr.getAddress()

    def mul(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        if rs.symbol_type is not None and rs.symbol_type.data_type == "FLOAT":
            instr = Div_s(self.__moveToC1([rd, rs, rs]))
            self.instructions.append(instr)
            self.mfc1(instr.return_value, rd)
            rd.symbol_type = SymbolType("FLOAT", None)
            return rd
        else:
            instr = Mul(rd, rs, rt)
            self.instructions.append(instr)
        return instr.getAddress()

    def neg(self, rs: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs])

        instr = Neg(rd, rs)
        self.instructions.append(instr)
        return instr.getAddress()

    def mflo(self, rd: Memory):
        instr = Mflo(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def mfhi(self, rd: Memory):
        instr = Mfhi(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def jal(self, label: str):
        instr = Jal(label)
        self.instructions.append(instr)
        return instr.getAddress()

    def jalr(self, rt: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rt])
        instr = Jalr(rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def systemCall(self):
        instr = Systemcall()
        self.instructions.append(instr)
        return instr.getAddress()

    def comment(self, text: str):
        instr = Comment(text)
        self.instructions.append(instr)
        return instr.getAddress()

    def sitofp(self, general: Memory, Float: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [general, Float])

        instr = Mtc1(general, Float)
        self.instructions.append(instr)

        instr = Cvt_s_w(Float)
        self.instructions.append(instr)

        instr = Mfc1(general, Float)
        self.instructions.append(instr)

        general.symbol_type = SymbolType("FLOAT", None)

        return general

    def fptosi(self, Float: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [Float])

        assert Float.symbol_type.getBaseType() == "FLOAT"  # TODO Remove later
        f0 = Memory("f0", True)
        instr = Mtc1(Float, f0)
        self.instructions.append(instr)

        instr = Cvt_w_s(f0)
        self.instructions.append(instr)

        instr = Mfc1(Float, f0)
        self.instructions.append(instr)

        Float.symbol_type = SymbolType("INT", None)

        return Float

    def mtc1(self, general: Memory, Float: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [general, Float])
        instr = Mtc1(general, Float)
        self.instructions.append(instr)
        return Float

    def mfc1(self, Float: Memory, general: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [general, Float])
        instr = Mfc1(general, Float)
        self.instructions.append(instr)
        return general

    def l_s(self, var_name: str):
        # Load a float value
        instr = L_s(Memory("f0", True), var_name)
        self.instructions.append(instr)

        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rd])

        instr = Mfc1(rd, instr.rd)  # Move to normal registers
        rd.symbol_type = SymbolType("FLOAT", None)
        self.instructions.append(instr)
        return rd

    def toString(self):
        s = ""
        if self.label is not None:
            s += f"{self.label}:\n"
        for i in self.instructions:
            if isinstance(i, str):
                pass
            s += i.toString()
            s += "\n"

        return s

    def getParameter(self, index):
        """
        Get a specific parameter provided base on the parameter index
        """
        fp_register = Memory(30, True)

        instr = self.lw(fp_register, 4*(index+1))
        return instr

    def createParameters(self, parameter_list: list[Memory]):
        bytes_needed = (len(parameter_list)+1)*4

        sp_register = Memory(31, True)

        """
        Allocate stack space for the parameters
        """
        self.addui_function(sp_register, -bytes_needed, sp_register)

        """
        Store parameters on the stack
        """
        for i, p in enumerate(parameter_list):
            self.sw(p, sp_register, (i+1)*4)