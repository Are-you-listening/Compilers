from src.parser.Tables.SymbolType import *
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType

class SymbolTypePtr(SymbolType):
    def __init__(self, pts_to: SymbolType, const: bool):
        super().__init__("PTR", const)
        self.pts_to = pts_to

    def deReference(self):
        self.pts_to.union = self.union
        return self.pts_to

    def getBaseType(self):
        return self.pts_to.getBaseType()

    def getBaseConst(self):
        return self.pts_to.getBaseConst()

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
        if not isinstance(other, SymbolTypePtr):
            return False

        return super().__eq__(other) and self.pts_to == other.pts_to

    def getPtrAmount(self):
        return self.pts_to.getPtrAmount()+1

    def getRealPtrAmount(self):
        return self.pts_to.getRealPtrAmount()+1

    def getBytesUsed(self):
        return 4

    def hasFunction(self):
        """
        Indicate if this type uses some function ptr/ function
        """

        return self.pts_to.hasFunction()


    @staticmethod
    def isBase():
        return False
