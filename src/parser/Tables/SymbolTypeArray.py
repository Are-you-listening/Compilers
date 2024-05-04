from src.parser.Tables.SymbolTypePtr import SymbolTypePtr, SymbolType
from src.interal_tools import PreConditions


class SymbolTypeArray(SymbolTypePtr):
    def __init__(self, pts_to: SymbolType, const: bool, size: int = 1):
        super().__init__(pts_to, const)

        """
        Store the ptr size 1, means single array size, when size > 1 => ptr to an array
        """

        PreConditions.assertInstanceOff(size, int)

        self.size = size

    def getPtrTuple(self):
        data_type, ptrs = self.pts_to.getPtrTuple()
        ptrs.append((str(self.size), self.isConst()))
        return data_type, ptrs

    def __eq__(self, other):
        if not isinstance(other, SymbolTypeArray):
            return super().__eq__(other)

        return super().__eq__(other) and self.size == other.size and self.pts_to.isConst() == other.pts_to.isConst()
