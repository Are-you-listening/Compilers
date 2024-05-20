from .IMipsInstruction import IMipsInstruction, Memory


class Beq(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory | int, label: str):
        if isinstance(rs, int):
            self.rs = rs
            self.rt = rt.getAddress()
            self.return_value = rt
            self.return_value.from_block = self
            self.immediate = 0
            self.integerPrint = True
        else:
            super().__init__(rs, rt)
            self.integerPrint = False

        self.label = label

    def toString(self):
        if self.integerPrint:
            return f"beq ${self.rt}, {self.rs}, {self.label}"
        return f"beq ${self.rt}, ${self.rs}, {self.label}"
