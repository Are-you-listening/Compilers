from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class SpecialInstruction(Instruction):
    @abstractmethod
    def toString(self):
        pass

    @abstractmethod
    def getAddress(self):
        pass

