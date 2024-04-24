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
        self.__functions = []
        self.__Printf = None
        self.__Scanf = None
        self.__PrintScanfString = []  # Keeps the name of the global formatting string mapped to an index, {"%x%d...": 1} means that the string "%x%d..." is identified in LLVM with index 1, thus '@.str.1' is the name of the global variable
        self.__current_block = ir.IRBuilder(ir.Block(self.__module))
        self.__structs = {}


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

    def addFunction(self, new_function: ir.Function):
        self.__functions.append(new_function)
        self.__last_function = new_function

    def setLastFunction(self, function):
        self.__last_function = function

    def getFunction(self, function_name):
        for function in self.__functions:
            if function.name == function_name:
                return function
        return None

    def setPrintF(self, printfFunction):
        self.__Printf = printfFunction

    def getPrintF(self):
        return self.__Printf

    def setScanF(self, scanfFunction):
        self.__Scanf = scanfFunction

    def getScanF(self):
        return self.__Scanf

    def getStringIndex(self, format_specifier: str):
        """
        Gives the index for a global string;
        If it doesn't yet exist, a new index will be created
        :param format_specifier:
        :return:
        """
        try:
            return self.__PrintScanfString.index(format_specifier)
        except:  # It doesn't yet exist, so 'make' a new index
            self.__PrintScanfString.append(format_specifier)
            return len(self.__PrintScanfString)-1

    def getStruct(self, struct_name):
        return self.__structs.get(struct_name)

    def addStruct(self, struct_name, structType: ir.LiteralStructType):
        self.__structs[struct_name] = structType


    def getLastFunction(self):
        return self.__last_function

    def setCurrentBlock(self, block: ir.IRBuilder):
        self.__current_block = block

    def removeBlock(self, builder):
        self.__last_function.blocks.remove(builder.block)

    def getContext(self):
        return self.__context
