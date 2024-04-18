from antlr4 import FileStream


class InputStreamProcessor(FileStream):
    """
    This class is a derived class of the Antlr Processor,
    This is so we can easily support preprocessing of files, before parsing it
    """

    def __find(self, retrieve_string: str):
        """
        Find start and end index of a provided word (end index char not included in the retrieve string)
        """
        index = self.strdata.find(retrieve_string)
        return index, index+len(retrieve_string)

    def retrieve(self, retrieve_string: str):
        """
        Retrieve the substring starting with the provided string,
        we give the entire string till the end line
        """
        index, end_index = self.__find(retrieve_string)

        if index <= -1:
            return None

        """
        Gives substring on provided line
        """
        return self.strdata[index: self.strdata[index+1:].find('\n')+index+1]

    def replace_until(self, to_be_replaced: str, replace_with: str, stop_string: str):
        """
        Replace the to_be_replaced, with the 'replace_with'
        Till we come across the stop_string
        """

        index_stop, end_index_stop = self.__find(stop_string)
        while True:
            index, end_index = self.__find(to_be_replaced)
            """
            In case our to replace string is not found anymore, stop replacing,
            In case we passed the stop index, we will also stop replacing,
            we use the end_index, because when the stop condition and to be replaced, are the same, both
            indexes are the same
            """
            if (end_index_stop <= index and index_stop >= 0) or index <= -1:
                break

            self.strdata = self.strdata[:index] + replace_with + self.strdata[end_index:]

            self.data = [ord(c) for c in self.strdata]
            self._size = len(self.data)

