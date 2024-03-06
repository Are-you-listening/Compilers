

class SymbolType:
    def __init__(self, data_type: str):
        self.data_type = data_type

    def getType(self):
        return self.data_type

    def __str__(self):
        return str(self.data_type)
