from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class FloatMipsInstruction(Instruction):
    def __init__(self, fd: Memory, fs: Memory, ft: Memory,):
        self.ft = ft.getAddress()
        self.fs = fs.getAddress()
        self.fd = fd.getAddress()
        self.return_value = fd

    @abstractmethod
    def toString(self):
        pass

    def getAddress(self):
        return self.return_value
