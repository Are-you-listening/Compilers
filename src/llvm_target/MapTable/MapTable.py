

class MapEntry:
    def __init__(self, entry: str, llvm):
        self.entry = entry
        self.llvm = llvm


class MapTable:
    def __init__(self, prev: "MapTable"):
        self.prev = prev
        self.symbols = {}
        self.symbols_reverse = {}

    def getEntry(self, entry, reverse: bool=False):
        """
        Get entry
        :param entry: name of the entry
        :return:
        """
        table = self.symbols
        if reverse:
            table = self.symbols_reverse

        if entry in table.keys():
            return table.get(entry)
        else:
            if self.prev is not None:
                return self.prev.getEntry(entry, reverse)

            return None

    def addEntry(self, map_entry: MapEntry):
        self.symbols[map_entry.entry] = map_entry
        self.symbols_reverse[map_entry.llvm] = map_entry

    def getOutStr(self, absolute: bool = False):
        out = []

        if absolute:
            if self.prev is not None:
                out.append(self.prev.getOutStr(absolute))

        for k, v in self.symbols.items():
            out.append(f"{k}: {v.mem_register}")

        out_str = "\n".join(out)
        return out_str

