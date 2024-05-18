from src.mips_target.MipsLibrary.Memory import Memory, RegisterManager
from abc import abstractmethod
from ..Instruction import Instruction


class IMipsInstruction(Instruction):
    def __init__(self, rs: Memory, rt: Memory, immediate: int=0):
        self.rs = rs.getAddress()
        self.rt = rt.getAddress()
        self.return_value = rt
        self.return_value.from_block = self
        self.immediate = immediate

    @abstractmethod
    def toString(self):
        pass

    def getAddress(self):
        return self.return_value

    @abstractmethod
    def getRealRegister(self):
        return self.rt

    def overrideMemory(self, other: "Memory"):
        self.rt = other.getAddress()
        self.return_value = Memory(other.getAddress(), other.is_loaded)


