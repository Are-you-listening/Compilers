from src.parser.Tables.SymbolType import *


class SymbolTypePtr(SymbolType):
    def __init__(self, pts_to: SymbolType, const: bool):
        super().__init__("PTR", const)
        self.pts_to = pts_to

    def deReference(self):
        return self.pts_to
