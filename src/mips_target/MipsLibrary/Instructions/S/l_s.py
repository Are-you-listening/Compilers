from .SpecialInstruction import SpecialInstruction, Memory


class L_s(SpecialInstruction):
    def __init__(self, rd: Memory, data: str):
        super().__init__()
        self.rd = rd
        self.data = data

    def toString(self):
        print(self.rd.getAddress())
        return f"l.s ${self.rd.getAddress()}, {self.data}"

    def getAddress(self):
        return self.rd.getAddress()
