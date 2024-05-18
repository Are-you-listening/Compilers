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

    def lw(self, rs: Memory, load_value: int, load_global=False, global_name=""):
        """
        load word function

        :param rs:
        :param load_value:
        :param rt:
        :param load_global:
        :param global_name:
        :return:
        """
        rt = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rs])

        instr = Lw(rt, rs, load_value, load_global, global_name)
        self.instructions.append(instr)
        return instr.getAddress()

    def lw_function(self, rs: Memory, load_value: int, rt: Memory):
        """
        This Lw function is used for function frame ptr and RegisterManager, and LoadParameters overhead ONLY.
        The reason it is, is because we cannot have any spill overhead during this procedure

        """
        instr = Lw(rt, rs, load_value, False, "")
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

    def addui(self, rs: Memory, load_value: int):
        rt = RegisterManager.getInstance().allocate(self)

        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Addiu(rt, rs, load_value)
        self.instructions.append(instr)
        return instr.getAddress()

    def addui_function(self, rs: Memory, load_value: int, rt: Memory):
        """
        This addUI function is used for function frame ptr and RegisterManager, and LoadParameters overhead ONLY.
        :return:
        """

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

    def sw(self, rt: Memory, rs: Memory, immediate: int):

        RegisterManager.getInstance().loadIfNeeded(self, [rt, rs])

        instr = Sw(rt, rs, immediate)
        self.instructions.append(instr)
        return instr.getAddress()


    def sw_spill(self, rt: Memory, rs: Memory, immediate: int):
        """
        Store function that only be used in spill, because it will not load
        the variable it needs to store
        """

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

    def addu(self, rs: Memory, rt: Memory):

        rd = RegisterManager.getInstance().allocate(self)
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt, rd])

        instr = Addu(rd, rs, rt)
        self.instructions.append(instr)
        return instr.getAddress()

    def jr(self, rd: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rd])

        instr = Jr(rd)
        self.instructions.append(instr)
        return instr.getAddress()

    def move(self, rt: Memory, rs: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rs, rt])

        instr = Move(rt, rs)
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

    def la(self, label: str):
        rt = RegisterManager.getInstance().allocate(self)
        instr = La(rt, label)
        self.instructions.append(instr)
        return rt

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

    def jalr(self, rt: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [rt])
        instr = Jalr(rt)
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

    def sitofp(self, general: Memory, Float: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [general, Float])

        instr = self.mtc1(general, Float)
        self.instructions.append(instr)
        instr = Cvt_s_w(instr.getAddress())
        self.instructions.append(instr)
        return instr

    def fptosi(self, Float: Memory, general: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [Float, general])

        instr = Cvt_w_s(Float)
        self.instructions.append(instr)

        instr = self.mfc1(instr.getAddress(), general)
        self.instructions.append(instr)

        return instr

    def mtc1(self, general: Memory, Float: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [general, Float])
        instr = Mtc1(general, Float)
        self.instructions.append(instr)
        return instr.getAddress()

    def mfc1(self, Float: Memory, general: Memory):
        RegisterManager.getInstance().loadIfNeeded(self, [Float, general])
        instr = Mfc1(Float, general)
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
        self.addui_function(sp_register, -bytes_needed, sp_register)

        """
        Store parameters on the stack
        """
        for i, p in enumerate(parameter_list):
            self.sw(p, sp_register, (i+1)*4)