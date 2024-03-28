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

        return f"{self.pts_to.getStringType()}* {const_str} "

