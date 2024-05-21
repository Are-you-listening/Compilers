from .RMipsInstruction import RMipsInstruction, Memory


class Sllv(RMipsInstruction):
    def __init__(self, rd: Memory, rt: Memory, shamt: Memory):
        super().__init__(rd=rd, rt=rt, shamt=0, rs=shamt)

    def toString(self):
        return f"sllv ${self.rd}, ${self.rt}, ${self.rs}"
