
from .IMipsInstruction import IMipsInstruction, Memory


class Addui(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value: int):
        super().__init__(rs, rt, load_value)

    def toString(self):
        return f"addui ${self.rt.register_number}, ${self.rs.register_number}, {self.immediate}"
