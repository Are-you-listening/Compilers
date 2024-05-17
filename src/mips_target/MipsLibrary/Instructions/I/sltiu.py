from .IMipsInstruction import IMipsInstruction, Memory


class Sltiu(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value: int):
        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"sltiu ${self.rt} {self.immediate}"
