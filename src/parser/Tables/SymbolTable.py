from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolTypePtr import *
from src.parser.Tables.SymbolTypeArray import SymbolTypeArray
from src.parser.Tables.FunctionSymbolType import *
from src.parser.Tables.SymbolTypeStruct import *

from src.parser.AST import *
from src.parser.ASTTypedefReplacer import *
from typing import Dict
from src.parser.Tables.AbstractTable import *


class SymbolEntry(TableEntry):
    def __init__(self, datatype: SymbolType, name: str, value, first_declared, first_used):
        self.typeObject = datatype
        self.name = name
        self.value = value
        self.firstDeclared = first_declared  # The node this Entry is first declared
        self.firstUsed = first_used  # The node this Entry is first used
        self.referenced = False
        self.function_is_defined = False # function only

    def __str__(self):
        return f"""type: {self.typeObject} 
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
        ptr_list = []
        d_t = self.typeObject
        while isinstance(d_t, SymbolTypePtr):
            if isinstance(d_t, SymbolTypeArray):
                ptr_list.append((str(d_t.size), d_t.isConst()))
            else:
                ptr_list.append(("*", d_t.isConst()))
            d_t = d_t.deReference()

        if isinstance(d_t, SymbolTypeStruct):
            temp = []
            for item in d_t.pts_to:
                while isinstance(item, SymbolTypePtr):
                    if isinstance(item, SymbolTypeArray):
                        temp.append((str(item.size), item.isConst()))
                    else:
                        temp.append(("*", item.isConst()))
                    item = item.deReference()

                if temp == []:
                    temp = (item.getType(), item.isConst()), []

                ptr_list.append(temp)
                temp = []

        return (d_t.getType(), d_t.isConst()), ptr_list

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

        d_type = d_t.getType()
        if isinstance(d_t, FunctionSymbolType):
            d_type = f"Func:{d_t.return_type}:{d_t.param_types}"

        return d_type, ptr_string, const_list

    def reference(self):
        self.referenced = True

    def is_referenced(self):
        return self.referenced

    def is_function_defined(self):
        return self.function_is_defined

    def set_function_defined(self, value):
        self.function_is_defined = value


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
            # ErrorExporter.redefinition(entry.firstDeclared.linenr, entry.getType(),
            # entry.name)  # This allows earlier detection of errors but unsure how we would
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
        return rep_string

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

    def isRoot(self):
        return self.prev is None
