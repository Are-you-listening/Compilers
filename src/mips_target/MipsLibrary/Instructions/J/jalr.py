from .JMipsInstruction import JMipsInstruction, Memory


class Jalr(JMipsInstruction):
    def __init__(self, rt: Memory):
        super().__init__(rt.getAddress())

    def toString(self):
        return f"jalr ${self.label}"
