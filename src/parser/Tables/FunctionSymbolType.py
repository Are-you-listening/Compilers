from src.parser.Tables.SymbolType import SymbolType


class FunctionSymbolType(SymbolType):
    def __init__(self, return_type: SymbolType, param_types: list[SymbolType]):
        super().__init__("Function", False)

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

    def __eq__(self, other):
        if len(self.param_types) != len(other.param_types):
            return False
        for i in range(len(self.param_types)):
            p1 = self.param_types[i]
            p2 = other.param_types[i]
            if p1 != p2:
                return False

        return self.return_type == other.return_type

    def getPtrTuple(self):
        return [(f"{self.return_type.getPtrTuple()[0][0]} ({[p.getPtrTuple()[0][0] for p in self.param_types]})", False), []]