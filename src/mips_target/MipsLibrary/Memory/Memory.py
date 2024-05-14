class Memory:
    def __init__(self, address: int, is_loaded: bool, live: bool, next_use):
        self.is_loaded = is_loaded
        self.address = address
        self.live = live
        self.next_use = next_use
