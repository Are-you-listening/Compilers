from src.parser.Tables.AbstractTable import *
from src.parser.ErrorExporter import *


class StructTable(AbstractTable):
    def __init__(self, prev):
        super().__init__(prev)
        self.structTable = {}  # Keep track of the indices of parameters e.g. {"kaas": ["melk", "fermented"]} melk has index 0, this will be used for adding the GEP instruction in LLVM

    def add(self, name: str):
        self.structTable[name] = []

    def addDataMember(self, struct_name: str, data_member: str):
        self.structTable[struct_name].append(data_member)

    def remove(self, entry: str):
        self.structTable.__delitem__(entry)

    def getEntry(self, struct_name: str, data_member: str, linenr: str):
        """
        :param struct_name: Name of the struct
        :param data_member: name of the struct data field
        :return: Index of a data_member
        """
        if self.structTable.get(struct_name, None) is None:
            if self.prev is None:
                ErrorExporter.undeclaredTypedef(linenr, struct_name)
            else:
                return self.prev.getEntry(struct_name, data_member, linenr)

        try:
            return self.structTable[struct_name].index(data_member)
        except:
            ErrorExporter.undeclaredVariable(data_member, linenr)

    def isUnion(self, struct_name: str, linenr: str):
        """
        :param struct_name: Name of the struct
        :return:
        """
        if self.structTable.get(struct_name) is None:
            if self.prev is None:
                ErrorExporter.undeclaredTypedef(linenr, struct_name)
            else:
                return self.prev.isUnion(struct_name, linenr)

        return self.structTable[struct_name][-1:][0] == "union"

    def nextTable(self, next_table: "AbstractTable"):
        """Add a new table as child"""
        self.next.append(next_table)