from .SpecialInstruction import SpecialInstruction, Memory


class Mfc1(SpecialInstruction):
    def __init__(self, rd: Memory, rs: Memory):
        super().__init__()
        self.rd = rd.getAddress()
        self.rs = rs.getAddress()

    def toString(self):
        return f"mfc1 ${self.rd}, ${self.rs}"
