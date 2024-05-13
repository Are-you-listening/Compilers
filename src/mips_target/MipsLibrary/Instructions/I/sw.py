from .IMipsInstruction import IMipsInstruction, Memory


class Sw(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value: int):
        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"sw ${self.rt} {self.immediate}({self.rs})"
