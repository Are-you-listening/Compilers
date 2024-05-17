from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class IMipsInstruction(Instruction):
    def __init__(self, rs: Memory, rt: Memory, immediate: int=0):
        self.rs = rs.getAddress()
        self.rt = rt.getAddress()
        self.immediate = immediate

    @abstractmethod
    def toString(self):
        pass

    def getAddress(self):
        return self.rt

    def overrideMemory(self, other: "Memory"):
        self.rt = other.getAddress()
