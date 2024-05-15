class Memory:
    def __init__(self, address: int, is_loaded: bool):
        self.address = address
        self.is_loaded = is_loaded

    def __str__(self):
        return str(self.address)
