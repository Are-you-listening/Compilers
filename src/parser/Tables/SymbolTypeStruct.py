from src.parser.Tables.SymbolTypeArray import *


class SymbolTypeStruct(SymbolType):
    def __init__(self, pts_to: [SymbolType], structName):
        super().__init__(structName, False)
        self.pts_to = pts_to

    def getElementType(self, index: int):
        """
        Retrieve the element an index of the struct points to
        :param index:
        :return:
        """
        ptr_list = [('*', False)]
        d_t = self.pts_to[index]

        while isinstance(d_t, SymbolTypePtr):
            if isinstance(d_t, SymbolTypeArray):
                ptr_list.append((str(d_t.size), d_t.isConst()))
            else:
                ptr_list.append(("*", d_t.isConst()))
            d_t = d_t.deReference()

        return (d_t.getType(), d_t.isConst()), ptr_list

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

            ptr_list.append(temp)
            temp = []
        return (self.getType(), self.isConst()), ptr_list
