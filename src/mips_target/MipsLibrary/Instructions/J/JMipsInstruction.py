from src.mips_target.MipsLibrary.Memory.Memory import Memory
from abc import abstractmethod
from ..Instruction import Instruction


class JMipsInstruction(Instruction):
    def __init__(self, label: str):
        """

        :param label: address_name
        """
        self.label = label

    @abstractmethod
    def toString(self):
        pass

    def getAddress(self):
        return self.label


