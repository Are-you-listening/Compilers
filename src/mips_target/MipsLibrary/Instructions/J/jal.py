from .JMipsInstruction import JMipsInstruction, Memory


class Jal(JMipsInstruction):
    def __init__(self, label: str):
        super().__init__(label)

    def toString(self):
        return f"jal ${self.label}"
