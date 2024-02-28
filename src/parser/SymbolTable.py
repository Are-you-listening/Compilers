from src.parser.ErrorExporter import *
from src.parser.ErrorExporter import *

class SymbolEntry:
    def __init__(self, fitype: str, datatype: str, name: str, const: bool, value, firstUsed, firstDeferred):
        self.fitype = fitype
        self.type = datatype
        self.name = name
        self.const = const
        self.value = value
        self.firstUsed = firstUsed  # The node this Entry is first used
        self.firstDeferred = firstDeferred  # The node this Enry is first deferred

    def print(self):
        print(self.fitype, self.type, self.name, "| const = ", self.const, " | value = ", self.value, self.firstUsed,
              self.firstDeferred)


class SymbolTable:
    def __init__(self, prev):
        self.symbols = {}
        self.prev = prev
        self.next = []

    def add(self, entry: SymbolEntry):
        existing = self.symbols.get(entry.name)
        entry.print()
        if existing is not None: # Redefinition of variable
            ErrorExporter.redefinition(None,None,existing.type,existing.name)
            return

        self.symbols[entry.name] = entry

    def remove(self, symbol: SymbolEntry):
        self.symbols.pop(symbol.name)

    def getEntry(self, name):
        return self.symbols.get(name)

    def print(self,printEntry=False):
        if printEntry:
            for entry in self.symbols.values():
                entry.print()
        print(self.symbols)

    def traverse(self, function, printEntry: bool, up: bool):
        """

        :param function: function to execute
        :param printEntry: toggle the print of entries
        :param up: go up or down the list
        :return:
        """
        if up:
            self.print(printEntry)
            self.prev.traverse(function,printEntry,up)
        else:
            self.print(printEntry)

            for child in self.next:
                self.print(printEntry)
                child.traverse(function, printEntry)

    def nextTable(self, next):
        """Add a new table as child"""
        self.next.append(next)

    def exists(self,entryname):
        """
        Check if a given symbolEntry already exists in the scope
        :param entryname:
        :return:
        """
        if self.entryExists(entryname):
            return True
        if self.prev!=None:
            self.prev.traverse(self.entryExists(entryname), False, True) # Else: traverse upwards
        else:
            return False

    def entryExists(self,entryname):
        """
        Check if a given symbolEntry already exists in the current table
        :param entryname:
        :return:
        """
        if self.symbols.get(entryname) is None:
            return False
        return True
