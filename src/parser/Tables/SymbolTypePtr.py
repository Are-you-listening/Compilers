from src.parser.Tables.SymbolType import *


class SymbolTypePtr(SymbolType):
    def __init__(self, pts_to: SymbolType, const: bool):
        super().__init__("PTR", const)
        self.pts_to = pts_to

    def deReference(self):
        return self.pts_to

    def __str__(self):
        return f"{str(self.data_type)} {str(self.const)} {str(self.pts_to)}"

    def getStringType(self):
        const_str = "const"
        if not self.const:
            const_str = ""

        return f"{self.pts_to.getStringType()}*{const_str}"

    def getPtrTuple(self):

        data_type, ptrs = self.pts_to.getPtrTuple()
        ptrs.append(("*", self.isConst()))
        return data_type, ptrs

    def __eq__(self, other):

        return super().__eq__(other) and self.isConst() == other.isConst() and self.pts_to == other.pts_to
