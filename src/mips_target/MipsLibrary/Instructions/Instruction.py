from abc import abstractmethod


class Instruction:
    @abstractmethod
    def toString(self):
        pass

    @abstractmethod
    def getAddress(self):
        pass
