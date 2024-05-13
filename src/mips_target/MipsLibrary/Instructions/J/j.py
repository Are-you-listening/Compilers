from .JMipsInstruction import JMipsInstruction, Memory


class J(JMipsInstruction):
    def __init__(self, label: str):
        super().__init__(label)

    def toString(self):
        return f"j ${self.label}"
