from .IMipsInstruction import IMipsInstruction, Memory


class Beq(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory):
        super().__init__(rs, rt)

    def toString(self):
        return f"beq ${self.rt} {self.rs}"
