

from .Function import Function


class MipsModule:
    def __init__(self):
        self.functions = []
        self.data_segment = []

    def toString(self):
        string = ""
        string += ".data\n"
        for d in self.data_segment:
            string += f"{d}\n"
        string += ".text\n"
        string += "main:\n"
        string += "jal function_main\n"
        string += "li 	$v0, 10 #exit system call\n"
        string += "syscall\n"

        for f in self.functions:
            string += f.toString()

        return string

    def createFunction(self, function_name: str) -> Function:
        function = Function(function_name)
        self.functions.append(function)

        return function

    def addDataSegment(self, key, value, special_info:str=None):
        if special_info is None:
            special_info = ""
        self.data_segment.append(f"{key}: {special_info} {value}")

    def getFunction(self, function_name: str):
        for function in self.functions:
            if function.function_name == function_name:
                return function
        return None
