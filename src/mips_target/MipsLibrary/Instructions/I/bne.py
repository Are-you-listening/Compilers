from .IMipsInstruction import IMipsInstruction, Memory


class Bne(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, label: str):
        super().__init__(rs, rt)
        self.label = label

    def toString(self):
        return f"bne ${self.rt}, ${self.rs}, {self.label}"
