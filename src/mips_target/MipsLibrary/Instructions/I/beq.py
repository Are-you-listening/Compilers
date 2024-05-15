from .IMipsInstruction import IMipsInstruction, Memory


class Beq(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, label: str):
        super().__init__(rs, rt)
        self.label = label

    def toString(self):
        return f"beq ${self.rt}, ${self.rs}, {self.label}"
