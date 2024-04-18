from antlr4 import FileStream


class InputStreamProcessor(FileStream):
    """

    """
    def __find(self, retrieve_string: str, from_index: int = 0):
        index = self.strdata[from_index:].find(retrieve_string)+from_index
        return index, index+len(retrieve_string)

    def retrieve(self, retrieve_string: str):
        index, end_index = self.__find(retrieve_string)

        if index <= -1:
            return None

        """
        Gives substring on provided line
        """
        return self.strdata[index: self.strdata[index+1:].find('\n')+index+1]

    def replace_until(self, to_be_replaced: str, replace_with: str, stop_string: str):
        while True:
            index, end_index = self.__find(to_be_replaced)
            index_stop, end_index_stop = self.__find(stop_string, index+1)

            print("iq", index, index_stop)
            if (index_stop < index and index_stop >= 0) or index <= -1:
                break
            print("q")
            self.strdata = self.strdata[:index] + replace_with + self.strdata[end_index:]

            self.data = [ord(c) for c in self.strdata]
            self._size = len(self.data)

