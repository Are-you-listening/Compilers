from Memory import Memory


class RegisterManager:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.stack = []
        self.registers = {}  # Maps register names to Memory Objects e.g "$v0" : Memory Object

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if RegisterManager.__instance is None:
            RegisterManager.__instance = RegisterManager()
        return RegisterManager.__instance

    def spill(self, var: Memory, reg: str):
        """
        Spill a register to memory
        :return:
        """
        # Code
        var.is_loaded = False
        pass

    def load(self, var: Memory, reg: str):
        """
        Load value from a memory location into a register
        """
        # Blablaba ~Kars
        self.registers[reg] = var
        var.is_loaded = True
        pass

    def getRegister(self, var: Memory):
        """
        Retrieve the register number for an object
        :return:
        """
        for key in self.registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        return None

    def getMemoryObject(self, register: str):
        """
        Retrieve the object stored in a register
        :return:
        """
        return self.registers.get(register, None)

    def __inUse(self, reg: str):
        return self.registers.get(reg, None) is not None

    def __getFirstFree(self):
        for key in self.registers.keys():
            if self.getMemoryObject(key) is None:
                return key
        return None

    def __getFirstNotLive(self):
        for key in self.registers.keys():
            if self.getMemoryObject(key).live:
                return None
        return None

    def registerAllocation(self, x: Memory, y: Memory, z: Memory):
        """
        Handles register assignment and follows the algorithm from the slides
        :param x: Variable or object we want to load in reg
        :param reg: Register name we want to load in
        :return: reg name x is loaded into
        """
        curr_reg = self.getRegister(y)  # Fill in param here

        # This will be an other routine
        if curr_reg is not None:  # 1. If y is currently in a register r then Ry = r .
            return curr_reg
        elif self.__getFirstFree() is not None:  # 2. If y is not in a register but the register r is currently empty then Ry = r .
            return self.__getFirstFree()
        else:  # 3. The remaining case is the difficult one. Let r be a candidate register
            # 3.1 is not implemented
            if self.getRegister(x) is not None:  # 3.2
                return self.getRegister(x)
            # if self.__getFirstNotLive() is not None:  # 3.3
            #     return self.__getFirstNotLive()
            else:  # 3.4
                for key in self.registers.keys():
                    self.spill(self.registers[key], key)
                return self.__getFirstFree()


            # TODO Need an isLive and isUsed variable
            pass

        pass