from .SpecialInstruction import SpecialInstruction, Memory


class La(SpecialInstruction):
    def __init__(self, rt: Memory, label: str):
        super().__init__()
        self.rt = rt.getAddress()
        self.label = label

    def toString(self):
        return f"la ${self.rt}, {self.label}"
