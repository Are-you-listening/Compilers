from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolType import *
from src.parser.Tables.SymbolTypePtr import *


class SymbolEntry:
    def __init__(self, fitype: str, datatype: SymbolType, name: str, const: bool, value, first_declared, first_used):
        self.fitype = fitype
        self.__type = datatype
        self.name = name
        self.const = const
        self.value = value
        self.firstDeclared = first_declared  # The node this Entry is first declared
        self.firstUsed = first_used  # The node this Enry is first used

    def __repr__(self):
        return f"""fi type: {self.fitype} 
                   type: {self.__type} 
                   name: {self.name}
                   const: {self.const}
                   value: {self.value}
                   first declared: {self.firstDeclared}
                   first used: {self.firstUsed})"""

    def getType(self):
        return self.__type.getType()

    def getTypeObject(self):
        return self.__type

    def getValue(self):
        return self.value


class SymbolTable:
    def __init__(self, prev):
        """
        Init a symbol table
        :param prev: a ptr to the prev symbol table we need to point to
        """
        self.symbols = {}
        self.prev = prev
        self.next = []

    def add(self, entry: SymbolEntry):
        """
        add an symbol entry to the symbol table
        :param entry: the entry we want to add
        :return:
        """
        if self.symbols.get(entry.name) is not None:
            ErrorExporter.redefinition(entry.firstDeclared, entry.getType(), entry.name) # This allows earlier detection of errors but unsure how we would retrieve the lineNr
            return
        self.symbols[entry.name] = entry

    def remove(self, symbol: SymbolEntry):
        self.symbols.pop(symbol.name)

    def getEntry(self, name):
        """
        Get entry
        :param name: name of the entry
        :return:
        """
        return self.symbols.get(name)

    def __str__(self):
        rep_string = ""
        for entry in self.symbols.values():
            rep_string += f"{repr(entry)}\n"
        rep_string += f"self.symbols"

    def traverse(self, function, up: bool, do_print=False):
        """

        :param do_print: bool indication whether to print or not
        :param function: function to execute
        :param up: go up or down the list
        :return:
        """

        if do_print:
            print(self)

        if up:
            if self.prev is None:
                return
            self.prev.traverse(function, up, do_print)
        else:
            for child in self.next:
                child.traverse(function, up, do_print)

    def nextTable(self, next_table: "SymbolTable"):
        """Add a new table as child"""
        self.next.append(next_table)

    def exists(self, entry_name: str):
        """
        Check if a given symbolEntry already exists in the scope
        :param entry_name: the name of an entry of the symbol table
        :return:
        """
        if self.entryExists(entry_name):
            return True
        if self.prev is not None:
            self.prev.traverse(self.entryExists(entry_name), True)  # Else: traverse upwards
        else:
            return False

    def entryExists(self, entry_name: str):
        """
        Check if a given symbolEntry already exists in the current table
        :param entry_name:the name of an entry of the symbol table
        :return:
        """
        if self.symbols.get(entry_name) is None:
            return False
        return True
