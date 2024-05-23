

from src.mips_target.MipsLibrary.Function import Function
from src.mips_target.MipsLibrary.MipsModule import MipsModule
from src.mips_target.MipsLibrary.Blocks import Block


class MipsSingleton:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.__last_function: Function = None
        self.__functions: list[Function] = []

        self.__current_block: Block = None
        self.__module: MipsModule = MipsModule()
        self.__strings = []
        self.__floatData = []

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if MipsSingleton.__instance is None:
            MipsSingleton.__instance = MipsSingleton()
        return MipsSingleton.__instance

    def getModule(self) -> MipsModule:
        return self.__module

    def getCurrentBlock(self) -> Block:
        return self.__current_block

    def addBlock(self) -> Block:

        new_block = self.__last_function.createBlock()
        return new_block

    def addFunction(self, new_function: Function):
        self.__functions.append(new_function)
        self.__last_function = new_function

    def setLastFunction(self, function: Function):
        self.__last_function = function

    def getFunction(self, function_name: str):
        for function in self.__functions:
            if function.function_name == function_name:
                return function
        return None

    def getLastFunction(self):
        return self.__last_function

    def setCurrentBlock(self, block: Block):
        self.__current_block = block

    def getStringIndex(self, format_specifier: str):
        """
        Gives the index for a global string;
        If it doesn't yet exist, a new index will be created
        :param format_specifier:
        :return:
        """

        if format_specifier in self.__strings:
            return self.__strings.index(format_specifier), True
        else:
            self.__strings.append(format_specifier)
            return len(self.__strings) - 1, False

    def getFloatName(self):
        name = "float...index_"+str(len(self.__floatData))  # Our compiler doesn't support dots in its name so this is safe to use
        self.__floatData.append(name)
        return name
