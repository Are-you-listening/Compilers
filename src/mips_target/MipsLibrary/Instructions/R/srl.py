from .RMipsInstruction import RMipsInstruction, Memory


class Srl(RMipsInstruction):
    def __init__(self, rd: Memory, rt: Memory, shamt: int):
        super().__init__(rd=rd, rt=rt, shamt=shamt)

    def toString(self):
        return f"srl ${self.rd} {self.rs} {self.rt}"
