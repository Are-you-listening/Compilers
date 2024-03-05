

class LLVMSingleton:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.__register_counter = 1

    @staticmethod
    def getInstance():
        if LLVMSingleton.__instance is None:
            LLVMSingleton.__instance = LLVMSingleton()
        return LLVMSingleton.__instance

    def useRegister(self):
        out = self.__register_counter
        self.__register_counter += 1
        return out

