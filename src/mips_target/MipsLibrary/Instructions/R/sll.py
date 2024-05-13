from .RMipsInstruction import RMipsInstruction, Memory


class Sll(RMipsInstruction):
    def __init__(self, rd: Memory, rt: Memory, shamt: int):
        super().__init__(rd=rd, rt=rt, shamt=shamt)

    def toString(self):
        return f"sll ${self.rd} {self.rs} {self.rt}"