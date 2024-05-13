from .SpecialInstruction import SpecialInstruction, Memory

class Systemcall(SpecialInstruction):
    def toString(self):
        return "syscall"