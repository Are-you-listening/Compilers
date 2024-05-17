from .RMipsInstruction import RMipsInstruction, Memory


class Mfhi(RMipsInstruction):
    def __init__(self, rd: Memory):
        super().__init__(rd=rd, rt=rd, rs=rd)

    def toString(self):
        return f"mfhi ${self.rd}"
