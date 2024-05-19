from .SpecialInstruction import SpecialInstruction, Memory


class Mfc1(SpecialInstruction):
    def __init__(self, rd: Memory, rs: Memory):
        super().__init__()
        self.rd = rd
        self.rs = rs

    def toString(self):
        return f"mfc1 ${self.rd.getAddress()}, ${self.rs.getAddress()}"

    def getAddress(self):
        return self.rd
