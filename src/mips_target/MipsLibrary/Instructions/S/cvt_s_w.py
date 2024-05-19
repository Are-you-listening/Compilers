from .SpecialInstruction import SpecialInstruction, Memory


class Cvt_s_w(SpecialInstruction):
    def __init__(self, rd: Memory):
        super().__init__()
        self.rd = rd

    def toString(self):
        return f"cvt.s.w ${self.rd.getAddress()}, ${self.rd.getAddress()}"

    def getAddress(self):
        return self.rd
