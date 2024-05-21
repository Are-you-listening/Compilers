from .SpecialInstruction import SpecialInstruction, Memory


class Manual_Label(SpecialInstruction):
    def __init__(self, label: str):
        self.label = label

    def toString(self):
        return self.label+":"
