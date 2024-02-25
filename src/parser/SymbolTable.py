class SymbolEntry:
    def __init__(self, fitype: str, datatype: str, name: str, const: bool, value):
        self.fitype = fitype
        self.type = datatype
        self.name = name
        self.const = const
        self.value = value


class SymbolTable:
    def __init__(self, lst: list):
        self.symbols = lst
    pass

    def add(self, symbol: SymbolEntry):
        self.symbols.append(symbol)

    def remove(self, symbol: SymbolEntry):
        self.symbols.remove(symbol)
