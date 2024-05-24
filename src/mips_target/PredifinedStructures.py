from src.mips_target.MipsLibrary import *
from .MipsSingleton import MipsSingleton


class SpecialFunctions:
    @staticmethod
    def malloc2(func_type):
        """
        To understand this function pls read the reference .asm file
        This one is very cool, thats why I leave it, but SPIm has a lame syscall which and this doesnt work in SPIM

        :return:
        """
        function: Function = MipsSingleton.getInstance().getModule().createFunction("malloc", func_type)

        base_block = function.createBlock()
        search = function.createBlock()
        search_next = function.createBlock()
        assign = function.createBlock()

        zero = Memory(0, True)
        t0 = Memory(8, True)
        t1 = Memory(9, True)
        t2 = Memory(10, True)
        t3 = Memory(11, True)
        t4 = Memory(12, True)
        t5 = Memory(13, True)
        t6 = Memory(14, True)
        t7 = Memory(15, True)
        t8 = Memory(24, True)
        t9 = Memory(25, True)
        fp_register = Memory(30, True)
        v0 = Memory(2, True)

        a0 = Memory(4, True)

        s0 = Memory(16, True)
        s1 = Memory(17, True)
        s2 = Memory(18, True)

        """
        STUPID SPIM
        """

        temp_reg = base_block.lw(fp_register, 4)
        temp_reg.overrideMemory(t0)

        temp_reg = base_block.li(1)
        temp_reg.overrideMemory(t1)

        temp_reg = base_block.div(t0, t1)
        temp_reg.overrideMemory(t0)

        temp_reg = base_block.addui(t0, 1)
        temp_reg.overrideMemory(t0)

        temp_reg = base_block.la("heap")
        temp_reg.overrideMemory(t1)
        temp_reg = base_block.lw(t1, 0)
        temp_reg.overrideMemory(t1)

        """
        Search
        """
        temp_reg = search.lw(t1, 0)
        temp_reg.overrideMemory(t2)

        temp_reg = search.lw(t1, 4)
        temp_reg.overrideMemory(t3)

        search.bne(t2, zero, search_next.label)

        temp_reg = search.sgt(t0, t3)
        temp_reg.overrideMemory(t4)

        temp_reg = search.mul(t4, t3)
        temp_reg.overrideMemory(t4)

        search.bne(t4, zero, search_next.label)

        search.j(assign.label)

        """
        Search Next
        """
        temp_reg = search_next.li(4)
        temp_reg.overrideMemory(t4)
        temp_reg = search_next.mul(t3, t4)
        temp_reg.overrideMemory(t3)
        temp_reg = search_next.addui(t3, 8)
        temp_reg.overrideMemory(t3)
        temp_reg = search_next.addu(t1, t3)
        temp_reg.overrideMemory(t1)

        search_next.j(search.label)

        """
        Assign
        """
        temp_reg = assign.li(1)
        temp_reg.overrideMemory(t2)
        assign.sw(t2, t1, 0)
        assign.sw(t0, t1, 4)

        temp_reg = assign.addui(t1, 8)
        temp_reg.overrideMemory(t1)

        assign.move(v0, t1)

        function.endFunction()
        return function

    @staticmethod
    def malloc(func_type):
        function: Function = MipsSingleton.getInstance().getModule().createFunction("malloc", func_type)

        base = function.createBlock()

        fp_register = Memory(30, True)
        a0 = Memory(4, True)
        v0 = Memory(2, True)

        temp_reg = base.lw(fp_register, 4)
        temp_reg.overrideMemory(a0)

        temp_reg = base.li(9)
        temp_reg.overrideMemory(v0)
        base.systemCall()

        function.endFunction()
        return function

    @staticmethod
    def free(func_type):
        function: Function = MipsSingleton.getInstance().getModule().createFunction("free", func_type)
        function.endFunction()
        return function

    @staticmethod
    def calloc(func_type):
        function: Function = MipsSingleton.getInstance().getModule().createFunction("calloc", func_type)

        """call malloc with multiply result"""

        base_block = function.createBlock()
        loop_block = function.createBlock()

        fp_register = Memory(30, True)

        val1 = base_block.lw(fp_register, 4)
        val2 = base_block.lw(fp_register, 4)

        v0 = Memory(2, True)

        a0 = Memory(4, True)

        needed_space = base_block.mul(val1, val2)

        base_block.move(a0, needed_space)

        temp_reg = base_block.li(9)
        temp_reg.overrideMemory(v0)
        base_block.systemCall()
        """
        Stores ptr address on v0
        """

        base_block.j(loop_block.label)
        temp = loop_block.addui(needed_space, -1)
        temp.overrideMemory(needed_space)

        var_ptr = loop_block.addui(v0, 0)
        clear_location = loop_block.addu(var_ptr, needed_space)

        temp_zero = loop_block.li(0)

        loop_block.sb(temp_zero, clear_location, 0)

        loop_block.bne(temp_zero, needed_space, loop_block.label)

        function.endFunction()
        return function

