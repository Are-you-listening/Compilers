from src.parser.Tables.SymbolTypePtr import SymbolTypePtr, SymbolType


class SymbolTypeArray(SymbolTypePtr):
    def __init__(self, pts_to: SymbolType, const: bool, size: int = 1):
        super().__init__(pts_to, const)
        self.pts_to = pts_to

        """
        Store the ptr size 1, means single array size, when size > 1 => ptr to an array
        """
        self.size = size

    def getPtrTuple(self):
        data_type, ptrs = self.pts_to.getPtrTuple()
        ptrs.append((str(self.size), self.isConst()))
        return data_type, ptrs
