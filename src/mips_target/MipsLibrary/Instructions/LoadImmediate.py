from .MipsInstruction import MipsInstructions, Register


class LoadImmediate(MipsInstructions):
    def __init__(self, store_register: Register, load_value):
        super().__init__(store_register, [load_value])

    def toString(self):
        return f"li ${self.to_register} {self.from_registers[0]}"
