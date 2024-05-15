

class MipsManager:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.label_counter = 1

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if MipsManager.__instance is None:
            MipsManager.__instance = MipsManager()
        return MipsManager.__instance

    def useLabel(self):
        label_nr = self.label_counter
        self.label_counter += 1
        return f"L{label_nr}"