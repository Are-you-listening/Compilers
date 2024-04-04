from llvmlite import ir


class LLVMSingleton:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.__context = ir.Context()
        self.__module = ir.Module(name=__file__, context=self.__context)
        self.__module.triple = "x86_64-pc-linux-gnu"
        self.__last_function = None
        self.__Printf = None
        self.__current_block = ir.IRBuilder(ir.Block(self.__module))

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if LLVMSingleton.__instance is None:
            LLVMSingleton.__instance = LLVMSingleton()
        return LLVMSingleton.__instance

    @staticmethod
    def setName(name):
        LLVMSingleton.getInstance().__module.name = name

    def getModule(self):
        return self.__module

    def getCurrentBlock(self) -> ir.IRBuilder:
        return self.__current_block

    def addBlock(self) -> ir.IRBuilder:
        new_block = self.__last_function.append_basic_block()
        return ir.IRBuilder(new_block)

    def setLastFunction(self, new_function: ir.Function):
        self.__last_function = new_function

    def setPrintF(self, printfFunction):
        self.__Printf = printfFunction

    def getPrintF(self):
        return self.__Printf

    def getLastFunction(self):
        return self.__last_function

    def setCurrentBlock(self, block: ir.IRBuilder):
        self.__current_block = block

    def removeBlock(self, builder):
        self.__last_function.blocks.remove(builder.block)
