from .IMipsInstruction import IMipsInstruction, Memory


class Lb(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value):
        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"lb ${self.rt}, {self.immediate.real}(${self.rs})"
