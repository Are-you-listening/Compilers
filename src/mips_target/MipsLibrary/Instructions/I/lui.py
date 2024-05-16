from .IMipsInstruction import IMipsInstruction, Memory


class Lui(IMipsInstruction):
    def __init__(self, rt: Memory, load_value):
        super().__init__(rt=rt, immediate=load_value)

    def toString(self):
        return f"lui ${self.rt} {self.immediate}"