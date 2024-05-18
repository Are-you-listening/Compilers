
from .Memory import *
from .MipsManager import MipsManager
from .Blocks import Block


class Function:
    def __init__(self, function_name: str):
        self.function_name = function_name
        self.blocks = []

        self.frame_registers = RegisterManager.getInstance().getFramePtrRegisters()

        self.store_block: Block = self.__storeFrame(self.frame_registers)
        self.load_block: Block = None

        self.createBlock()

    def getOffset(self):
        return len(self.frame_registers)*4

    def endFunction(self):

        self.load_block: Block = self.__loadBlock(self.frame_registers)

    def createBlock(self) -> Block:
        block_label = MipsManager.getInstance().useLabel()
        block = Block(block_label, self)

        self.blocks.append(block)

        return block

    @staticmethod
    def __storeFrame(frame_registers):
        store_frame_block = Block()

        registers = frame_registers
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
        store_frame_block.add(sp_register, zero_register, fp_register, False)

        """
        Allocate the needed stack space
        """
        store_frame_block.addui_function(sp_register, -(len(registers)+1)*4, sp_register)

        for i, r in enumerate(registers):
            """
            Store the registers on the frame ptr stack space (code scoping)
            """
            store_frame_block.sw(r, fp_register, -(i+1)*4)
            RegisterManager.getInstance().framePtrStore(r)

        return store_frame_block

    def __loadBlock(self, frame_registers):
        load_frame_block = Block(f"function_{self.function_name}_load")

        registers = frame_registers
        zero_register = Memory(0, True)

        sp_register = Memory(29, True)
        fp_register = Memory(30, True)

        for i, r in enumerate(registers):
            """
            Store the registers on the frame ptr stack space (code scoping)
            """
            load_frame_block.lw_function(fp_register, -(i+1)*4, r)
            RegisterManager.getInstance().framePtrLoad(r)

        """
        Equivalent to move $fp, $sp
        """
        load_frame_block.add(fp_register, zero_register, sp_register, False)
        load_frame_block.lw_function(sp_register, 0, fp_register)

        return load_frame_block

    def toString(self):
        string = f"function_{self.function_name}:\n"

        string += f"{self.store_block.toString()}"
        for b in self.blocks:
            string += b.toString()
            string += "\n"

        string += f"{self.load_block.toString()}"
        string += "jr $ra\n"

        return string

    def getFunctionName(self):
        return self.function_name



