from src.parser.Tables.SymbolType import *


class SymbolTypePtr(SymbolType):
    def __init__(self, pts_to: SymbolType):
        super().__init__("PTR")
        self.pts_to = pts_to

    def deReference(self):
        return self.pts_to


