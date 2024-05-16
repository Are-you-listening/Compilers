from .Memory import Memory
from src.internal_tools.IntegrityChecks import PreConditions

class RegisterManager:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.stack = []
        self.registers: dict[str, Memory | None] = {}  # Maps register names to Memory Objects e.g "v0" : Memory Object
        self.special_registers = {"v0": None, "v1": None, "a0": None, "a1": None, "a2": None, "a3": None, "fp": Memory(30, True), "sp": Memory(29, True), "ra": None, "zero": None}  # Same as special registers but these may not be regularly used
        self.variable_map = {}  # maps variable names to Memory Objects

        for i in range(0, 10):  # Insert registers
            self.registers[f"t{i}"] = None
        for i in range(0, 8):  # Insert registers
            self.registers[f"s{i}"] = None

        self.curr_function = None
        self.counter = 0

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if RegisterManager.__instance is None:
            RegisterManager.__instance = RegisterManager()
        return RegisterManager.__instance

    def __getRegister(self, var: Memory):
        """
        Retrieve the register number for an object from self.registers only
        :return:
        """
        for key in self.registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        return None

    def __inUse(self, reg: str):
        return self.registers.get(reg, None) is not None

    def __getFirstFree(self):
        for key in self.registers.keys():
            if self.getMemoryObject(key) is None:
                return key
        return None

    def __claimRegister(self, var: Memory, reg: str):
        if reg in self.registers.keys():
            self.registers[reg] = var
        else:
            self.special_registers[reg] = var
        var.address = reg
        var.is_loaded = True  # TODO Unsure if this needs to be done?

    def spill(self, block, reg: str):
        """
        Spill a register to memory
        :return:
        """
        if block.function != self.curr_function:
            self.counter = 0
        self.counter += 4

        sp = self.getMemoryObject("sp")
        var = self.getMemoryObject(reg)
        block.addui(sp, sp, -4)  # Adjust frame/stack ptr
        block.sw(var, sp, 0)  # Store to new ptr
        var.is_loaded = False
        var.address = block.function.getOffset()+self.counter
        self.registers[reg] = None

    def load(self, block, var: Memory, reg: str):
        """
        Load value from a memory location into a register with name reg
        """
        offset = var.address
        if self.registers.get(reg, None) is not None:
            self.registers[reg] = var
            var.address = reg
        else:
            self.special_registers[reg] = var
            var.address = reg
        var.is_loaded = True
        block.lw(var, self.getMemoryObject("fp"), offset)

    def getRegister(self, var: Memory):
        """
        Retrieve the register number for an object
        :return:
        """
        for key in self.registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        for key in self.special_registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        return None

    def getMemoryObject(self, register: str):
        """
        Retrieve the object stored in a register
        :return:
        """
        if self.registers.get(register, None) is not None:
            return self.registers.get(register, None)
        else:
            return self.special_registers.get(register, None)

    def allocate(self, block, x: Memory, y: Memory = None, z: Memory = None):
        """
        Handles register assignment and follows the algorithm from the slides
        x := y op z
        :param x:
        :param y: May be None
        :param z: May be None
        :return:
        """
        assert x is not None

        for var in [x, y, z]:
            if var is None:
                break
            if self.__getRegister(var) is not None:  # 1. If y is currently in a register r then Ry = r .
                self.__claimRegister(var, self.__getRegister(var))
                continue
            elif self.__getFirstFree() is not None:  # 2. If y is not in a register but the register r is currently empty then Ry = r .
                #self.load(block, var, self.__getFirstFree())
                self.__claimRegister(var, self.__getFirstFree())
                continue
            else:  # 3. The remaining case is the difficult one. Let r be a candidate register
                # 3.1 is not implemented
                if self.__getRegister(x) is not None and x not in [y, z]:  # 3.2
                    #self.load(block, var, self.__getRegister(x))
                    self.__claimRegister(var, self.__getRegister(x))
                    continue
                # 3.3 is not implemented because we applied the liveness algorithm before (removing unused variables)
                else:  # 3.4
                    for key in self.registers.keys():
                        self.spill(block, key)
                    #self.load(block, var, self.__getFirstFree())
                    self.__claimRegister(var, self.__getFirstFree())

        if y is None:
            return x
        elif z is None:
            return x, y
        else:
            return x, y, z

    def framePtrStore(self, mem_object: Memory):
        """
        When we store our value on the frame stack, as far as the child blocks of this frame know
        these register had never values
        """

        PreConditions.assertInstanceOff(mem_object, Memory)
        PreConditions.assertTrue(mem_object.is_loaded)



        reg = mem_object.address
        if reg in self.registers:
            self.registers[reg] = None

        if reg in self.special_registers:
            self.special_registers[reg] = None

        mem_object.is_loaded = False

    def framePtrLoad(self, mem_object: Memory):
        """
        Reverse the effects of framePtrStore after a function
        """

        PreConditions.assertInstanceOff(mem_object, Memory)
        PreConditions.assertTrue(not mem_object.is_loaded)

        reg = mem_object.address
        if reg in self.registers:
            self.registers[reg] = mem_object

        if reg in self.special_registers:
            self.special_registers[reg] = mem_object

        mem_object.is_loaded = True

    def getFramePtrRegisters(self):
        """
        Get all registers corresponding to its current MemoryObject that needs to be stored on the stack
        """

        registers = []
        for register, mem in self.registers.items():
            if mem is None:
                mem = Memory(register, True)
            registers.append(mem)

        for register, mem in self.special_registers.items():

            if register in ("fp", "sp", "zero"):
                continue

            if mem is None:
                mem = Memory(register, True)

            registers.append(mem)
        return registers



