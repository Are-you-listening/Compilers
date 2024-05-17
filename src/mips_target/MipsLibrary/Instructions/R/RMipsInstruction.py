from src.mips_target.MipsLibrary.Memory import Memory, RegisterManager
from abc import abstractmethod
from ..Instruction import Instruction


class RMipsInstruction(Instruction):
    def __init__(self, rs: Memory, rt: Memory, rd: Memory, shamt: int=0):
        self.rs = rs.getAddress()
        self.rt = rt.getAddress()
        self.rd = rd.getAddress()
        self.return_value = rd
        self.return_value.from_block = self
        self.shamt = shamt

    @abstractmethod
    def toString(self):
        pass

    def getAddress(self):
        return self.return_value

    def overrideMemory(self, other: "Memory"):

        self.rd = other.getAddress()
        self.return_value = Memory(other.getAddress(), other.is_loaded)
