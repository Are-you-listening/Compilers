from .SpecialInstruction import SpecialInstruction, Memory


class Neg(SpecialInstruction):
    def __init__(self, rd: Memory, rs: Memory):
        super().__init__()
        self.rd = rd.getAddress()
        self.rs = rs.getAddress()

    def toString(self):
        return f"neg ${self.rd}, ${self.rs}"
