from .IMipsInstruction import IMipsInstruction, Memory


class Lw(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value):
        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"lw ${self.rt} {self.immediate}({self.rs})"
