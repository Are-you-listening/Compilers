from .SpecialInstruction import SpecialInstruction, Memory


class Comment(SpecialInstruction):
    def __init__(self, text: str):
        self.text = text
        super().__init__()

    def toString(self):
        return f"#{self.text}"
