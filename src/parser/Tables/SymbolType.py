

class SymbolType:
    def __init__(self, data_type: str, const: bool):
        self.data_type = data_type
        self.const = const
        self.union = False

    def getType(self):
        return self.data_type

    def getBaseType(self):
        return self.data_type

    def getBaseConst(self):
        return self.const

    def isConst(self):
        return self.const

    def __str__(self):
        return f"{str(self.data_type)} {str(self.const)} "

    def getStringType(self):
        const_str = "const"
        if not self.const:
            const_str = ""
        return f"{const_str} {self.data_type}"

    def getPtrTuple(self):
        return (self.data_type, self.isConst()), []

    def __eq__(self, other):
        return self.data_type == other.data_type

    def __ne__(self, other):
        return not self.__eq__(other)

    def getPtrAmount(self):
        return 0

    def getBytesUsed(self):
        bytes_used = {"INT": 4, "CHAR": 1, "FLOAT": 4, "BOOL": 1}

        return bytes_used.get(self.data_type, 0)

    def hasFunction(self):
        """
        Indicate if this type uses some function ptr/ function
        """

        return False

    @staticmethod
    def isBase():
        return True
