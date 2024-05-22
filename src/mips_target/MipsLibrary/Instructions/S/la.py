from .SpecialInstruction import SpecialInstruction, Memory


class La(SpecialInstruction):
    def __init__(self, rt: Memory, label: str):
        super().__init__()
        self.rt = rt.getAddress()
        self.label = label

        self.return_value = rt
        self.return_value.from_block = self

    def toString(self):
        return f"la ${self.rt}, {self.label}"

    def getAddress(self):
        return self.return_value

    def overrideMemory(self, other: "Memory"):
        self.rt = other.getAddress()
        self.return_value = Memory(other.getAddress(), other.is_loaded)



