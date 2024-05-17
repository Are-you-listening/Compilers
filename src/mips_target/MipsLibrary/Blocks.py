from .Instructions import *
from .Memory import Memory, RegisterManager


class Block:
    def __init__(self, label: str = None, function= None):
        self.label = label
        self.instructions: list[Instruction] = []
        self.function = function

    def li(self, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)
        instr = Li(rt, immediate)
        self.instructions.append(instr)
        return instr.getAddress()

    def lw(self, rs: Memory, load_value: int, rt: Memory = None, load_global=False, global_name=""):

        if rt is None:
            rt = RegisterManager.getInstance().allocate(self)
        instr = Lw(rt, rs, load_value, load_global, global_name)
        self.instructions.append(instr)
        return instr.getAddress()

    def lb(self, rs: Memory, load_value: int):

        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Lb(rt, rs, load_value)
        self.instructions.append(instr)
        return instr.getAddress()

    def addi(self, rs: Memory, load_value: int):

        rt = RegisterManager.getInstance().allocate(self)
        instr = Addi(rt, rs, load_value)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        self.instructions.append(instr)
        return instr.getAddress()

    def addui(self, rs: Memory, load_value: int, rt: Memory = None):
        if rt is None:
            rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Addiu(rt, rs, load_value)
        self.instructions.append(instr)
        return instr.getAddress()

    def andi(self, rs: Memory, load_value: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Andi(rt, rs, load_value)
        self.instructions.append(instr)
        return instr.getAddress()

    def beq(self, rt: Memory, rs: Memory, label: str):
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        instr = Beq(rt, rs, label)
        self.instructions.append(instr)
        return instr.getAddress()

    def bne(self, rt: Memory, rs: Memory, label: str):
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        instr = Bne(rt, rs, label)
        self.instructions.append(instr)
        return instr.getAddress()

    def ori(self, rs: Memory, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Ori(rt, rs, immediate)
        self.instructions.append(instr)
        return instr.getAddress()

    def slti(self, rs: Memory, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Slti(rt, rs, immediate)
        self.instructions.append(instr)
        return instr.getAddress()

    def sltiu(self, rs: Memory, immediate: int):
        rt = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])
        instr = Sltiu(rt, rs, immediate)
        self.instructions.append(instr)
        return instr.getAddress()


    def sw(self, rt: Memory, rs: Memory, immediate: int, loadable: bool = True):

        if loadable:
            RegisterManager.getInstance().loadIfNeeded(self, [rt, rs])

        instr = Sw(rt, rs, immediate)
        self.instructions.append(instr)
        return instr.getAddress()

    def add(self, rs: Memory, rt: Memory, rd: Memory = None, loadable: bool = True):

        if rd is None:
            rd = RegisterManager.getInstance().allocate(self)

        if loadable:
            RegisterManager.getInstance().loadIfNeeded(self, [rs, rt, rd])



        instr = Add(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def jr(self, rd: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rd])

        instr = Jr(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def mips_and(self, rs: Memory, rt: Memory):

        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = And(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def mips_or(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Or(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def nor(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])
        instr = Nor(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def xor(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Xor(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def sll(self, rt: Memory, shamt: int):
        rd = RegisterManager.getInstance().allocate(self)
        instr = Sll(rd, rt, shamt)
        self.instructions.append(instr)
        return instr.getAddress()

    def slt(self, rd: Memory, rt: Memory, shamt: int):
        instr = Slt(rd, rt, shamt)
        self.instructions.append(instr)
        return instr.getAddress()

    def srl(self, rt: Memory, shamt: int):
        rd = RegisterManager.getInstance().allocate(self)
        instr = Srl(rd, rt, shamt)
        self.instructions.append(instr)
        return instr.getAddress()

    def sub(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Sub(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def la(self, rt: Memory, label: str):
        instr = La(rt, label)
        self.instructions.append(instr)
        return instr.getAddress()

    def j(self, label: str):
        instr = J(label)
        self.instructions.append(instr)
        return instr.getAddress()

    def div(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Div(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def mul(self, rs: Memory, rt: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs, rt])

        instr = Mul(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def neg(self, rs: Memory):
        rd = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rd, rs])

        instr = Neg(rd, rs)
        self.instructions.append(instr)
        return instr.getAddress()

    def mflo(self, rd: Memory):
        instr = Mflo(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def mfhi(self, rd: Memory):
        instr = Mfhi(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def jal(self, label: str):
        instr = Jal(label)
        self.instructions.append(instr)
        return instr.getAddress()

    def systemCall(self):
        instr = Systemcall()
        self.instructions.append(instr)
        return instr.getAddress()

    def comment(self, text: str):
        instr = Comment(text)
        self.instructions.append(instr)
        return instr.getAddress()


    def toString(self):
        s = ""
        if self.label is not None:
            s += f"{self.label}:\n"
        for i in self.instructions:
            s += i.toString()
            s += "\n"

        return s

    def getParameter(self, index):
        """
        Get a specific parameter provided base on the parameter index
        """
        fp_register = Memory(30, True)

        instr = self.lw(fp_register, 4*(index+1))
        return instr

    def createParameters(self, parameter_list: list[Memory]):
        bytes_needed = (len(parameter_list)+1)*4

        sp_register = Memory(31, True)

        """
        Allocate stack space for the parameters
        """
        temp_reg = self.addui(sp_register, -bytes_needed)
        temp_reg.overrideMemory(sp_register)

        """
        Store parameters on the stack
        """
        for i, p in enumerate(parameter_list):
            self.sw(p, sp_register, (i+1)*4)