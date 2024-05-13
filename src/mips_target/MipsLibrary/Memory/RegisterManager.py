from Memory import Memory


class RegisterManager:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.stack = []

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

    def load(self, register: Memory):
        """
        Load value from a memory location into a register
        """
        # Blablaba ~Kars
        register.is_loaded = True
        pass

    def getRegister(self):
        """
        handels register assignment and follows the ass
        :return:
        """
        #code ~Lucas was here

        pass