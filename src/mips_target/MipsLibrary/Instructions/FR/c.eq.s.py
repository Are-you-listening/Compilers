from .FloatMipsInstruction import *


class C_eq_s(FloatMipsInstruction):
    def __init__(self, lst: list[Memory]):
        super().__init__(lst[0], lst[1], lst[2])

    def toString(self):
        return f"c.eq.s ${self.fd}, ${self.fs}, {self.ft}"
