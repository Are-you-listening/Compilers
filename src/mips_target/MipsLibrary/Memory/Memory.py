from src.parser.Tables.SymbolType import SymbolType


class Memory:
    def __init__(self, address: int | str, is_loaded: bool):
        self.address = address
        self.is_loaded = is_loaded
        self.from_block = None
        self.symbol_type: SymbolType = None
        """
        encode consts that we need at runtime
        """
        self.const_value: int = None

    def __str__(self):
        return str(self.address)

    def getAddress(self):
        return self.address

    def setSize(self, new_size: int):
        self.size = new_size

    def overrideMemory(self, other: "Memory"):

        self.address = other.address
        self.is_loaded = other.is_loaded

        if self.from_block is not None:
            self.from_block.overrideMemory(other)

