from .SpecialInstruction import SpecialInstruction, Memory


class Comment(SpecialInstruction):
    def __init__(self, text: str):
        self.text = text
        super().__init__()

    def toString(self):
        text = ""
        for t in self.text.split("\n"):
            text += f"#{t}\n"
        return text
