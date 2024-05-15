from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class IMipsInstruction(Instruction):
    def __init__(self, rs: Memory, rt: Memory, immediate: int=0):
        self.rs = rs.register_number
        self.rt = rt.register_number
        self.immediate = immediate

    @abstractmethod
    def toString(self):
        pass
