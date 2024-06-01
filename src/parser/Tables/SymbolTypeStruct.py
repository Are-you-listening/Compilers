from src.parser.Tables.SymbolTypeArray import *


class SymbolTypeStruct(SymbolType):
    def __init__(self, struct_name):
        super().__init__(struct_name, False)

    def getElementType(self, index: int):
        """
        Retrieve the element an index of the struct points to
        :param index:
        :return:
        """
        symbol_type = TypeNodeHandler.getInstance().getInstance().getStructParam(self.data_type, index)

        symbol_type = SymbolTypePtr(symbol_type, False)
        return symbol_type

    def getPtrTuple(self):
        ptrs = [('*', self.isConst())]
        return (self.data_type, self.isConst()), ptrs

    def getPtrAmount(self):
        return 1

    def getRealPtrAmount(self):
        return 0

    def getBytesUsed(self):
        pts_to = TypeNodeHandler.getInstance().getInstance().struct_param[self.data_type]

        byte_amount = sum([f.getBytesUsed() for f in pts_to])

        return byte_amount

    def getElementCount(self):
        pts_to = TypeNodeHandler.getInstance().getInstance().struct_param[self.data_type]

        return len(pts_to)


    @staticmethod
    def isBase():
        return False

from src.parser.Tables.TypeNodehandler import TypeNodeHandler