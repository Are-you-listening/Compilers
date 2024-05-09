from src.parser.Tables.SymbolTypeStruct import *


class SymbolTypeUnion(SymbolTypeStruct):
    def __init__(self, struct_name, union_type: SymbolType):
        super().__init__(struct_name)
        self.union_type = union_type

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
        symbol_type = self.union_type
        s = SymbolTypePtr(symbol_type, False)
        s.union = True
        return s
