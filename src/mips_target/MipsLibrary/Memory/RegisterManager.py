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

    def spill(self, register: Memory):
        """
        Spill a register to memory
        :return:
        """
        # Code
        register.is_loaded = False
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
                return
        return None

    def getMemoryObject(self, register: str):
        """
        Retrieve the object stored in a register
        :return:
        """
        return self.registers.get(register, None)

    def __inUse(self, reg: str):
        return self.registers.get(reg, None) is not None

    def registerAllocation(self, var: Memory, reg: str):
        """
        Handles register assignment and follows the algorithm from the slides
        :param var: Variable or object we want to load in reg
        :param reg: Register name we want to load in
        :return:
        """


        if self.getRegister(var) is not None:  # 1. If y is currently in a register r then Ry = r .
            return self.getRegister(var)
        elif not self.__inUse(reg):  # 2. If y is not in a register but the register r is currently empty then Ry = r .
            self.load(var, reg)
        else:  # 3. The remaining case is the difficult one. Let r be a candidate register

            # TODO Need an isLive and isUsed variable
            pass

        pass