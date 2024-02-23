class SymbolEntry:
    def __init__(self, fitype: str, name: str, const: bool):
        self.fitype = fitype
        self.name = name
        self.const = const


class SymbolTable:
    def __init__(self, lst: list):
        self.symbols = lst
    pass

    def add(self, symbol: SymbolEntry):
        self.symbols.append(symbol)

    def remove(self, symbol: SymbolEntry):
        self.symbols.remove(symbol)
