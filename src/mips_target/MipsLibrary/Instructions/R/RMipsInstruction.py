from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class RMipsInstruction(Instruction):
    def __init__(self, rs: Memory, rt: Memory, rd: Memory, shamt: int=0):
        self.rs = rs
        self.rt = rt
        self.rd = rd
        self.shamt = shamt

    @abstractmethod
    def toString(self):
        pass
