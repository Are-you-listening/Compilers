from .IMipsInstruction import IMipsInstruction, Memory


class Ori(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value: int):
        # Translate negative numbers to their positive counterpart with the same binary representation
        if load_value < 0:
            load_value = (1 << 16) + load_value

        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"ori ${self.rt}, ${self.rs} {self.immediate}"
