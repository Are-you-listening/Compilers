from src.parser.Tables.SymbolTypePtr import SymbolTypePtr, SymbolType


class SymbolTypeArray(SymbolTypePtr):
    def __init__(self, pts_to: SymbolType, const: bool, size: int = 1):
        super().__init__(pts_to, const)
        self.pts_to = pts_to

        """
        Store the ptr size 1, means singel array size, when size > 1 => ptr to an array
        """
        self.size = size
