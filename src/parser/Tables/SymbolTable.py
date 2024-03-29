from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolTypePtr import *
from src.parser.AST import *
from src.parser.ASTTypedefReplacer import *
from typing import Dict
from src.parser.Tables.AbstractTable import *


class SymbolEntry(TableEntry):
    def __init__(self, fitype: str, datatype: SymbolType, name: str, value, first_declared, first_used):
        self.fitype = fitype
        self.typeObject = datatype
        self.name = name
        self.value = value
        self.firstDeclared = first_declared  # The node this Entry is first declared
        self.firstUsed = first_used  # The node this Entry is first used
        self.referenced = False

    def __str__(self):
        return f"""fi type: {self.fitype} 
                   type: {self.typeObject} 
                   name: {self.name}
                   const: {self.isConst()}
                   value: {self.value}
                   first declared: {self.firstDeclared}
                   first used: {self.firstUsed})"""

    def isConst(self):
        return self.typeObject.isConst()

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

    def getJsonDataType(self):
        """
        returns a tuple: (type, amount of * depending on how many ptrs there are in the chain)
        """
        ptr_string = ""
        const_list = []
        d_t = self.typeObject
        while isinstance(d_t, SymbolTypePtr):
            ptr_string += "*"

            const_list.insert(0, d_t.isConst())
            d_t = d_t.deReference()

        const_list.insert(0, d_t.isConst())

        return d_t.getType(), ptr_string, const_list

    def reference(self):
        self.referenced = True

    def is_referenced(self):
        return self.referenced


class SymbolTable(AbstractTable):
    def __init__(self, prev):
        """
        Init a symbol table
        :param prev: a ptr to the prev symbol table we need to point to
        """
        super().__init__(prev)
        self.symbols: Dict[str, SymbolEntry] = {}
        self.typedefs = []  # List of TypeDef-Subtrees (These are not present anymore in the AST)
        self.translation = []  # Helper variable

    def add(self, entry: SymbolEntry):
        """
        Add a symbol entry to the symbol table
        :param entry: the entry we want to add
        :return:
        """
        if self.symbols.get(entry.name) is not None:
             #ErrorExporter.redefinition(entry.firstDeclared.linenr, entry.getType(),
                                        #entry.name)  # This allows earlier detection of errors but unsure how we would
             # retrieve the lineNr
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

    def reference(self, identifier: str):
        """
        when we reference an identifier its corresponding symbol entry needs to store that information
        So we can take that into account for Constant Propagation

        :param identifier: name of the variable
        :return:
        """
        entry = self.getEntry(identifier)
        if entry is None:
            return
        entry.reference()
