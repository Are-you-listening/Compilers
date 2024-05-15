from .Function import Function


class Mips:
    def __init__(self):
        self.functions = []

    def toString(self):
        string = ""
        string += ".global main\n"
        string += ".text\n"
        string += "jal main\n"
        string += "li 	$v0, 10 #exit system call\n"
        string += "syscall\n"

        for f in self.functions:
            string += f.toString()

        return string

    def createFunction(self, function_name: str) -> Function:
        function = Function(function_name)
        self.functions.append(function)

        return function

