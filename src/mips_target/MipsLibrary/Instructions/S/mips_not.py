from .SpecialInstruction import SpecialInstruction, Memory


class Not(SpecialInstruction):
    def __init__(self, rt: Memory, rs: Memory):
        super().__init__()
        self.rt = rt.getAddress()
        self.rs = rs.getAddress()

    def toString(self):
        return f"not ${self.rt}, ${self.rs}"
