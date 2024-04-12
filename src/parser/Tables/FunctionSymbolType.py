from src.parser.Tables.SymbolType import SymbolType

class FunctionSymbolType(SymbolType):
    def __init__(self, return_type: str, return_const: bool, param_types: list[str]):
        self.return_type = return_type
        self.return_const = return_const
        self.param_types = param_types

    def getType(self):
        return self.return_type

    def isConst(self):
        return self.return_const

    def __str__(self):
        return f"{str(self.return_type)} {str(self.return_const)} "

    def getStringType(self):
        const_str = "const"
        if not self.return_const:
            const_str = ""
        return f"{const_str} {self.return_type} "
