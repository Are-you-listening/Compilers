from src.parser.Tables.SymbolTypeStruct import *

class TypeNodeHandler:
    pass

class SymbolTypeUnion(SymbolTypeStruct):
    def __init__(self, struct_name):
        super().__init__(struct_name)

    def getElementType(self, index: int):
        """
        Retrieve the element an index of the struct points to
        :param index:
        :return:
        """
        symbol_type = TypeNodeHandler.getInstance().getStructParam(self.data_type, index)

        symbol_type = SymbolTypePtr(symbol_type, False)
        symbol_type.union = True
        return symbol_type

    def getStoreType(self):
        symbol_type = TypeNodeHandler.getInstance().union_store[self.data_type]
        s = SymbolTypePtr(symbol_type, False)
        s.union = True
        return s

from src.parser.Tables.TypeNodehandler import TypeNodeHandler