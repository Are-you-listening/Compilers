

class MapEntry:
    def __init__(self, entry: str, mem_register: int):
        self.entry = entry
        self.mem_register = mem_register


class MapTable:
    def __init__(self, prev: "MapTable"):
        self.prev = prev
        self.symbols = {}

    def getEntry(self, entry: str):
        """
        Get entry
        :param entry: name of the entry
        :return:
        """
        if entry in self.symbols.keys():
            return self.symbols.get(entry)
        else:
            if self.prev is not None:
                return self.prev.getEntry(entry)

            return None

    def addEntry(self, map_entry: MapEntry):
        self.symbols[map_entry.entry] = map_entry

    def getOutStr(self, absolute: bool = False):
        out = []

        if absolute:
            if self.prev is not None:
                out.append(self.prev.getOutStr(absolute))

        for k, v in self.symbols.items():
            out.append(f"{k}: {v.mem_register}")

        out_str = "\n".join(out)
        return out_str

