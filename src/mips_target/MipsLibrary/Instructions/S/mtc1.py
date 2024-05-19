from .SpecialInstruction import SpecialInstruction, Memory


class Mtc1(SpecialInstruction):
    def __init__(self, rd: Memory, rs: Memory):
        super().__init__()
        self.rd = rd.getAddress()
        self.rs = rs.getAddress()

    def toString(self):
        return f"mtc1 ${self.rd}, ${self.rs}"

    def getAddress(self):
        return "you can't do this!"
