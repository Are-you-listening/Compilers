from Blocks import Block
from MipsManager import MipsManager


class Function:
    def __init__(self, function_name: str):
        self.function_name = function_name
        self.blocks = []

    def createBlock(self):
        block_label = MipsManager.getInstance().useLabel()
        block = Block(block_label)

        self.blocks.append(block)

        return block
