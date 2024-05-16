from .RMipsInstruction import RMipsInstruction, Memory


class Jr(RMipsInstruction):
    def __init__(self, rd: Memory):
        super().__init__(rd=rd, rs=rd, rt=rd)

    def toString(self):
        return f"jr ${self.rd}"
