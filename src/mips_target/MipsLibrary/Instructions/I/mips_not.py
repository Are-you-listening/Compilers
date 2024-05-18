from src.mips_target.MipsLibrary.Instructions.I.IMipsInstruction import IMipsInstruction, Memory


class Not(IMipsInstruction):
    def __init__(self, rt: Memory, rs: Memory):
        super().__init__(rs, rt)
        self.rt = rt.getAddress()
        self.rs = rs.getAddress()

    def toString(self):
        return f"not ${self.rt}, ${self.rs}"
