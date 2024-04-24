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