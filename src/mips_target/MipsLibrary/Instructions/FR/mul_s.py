from .FloatMipsInstruction import *


class Mul_s(FloatMipsInstruction):
    def __init__(self, lst: list[Memory]):
        super().__init__(lst[0], lst[1], lst[2])

    def toString(self):
        return f"mul.s ${self.fd}, ${self.fs}, ${self.ft}"
