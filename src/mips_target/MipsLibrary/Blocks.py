from .Instructions import *


class Block:
    def __init__(self, label: str):
        self.label = label
        self.instructions: list[MipsInstructions] = []

    def load(self, load_register: Register, load_address_register: Register, offset: int = 0):
        instr = Load(load_register, load_address_register, offset)
        self.instructions.append(instr)

    def toString(self):
        s = ""
        for i in self.instructions:
            s += i.toString()
            s += "\n"

        return s

    def alloca(self):
        """
        Get a register for a variable
        """

        return 1
