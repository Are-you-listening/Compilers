from abc import abstractmethod


class TableEntry:
    pass


class AbstractTable:
    def __init__(self, prev):
        """
        Init a symbol table
        :param prev: a ptr to the prev symbol table we need to point to
        """
        self.prev = prev
        self.next = []

    @abstractmethod
    def add(self, entry: TableEntry):
        pass

    @abstractmethod
    def remove(self, entry: TableEntry):
        pass

    @abstractmethod
    def getEntry(self, name):
        pass

    def traverse(self, function, up: bool, args: list, do_print=False):
        """
        :param args: Parameters to give to the function
        :param do_print: bool indication whether to print or not
        :param function: function to execute
        :param up: go up or down the list
        :return:
        """

        if do_print:
            print(self)

        function(self, args)

        if up:
            if self.prev is None:
                return
            self.prev.traverse(function, up, args, do_print)
        else:
            for child in self.next:
                child.traverse(function, up, args, do_print)

    def nextTable(self, next_table: "AbstractTable"):
        """Add a new table as child"""
        self.next.append(next_table)
