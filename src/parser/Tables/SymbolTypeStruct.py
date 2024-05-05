from src.parser.Tables.SymbolTypeArray import *


class SymbolTypeStruct(SymbolType):
    def __init__(self, struct_name, pts_to: [SymbolType]):
        super().__init__(struct_name, False)
        self.pts_to = pts_to

    def getElementType(self, index: int):
        """
        Retrieve the element an index of the struct points to
        :param index:
        :return:
        """
        symbol_type = SymbolTypePtr(self.pts_to[index], False)
        return symbol_type

    def getPtrTuple(self):
        ptrs = [('*', self.isConst())]
        return (self.data_type, self.isConst()), ptrs

    def getFullType(self):
        ptr_list = []
        temp = []
        for item in self.pts_to:
            while isinstance(item, SymbolTypePtr):
                if isinstance(item, SymbolTypeArray):
                    temp.append((str(item.size), item.isConst()))
                else:
                    temp.append(("*", item.isConst()))
                item = item.deReference()

            if temp == []:
                temp = (item.getType(), item.isConst()), []
            else:
                temp = (item.getType(), item.isConst()), temp

            ptr_list.append(temp)
            temp = []
        return (self.getType(), self.isConst()), ptr_list

    def getPtrAmount(self):
        return 1

    def getBytesUsed(self):
        byte_amount = sum([f.getBytesUsed() for f in self.pts_to])

        return byte_amount

    @staticmethod
    def isBase():
        return False