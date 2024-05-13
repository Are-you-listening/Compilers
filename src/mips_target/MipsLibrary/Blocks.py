from .Instructions import *
from .Memory import Memory


class Block:
    def __init__(self, label: str):
        self.label = label
        self.instructions: list[MipsInstructions] = []

    def lw(self, rt: Memory, rs: Memory, load_value: int):
        instr = Lw(rt, rs, load_value)
        self.instructions.append(instr)

        return instr

    def addi(self, rt: Memory, rs: Memory, load_value: int):
        instr = Addi(rt, rs, load_value)
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
