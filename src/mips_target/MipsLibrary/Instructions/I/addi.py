from .IMipsInstruction import IMipsInstruction, Memory


class Addi(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value: int):
        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"addi ${self.rt} ${self.rs} {self.immediate}"
