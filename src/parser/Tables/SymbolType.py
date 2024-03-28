

class SymbolType:
    def __init__(self, data_type: str, const: bool):
        self.data_type = data_type
        self.const = const

    def getType(self):
        return self.data_type

    def isConst(self):
        return self.const

    def __str__(self):
        return f"{str(self.data_type)} {str(self.const)} "

    def getStringType(self):
        const_str = "const"
        if not self.const:
            const_str = ""
        return f"{const_str} {self.data_type} "
