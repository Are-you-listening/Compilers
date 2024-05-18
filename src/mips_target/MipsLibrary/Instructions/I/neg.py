from .IMipsInstruction import IMipsInstruction, Memory


class Neg(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory):
        super().__init__(rs, rt)

    def toString(self):
        return f"neg ${self.rt}, ${self.rs}"
