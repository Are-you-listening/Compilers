from .RMipsInstruction import RMipsInstruction, Memory


class Slt(RMipsInstruction):
    def __init__(self, rd: Memory, rs: Memory, rt: Memory):
        super().__init__(rd=rd, rt=rt, rs=rs)

    def toString(self):
        return f"slt ${self.rd}, ${self.rs}, ${self.rt}"
