from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolType import *
from src.parser.Tables.SymbolTypePtr import *


class SymbolEntry:
    def __init__(self, fitype: str, datatype: SymbolType, name: str, const: bool, value, firstDeclared, firstUsed):
        self.fitype = fitype
        self.__type = datatype
        self.name = name
        self.const = const
        self.value = value
        self.firstDeclared = firstDeclared  # The node this Entry is first declared
        self.firstUsed = firstUsed  # The node this Enry is first used

    def print(self):
        print(self.fitype, self.__type, self.name, "| const = ", self.const, " | value = ", self.value, self.firstDeclared,
              self.firstUsed)

    def getType(self):
        return self.__type.getType()

    def getTypeObject(self):
        return self.__type

    def getValue(self):
        return self.value

    def Dereference(self):
        if isinstance(self.__type, SymbolTypePtr):
            return self.__type.deReference()
        return None


class SymbolTable:
    def __init__(self, prev):
        self.symbols = {}
        self.prev = prev
        self.next = []

    def add(self, entry: SymbolEntry):
        if self.symbols.get(entry.name) is not None:
            ErrorExporter.redefinition(None,entry.getType(),entry.name) # This allows earlier detection of errors but unsure how we would retrieve the lineNr
            return
        self.symbols[entry.name] = entry

    def remove(self, symbol: SymbolEntry):
        self.symbols.pop(symbol.name)

    def getEntry(self, name):
        return self.symbols.get(name)

    def print(self):
        for entry in self.symbols.values():
            entry.print()
        print(self.symbols)

    def traverse(self, function, up: bool, print=False):
        """

        :param function: function to execute
        :param printEntry: toggle the print of entries
        :param up: go up or down the list
        :return:
        """
        if up:
            if print:
                self.print()
            if self.prev is None:
                return
            self.prev.traverse(function,up,print)
        else:
            if print:
                self.print()

            for child in self.next:
                if print:
                    self.print()
                child.traverse(function, up, print)

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
        if self.prev is not None:
            self.prev.traverse(self.entryExists(entryname), True)  # Else: traverse upwards
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
