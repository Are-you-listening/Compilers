class Memory:
    def __init__(self, address: int, live: bool, next_use):
        self.address = address
        self.live = live
        self.next_use = next_use
