from .IMipsInstruction import IMipsInstruction, Memory


class Lw(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory, load_value, load_global=False, global_name=""):
        super().__init__(rs, rt, load_value)
        self.load_global = load_global
        self.global_name = global_name

    def toString(self):
        if not self.load_global:
            return f"lw ${self.rt}, {self.immediate.real}(${self.rs})"
        else:
            return f"lw ${self.rt}, {self.global_name}"