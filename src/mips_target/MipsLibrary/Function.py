from .Blocks import Block
from .MipsManager import MipsManager
from .Memory.Memory import Memory


class Function:
    def __init__(self, function_name: str):
        self.function_name = function_name
        self.blocks = []

        self.store_block: Block = self.__store_frame()
        self.load_block: Block = self.__load_block()

    def createBlock(self):
        block_label = MipsManager.getInstance().useLabel()
        block = Block(block_label)

        self.blocks.append(block)

        return block

    @staticmethod
    def __store_frame():
        store_frame_block = Block("")

        #TODO replace this list with all loaded registers that are usable (s & t)
        registers = [Memory(1, True), Memory(2, True), Memory(3, True)]
        zero_register = Memory(0, True)

        sp_register = Memory(31, True)
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
            store_frame_block.sw(r, sp_register, -(i+1)*4)

        return store_frame_block

    @staticmethod
    def __load_block():
        load_frame_block = Block("")

        # TODO replace this list with all loaded registers that are usable (s & t)
        registers = [Memory(1, True), Memory(2, True), Memory(3, True)]
        zero_register = Memory(0, True)

        sp_register = Memory(31, True)
        fp_register = Memory(30, True)

        for i, r in enumerate(registers):
            """
            Store the registers on the frame ptr stack space (code scoping)
            """
            load_frame_block.lw(r, sp_register, -(i+1)*4)

        """
        Equivalent to move $fp, $sp
        """
        load_frame_block.add(sp_register, fp_register, zero_register)
        load_frame_block.lw(fp_register, sp_register, 0)

        return load_frame_block

    def toString(self):
        string = f"{self.function_name}:\n"

        string += f"{self.store_block.toString()}\n"
        for b in self.blocks:
            string += b.toString()
            string += "\n"

        string += f"{self.load_block.toString()}\n"

        return string
