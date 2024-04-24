from src.parser.Tables.SymbolType import SymbolType


class FunctionSymbolType(SymbolType):
    def __init__(self, return_type: SymbolType, param_types: list[(str, list)]):
        self.return_type = return_type
        self.param_types = param_types

    def getType(self):
        return self.return_type.getType()

    def isConst(self):
        return self.return_type.isConst()

    def __str__(self):
        return f"{str(self.return_type)} {str(self.return_type.isConst())} "

    def getStringType(self):
        return self.return_type.getStringType()

    def getParameterTypes(self):
        return self.param_types
