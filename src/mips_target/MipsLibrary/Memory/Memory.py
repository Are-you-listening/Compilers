class Memory:
    def __init__(self, register_number: int, is_loaded: bool):
        self.register_number = register_number
        self.is_loaded = is_loaded

    def getNumber(self):
        return self.register_number


