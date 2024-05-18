from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class FloatMipsInstruction(Instruction):
    def __init__(self, ft: Memory, fs: Memory, fd: Memory,):
        self.ft = ft.getAddress()
        self.fs = fs.getAddress()
        self.fd = fd.getAddress()

    @abstractmethod
    def toString(self):
        pass