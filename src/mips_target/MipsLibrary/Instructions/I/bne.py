from .IMipsInstruction import IMipsInstruction, Memory


class Bne(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory):
        super().__init__(rs, rt)

    def toString(self):
        return f"bne ${self.rt} {self.rs}"
