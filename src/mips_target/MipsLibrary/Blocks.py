from .Instructions import *
from .Memory import Memory


class Block:
    def __init__(self, label: str):
        self.label = label
        self.instructions: list[Instruction] = []

    def lw(self, rt: Memory, rs: Memory, load_value: int):
        instr = Lw(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def addi(self, rt: Memory, rs: Memory, load_value: int):
        instr = Addi(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def addui(self, rt: Memory, rs: Memory, load_value: int):
        instr = Addui(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def andi(self, rt: Memory, rs: Memory, load_value: int):
        instr = Andi(rt, rs, load_value)
        self.instructions.append(instr)
        return instr

    def beq(self, rt: Memory, rs: Memory):
        instr = Beq(rt, rs)
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

    def j(self, label: str):
        instr = J(label)
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
        for i in self.instructions:
            s += i.toString()
            s += "\n"

        return s

    def getRegister(self):
        """
        Get a register for a variable
        """

        return 1
