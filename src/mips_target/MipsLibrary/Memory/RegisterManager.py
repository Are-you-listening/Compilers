from .Memory import Memory


class RegisterManager:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.stack = []
        self.registers = {}  # Maps register names to Memory Objects e.g "v0" : Memory Object
        self.special_registers = {"v0": None, "v1": None, "a0": None, "a1": None, "a2": None, "a3": None, "fp": None, "sp": None, "ra": None, "zero": None}  # Same as special registers but these may not be regularly used

        for i in range(0, 10):  # Insert registers
            self.registers[f"t{i}"] = None
        for i in range(0, 8):  # Insert registers
            self.registers[f"s{i}"] = None

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

    def spill(self, block, reg: str):
        """
        Spill a register to memory
        :return:
        """
        sp = self.getMemoryObject("sp")
        var = self.getMemoryObject(reg)

        block.addui(sp, sp, -4)  # Adjust frame/stack ptr
        block.sw(var, sp, 0)  # Store to new ptr
        var.is_loaded = False
        var.address = sp.address  # TODO How to get the address of the stack ptr? (since sp is always in a register;

    def load(self, block, var: Memory, reg: str):
        """
        Load value from a memory location into a register with name reg
        """
        if self.registers.get(reg , None) is not None:
            self.registers[reg] = var
            var.address = reg
        else:
            self.special_registers[reg] = var
            var.address = reg
        var.is_loaded = True

        old_var = var # TODO How can we even do this operation?
        block.lw(var, old_var, None)  # TODO How can we determine the offset here?

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

    def allocate(self, block, x: Memory, y: Memory, z: Memory):
        """
        Handles register assignment and follows the algorithm from the slides
        x := y op z
        :param x:
        :param y:
        :param z:
        :return:
        """
        for var in [x, y, z]:
            curr_reg = self.__getRegister(var)  # Fill in param here

            if curr_reg is not None:  # 1. If y is currently in a register r then Ry = r .
                self.load(block, var, curr_reg)
                continue
            elif self.__getFirstFree() is not None:  # 2. If y is not in a register but the register r is currently empty then Ry = r .
                self.load(block, var, self.__getFirstFree())
                continue
            else:  # 3. The remaining case is the difficult one. Let r be a candidate register
                # 3.1 is not implemented
                if self.__getRegister(x) is not None and x not in [y, z]:  # 3.2
                    self.load(block, var, self.__getRegister(x))
                    continue
                # 3.3 is not implemented because we applied the liveness algorithm before (removing unused variables)
                else:  # 3.4
                    for key in self.registers.keys():
                        self.spill(block, key)
                    self.load(block, var, self.__getFirstFree())

    def getFreeRegister(self):
        """
        get a register that is available
        :return:
        """

        free_reg = self.__getFirstFree()

        new_mem = Memory(free_reg, True)

        self.registers[free_reg] = new_mem

        return new_mem
