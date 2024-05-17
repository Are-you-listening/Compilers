from .Instructions import *
from .Memory import Memory


class Block:
    def __init__(self, label: str = None, function= None):
        self.label = label
        self.instructions: list[Instruction] = []
        self.function = function

    def li(self, rt: Memory, immediate: int):
        if -32768 <= immediate <= 32767:
            instr = Addi(rt, Memory(0, True), immediate)
            self.instructions.append(instr)
        else:
            upper = (immediate >> 16) & 0xFFFF
            lower = immediate & 0xFFFF
            if upper:
                instr = Lui(rt, upper)
                self.instructions.append(instr)
                if lower:
                    instr = Ori(rt, rt, lower)
                    self.instructions.append(instr)
            else:
                instr = Ori(rt, Memory(0, True), lower)
                self.instructions.append(instr)
        return instr

    def lw(self, rt: Memory, rs: Memory, load_value: int):
        instr = Lw(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def lb(self, rt: Memory, rs: Memory, load_value: int):
        instr = Lb(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def addi(self, rt: Memory, rs: Memory, load_value: int):
        instr = Addi(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def addui(self, rt: Memory, rs: Memory, load_value: int):
        instr = Addiu(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def andi(self, rt: Memory, rs: Memory, load_value: int):
        instr = Andi(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def beq(self, rt: Memory, rs: Memory, label: str):
        instr = Beq(rt, rs, label)
        self.instructions.append(instr)
        return instr

    def bne(self, rt: Memory, rs: Memory):
        instr = Bne(rt, rs)
        self.instructions.append(instr)
        return instr

    def ori(self, rt: Memory, rs: Memory, immediate: int):
        instr = Ori(rt, rs, immediate)
        self.instructions.append(instr)
        return instr

    def slti(self, rt: Memory, rs: Memory, immediate: int):
        instr = Slti(rt, rs, immediate)
        self.instructions.append(instr)
        return instr

    def sw(self, rt: Memory, rs: Memory, immediate: int):
        instr = Sw(rt, rs, immediate)
        self.instructions.append(instr)
        return instr

    def add(self, rd: Memory, rs: Memory, rt: Memory):
        instr = Add(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def jr(self, rd: Memory):
        instr = Jr(rd)
        self.instructions.append(instr)
        return instr

    def mips_and(self, rd: Memory, rs: Memory, rt: Memory):
        instr = And(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def mips_or(self, rd: Memory, rs: Memory, rt: Memory):
        instr = Or(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def nor(self, rd: Memory, rs: Memory, rt: Memory):
        instr = Nor(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def xor(self, rd: Memory, rs: Memory, rt: Memory):
        instr = Xor(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def sll(self, rd: Memory, rt: Memory, shamt: int):
        instr = Sll(rd, rt, shamt)
        self.instructions.append(instr)
        return instr

    def slt(self, rd: Memory, rt: Memory, shamt: int):
        instr = Slt(rd, rt, shamt)
        self.instructions.append(instr)
        return instr

    def srl(self, rd: Memory, rt: Memory, shamt: int):
        instr = Srl(rd, rt, shamt)
        self.instructions.append(instr)
        return instr

    def sub(self, rd: Memory, rs: Memory, rt: Memory):
        instr = Sub(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def la(self, rt: Memory, label: str):
        instr = La(rt, label)
        self.instructions.append(instr)
        return instr

    def j(self, label: str):
        instr = J(label)
        self.instructions.append(instr)
        return instr

    def div(self, rd: Memory, rs: Memory, rt: Memory):
        instr = Div(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def mul(self, rd: Memory, rs: Memory, rt: Memory):
        instr =Mul(rd, rs, rt)
        self.instructions.append(instr)
        return instr

    def mflo(self, rd: Memory):
        instr = Mflo(rd)
        self.instructions.append(instr)
        return instr

    def mfhi(self, rd: Memory):
        instr = Mfhi(rd)
        self.instructions.append(instr)
        return instr

    def jal(self, label: str):
        instr = Jal(label)
        self.instructions.append(instr)
        return instr

    def systemCall(self):
        instr = Systemcall()
        self.instructions.append(instr)
        return instr

    def comment(self, text: str):
        instr = Comment(text)
        self.instructions.append(instr)
        return instr

    def toString(self):
        s = ""
        if self.label is not None:
            s += f"{self.label}:\n"
        for i in self.instructions:
            s += i.toString()
            s += "\n"

        return s

    def getParameter(self, index):
        """
        Get a specific parameter provided base on the parameter index
        """
        fp_register = Memory(30, True)

        instr = self.lw(self.getRegister(), fp_register, 4*(index+1))
        return instr

    def createParameters(self, parameter_list: list[Memory]):
        bytes_needed = (len(parameter_list)+1)*4

        sp_register = Memory(31, True)

        """
        Allocate stack space for the parameters
        """
        self.addui(sp_register, sp_register, -bytes_needed)

        """
        Store parameters on the stack
        """
        for i, p in enumerate(parameter_list):
            self.sw(p, sp_register, (i+1)*4)

    def getRegister(self):
        """
        Get a register for a variable
        """

        return Memory(1, True)
