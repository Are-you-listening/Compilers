from .SpecialInstruction import SpecialInstruction, Memory


class Cvt_w_s(SpecialInstruction):
    def __init__(self, rd: Memory):
        super().__init__()
        self.rd = rd

    def toString(self):
        return f"cvt.w.s ${self.rd.getAddress()}, ${self.rd.getAddress()}"

    def getAddress(self):
        return self.rd
