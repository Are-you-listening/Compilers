
from .Memory import Memory
from .MipsManager import MipsManager
from .Blocks import Block


class Function:
    def __init__(self, function_name: str):
        self.function_name = function_name
        self.blocks = []

        self.store_block: Block = self.__storeFrame()
        self.load_block: Block = self.__loadBlock()

        self.createBlock()

    def createBlock(self) -> Block:
        block_label = MipsManager.getInstance().useLabel()
        block = Block(block_label)

        self.blocks.append(block)

        return block

    @staticmethod
    def __storeFrame():
        store_frame_block = Block()

        #TODO replace this list with all loaded registers that are usable (s & t)
        registers = [Memory(31, True), Memory(8, True), Memory(9, True), Memory(10, True), Memory(11, True), Memory(12, True)]
        zero_register = Memory(0, True)

        sp_register = Memory(29, True)
        fp_register = Memory(30, True)

        """
        Store original frame ptr on the stack
        """
        store_frame_block.sw(fp_register, sp_register, 0)

        """
        Equivalent to move $fp, $sp
        """
        store_frame_block.add(fp_register, sp_register, zero_register)

        """
        Allocate the needed stack space
        """
        store_frame_block.addui(sp_register, sp_register, -(len(registers)+1)*4)

        for i, r in enumerate(registers):
            """
            Store the registers on the frame ptr stack space (code scoping)
            """
            store_frame_block.sw(r, fp_register, -(i+1)*4)

        return store_frame_block

    @staticmethod
    def __loadBlock():
        load_frame_block = Block()

        # TODO replace this list with all loaded registers that are usable (s & t)
        registers = [Memory(31, True), Memory(8, True), Memory(9, True), Memory(10, True), Memory(11, True), Memory(12, True)]
        zero_register = Memory(0, True)

        sp_register = Memory(29, True)
        fp_register = Memory(30, True)

        for i, r in enumerate(registers):
            """
            Store the registers on the frame ptr stack space (code scoping)
            """
            load_frame_block.lw(r, fp_register, -(i+1)*4)

        """
        Equivalent to move $fp, $sp
        """
        load_frame_block.add(sp_register, fp_register, zero_register)
        load_frame_block.lw(fp_register, sp_register, 0)

        return load_frame_block

    def toString(self):
        string = f"{self.function_name}:\n"

        string += f"{self.store_block.toString()}"
        for b in self.blocks:
            string += b.toString()
            string += "\n"

        string += f"{self.load_block.toString()}"
        string += "jr $ra\n"

        return string



