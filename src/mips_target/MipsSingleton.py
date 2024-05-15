
from .MipsLibrary import *


class MipsSingleton:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.__last_function: Function = None
        self.__functions: list[Function] = []
        self.__current_block: Block = Block("globals")
        self.__module: Mips = Mips()

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if MipsSingleton.__instance is None:
            MipsSingleton.__instance = MipsSingleton()
        return MipsSingleton.__instance

    def getModule(self) -> Mips:
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

    def getFunction(self, function_name: Function):
        for function in self.__functions:
            if function.function_name == function_name:
                return function
        return None

    def getLastFunction(self):
        return self.__last_function

    def setCurrentBlock(self, block: Block):
        self.__current_block = block
