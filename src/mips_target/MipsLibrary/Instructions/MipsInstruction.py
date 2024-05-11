from Register import Register
from abc import abstractmethod


class MipsInstructions:
    def __init__(self, to_register: Register, from_registers: list[Register]):
        self.to_register = to_register
        self.from_registers = from_registers

    @abstractmethod
    def toString(self):
        pass

