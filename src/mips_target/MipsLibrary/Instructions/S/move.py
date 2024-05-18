from .SpecialInstruction import SpecialInstruction, Memory


class Move(SpecialInstruction):
    def __init__(self, rt: Memory, rs: Memory):
        super().__init__()
        self.rt = rt.getAddress()
        self.rs = rs.getAddress()

    def toString(self):
        return f"move ${self.rt}, ${self.rs}"
