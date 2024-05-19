from .SpecialInstruction import SpecialInstruction, Memory


class Mfc1(SpecialInstruction):
    def __init__(self, normal: Memory, float: Memory):
        super().__init__()
        self.normal = normal.getAddress()
        self.float = float.getAddress()

    def toString(self):
        return f"mfc1 ${self.normal}, ${self.float}"

    def getAddress(self):
        return "you can't do this here"
