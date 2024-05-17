from .SpecialInstruction import SpecialInstruction, Memory


class Neg(SpecialInstruction):
    def __init__(self, rd: Memory, rs: Memory):
        super().__init__(rd=rd, rs=rd, rt=rd)

    def toString(self):
        return f"neg ${self.rd}, ${self.rs}"
