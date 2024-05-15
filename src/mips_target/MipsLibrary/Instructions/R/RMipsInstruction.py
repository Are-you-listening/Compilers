from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class RMipsInstruction(Instruction):
    def __init__(self, rs: Memory, rt: Memory, rd: Memory, shamt: int=0):
        self.rs = rs.register_number
        self.rt = rt.register_number
        self.rd = rd.register_number
        self.shamt = shamt

    @abstractmethod
    def toString(self):
        pass
