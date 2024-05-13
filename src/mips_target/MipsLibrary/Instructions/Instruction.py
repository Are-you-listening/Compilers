from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod


class Instruction:

    @abstractmethod
    def toString(self):
        pass
