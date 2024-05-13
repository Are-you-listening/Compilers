from .RMipsInstruction import RMipsInstruction, Memory


class And(RMipsInstruction):
    def __init__(self, rd: Memory, rs: Memory, rt: Memory):
        super().__init__(rd=rd, rs=rs, rt=rt)

    def toString(self):
        return f"and ${self.rd} {self.rs} {self.rt}"
