from src.parser.ErrorExporter import *

class SymbolEntry:
    def __init__(self, fitype: str, datatype: str, name: str, const: bool, value, firstUsed , firstDeferred):
        self.fitype = fitype
        self.type = datatype
        self.name = name
        self.const = const
        self.value = value
        self.firstUsed = firstUsed # The node this Entry is first used
        self.firstDeferred = firstDeferred # The node this Enry is first deferred

    def print(self):
        print(self.fitype, self.type, self.name, "| const = ", self.const, " | value = ", self.value, self.firstUsed, self.firstDeferred)


class SymbolTable:
    def __init__(self, prev):
        self.symbols = {}
        self.prev = prev
        self.next = []

    def add(self, entry: SymbolEntry):
        self.symbols[entry.name] = entry

    def remove(self, symbol: SymbolEntry):
        self.symbols.pop(symbol.name)

    def getEntry(self, name):
        return self.symbols.get(name)

    def print(self):
        print(self.symbols)

    def traverse(self,function, printEntry: bool):
        if printEntry:
            for entry in self.symbols.values():
                entry.print()

        for child in self.next:
            if printEntry:
                for entry in child.symbols.values():
                    entry.print()
            child.traverse(function,printEntry)

    def nextTable(self,next):
        """Add a new table as child"""
        self.next.append(next)
