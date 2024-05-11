from .MipsInstruction import MipsInstructions, Register


class Load(MipsInstructions):
    def __init__(self, store_register: Register, load_address_register: Register, offset: int = 0):
        super().__init__(store_register, [load_address_register])
        self.offset = offset

    def toString(self):
        return f"lw ${self.to_register} {self.offset}(${self.from_registers[0]})"
