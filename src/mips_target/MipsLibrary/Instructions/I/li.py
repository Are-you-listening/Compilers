from .IMipsInstruction import IMipsInstruction, Memory


class Li(IMipsInstruction):
    def __init__(self, rt: Memory, load_value: int):
        super().__init__(rt=rt,rs=rt,  immediate=load_value)

    def toString(self):
        return f"li ${self.rt}, {self.immediate}"
