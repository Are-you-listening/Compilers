from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolTypePtr import *
from typing import Dict


class SymbolEntry:
    def __init__(self, fitype: str, datatype: SymbolType, name: str, const: bool, value, first_declared, first_used):
        self.fitype = fitype
        self.typeObject = datatype
        self.name = name
        self.const = const
        self.value = value
        self.firstDeclared = first_declared  # The node this Entry is first declared
        self.firstUsed = first_used  # The node this Entry is first used

    def __str__(self):
        return f"""fi type: {self.fitype} 
                   type: {self.typeObject} 
                   name: {self.name}
                   const: {self.const}
                   value: {self.value}
                   first declared: {self.firstDeclared}
                   first used: {self.firstUsed})"""

    def getType(self):
        return self.typeObject.getType()

    def getTypeObject(self):
        return self.typeObject

    def getValue(self):
        return self.value

    def getPtrTuple(self):
        """
        returns a tuple: (type, amount of * depending on how many ptrs there are in the chain)
        """
        ptr_string = ""
        d_t = self.typeObject
        while isinstance(d_t, SymbolTypePtr):
            ptr_string += "*"
            d_t = d_t.deReference()

        return d_t.getType(), ptr_string


class SymbolTable:
    def __init__(self, prev):
        """
        Init a symbol table
        :param prev: a ptr to the prev symbol table we need to point to
        """
        self.symbols: Dict[str, SymbolEntry] = {}
        self.prev: "SymbolTable" = prev
        self.next = []
        self.typedefs = {}

    def addTypeDef(self, type, translation):
        """
        Adds a new typedef and already tries to translate it to the main time
        :param type:
        :param translation:
        :return:
        """
        if self.isTypedef(type):
            self.traverse(self.__typedefTranslate(type, translation), True)  # Traverse upwards in the tables
        self.typedefs[type] = translation   # Add the retrieved type translation

    def add(self, entry: SymbolEntry):
        """
        Add a symbol entry to the symbol table
        :param entry: the entry we want to add
        :return:
        """
        if self.symbols.get(entry.name) is not None:
            ErrorExporter.redefinition(entry.firstDeclared.linenr, entry.getType(),
                                       entry.name)  # This allows earlier detection of errors but unsure how we would
            # retrieve the lineNr
            return

        # Check if the entry's type is actually a typedef
        type = SymbolEntry.getType()
        if self.isTypedef(type):  # Then replace it to the base type (int, char, ..)
            translation = self.typedefs[type]
            SymbolEntry.typeObject = SymbolType(translation)

        self.symbols[entry.name] = entry

    def remove(self, symbol: SymbolEntry):
        self.symbols.pop(symbol.name)

    def getEntry(self, name):
        """
        Get entry
        :param name: name of the entry
        :return:
        """
        if name in self.symbols.keys():
            return self.symbols.get(name)
        else:
            if self.prev is not None:
                return self.prev.getEntry(name)
            return

    def __str__(self):
        rep_string = ""
        for entry in self.symbols.values():
            rep_string += f"{str(entry)}\n"
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
        return self.getEntry(entry_name) is not None

    def entryExists(self, entry_name: str):
        """
        Check if a given symbolEntry already exists in the current table
        :param entry_name:the name of an entry of the symbol table
        :return:
        """
        if self.symbols.get(entry_name) is None:
            return False
        return True

    def accept(self, v):
        v.visitSym(self)

    @staticmethod
    def isTypedef(type):
        if type not in ["INT", "CHAR", "FLOAT"]:
            return True
        return False

    def __typedefTranslate(self, type, translation):
        """
        Function to give to the SymbolTable Traverse to retrieve the type a typedef is referring to
        The function may stop when a recognised type is found, e.g. INT, CHAR, FLOAT
        :param type: Typedef first parameter
        :param translation: Current found translation
        :return:
        """
        if not self.isTypedef(translation):  # Translation is nota typedef anymore
            return
        else:
            translation = self.typedefs[type]

            if translation is None and self.prev is None:  # Searching for a typedef that doesn't exist!
                ErrorExporter.incompatibleTypedef("")
