from llvmlite import ir


class LLVMSingleton:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.__module = ir.Module(name=__file__)
        self.__last_function = None
        self.__current_block = None

    @staticmethod
    def getInstance():
        if LLVMSingleton.__instance is None:
            LLVMSingleton.__instance = LLVMSingleton()
        return LLVMSingleton.__instance

    def getModule(self):
        return self.__module

    def getCurrentBlock(self) -> ir.IRBuilder:
        return self.__current_block

    def setLastFunction(self, new_function):
        self.__last_function = new_function
        new_block = self.__last_function.append_basic_block()
        self.__current_block = ir.IRBuilder(new_block)


