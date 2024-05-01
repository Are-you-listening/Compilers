from src.parser.Tables.SymbolTypeStruct import *


class SymbolTypeUnion(SymbolTypeStruct):
    def __init__(self, struct_name, union_type: SymbolType, real_types: [SymbolType]):
        super().__init__(struct_name, False)
        self.pts_to = [union_type]
        self.real_types = real_types

    def getElementType(self, index: int):
        """
        Retrieve the element an index of the struct points to
        :param index:
        :return:
        """

        symbol_type = SymbolTypePtr(self.real_types[index], False)
        symbol_type.union = True
        return symbol_type

    def getStoreType(self):
        s = SymbolTypePtr(self.pts_to[0], False)
        s.union = True
        return s
