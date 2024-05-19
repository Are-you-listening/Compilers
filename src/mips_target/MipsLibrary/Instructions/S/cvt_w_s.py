from .SpecialInstruction import SpecialInstruction, Memory


class Cvt_w_s(SpecialInstruction):
    def __init__(self, Float: Memory):
        super().__init__()
        self.Float = Float.getAddress()

    def toString(self):
        return f"cvt.w.s ${self.Float}, ${self.Float}"

    def getAddress(self):
        return "you can't really do this actually"
