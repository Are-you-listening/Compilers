from .RMipsInstruction import RMipsInstruction, Memory


class Or(RMipsInstruction):
    def __init__(self, rd: Memory, rs: Memory, rt: Memory):
        super().__init__(rd=rd, rs=rs, rt=rt)

    def toString(self):
        return f"or ${self.rd} {self.rs} {self.rt}"

