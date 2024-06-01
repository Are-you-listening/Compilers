from src.parser.Tables.TypeNodehandler import SymbolTypeUnion
from .Memory import Memory
from src.internal_tools.IntegrityChecks import PreConditions
import math
from src.parser.Tables.SymbolType import SymbolType
from src.parser.Tables.SymbolTypeArray import SymbolTypeArray
from src.parser.Tables.SymbolTypePtr import SymbolTypePtr
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct


class RegisterManager:
    __instance = None

    def __init__(self):
        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        self.stack = []
        self.registers: dict[str, Memory | None] = {}  # Maps register names to Memory Objects e.g "v0" : Memory Object
        self.special_registers = {"v0": None, "v1": None, "a0": None, "a1": None, "a2": None, "a3": None,
                                  "fp": Memory(30, True), "sp": Memory(29, True), "ra": None, "zero": None}  # Same as special registers but these may not be regularly used

        for i in range(0, 10):  # Insert registers
            self.registers[f"t{i}"] = None
        for i in range(0, 8):  # Insert registers
            self.registers[f"s{i}"] = None

        self.curr_function = {}

        """
        Stores in case we spill something, to memory, the memory location, in those cases, we might be able to reuse
        some space (which also emans that we can refer to same memory locations)
        """
        self.register_spill_map: dict[str, dict[Memory, int] | None] = {}

    def clear(self):
        self.__instance = None
        self.__init__()

    @staticmethod
    def getInstance():
        if RegisterManager.__instance is None:
            RegisterManager.__instance = RegisterManager()
        return RegisterManager.__instance

    def __getRegister(self, var: Memory):
        """
        Retrieve the register number for an object from self.registers only
        :return:
        """
        for key in self.registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        return None

    def __inUse(self, reg: str):
        return self.registers.get(reg, None) is not None

    def __getFirstFree(self):
        for key in self.registers.keys():
            if self.getMemoryObject(key) is None:
                return key
        return None

    def __claimRegister(self, var: Memory, reg: str):
        if reg in self.registers.keys():
            self.registers[reg] = var
        else:
            self.special_registers[reg] = var
        var.address = reg
        var.is_loaded = True

    def spill(self, block, reg: str):

        """
        Spill a register to memory
        :return:
        """
        if block.function.getFunctionName() not in self.curr_function:
            self.curr_function[block.function.getFunctionName()] = 0

        counter = self.curr_function[block.function.getFunctionName()]

        var = self.getMemoryObject(reg)

        function_spill_map = self.register_spill_map.get(block.function.getFunctionName(), {})

        used_mem_loc = function_spill_map.get(var)

        fp = self.getMemoryObject("fp")
        if used_mem_loc is None:
            counter += 4
            self.curr_function[block.function.getFunctionName()] = counter

            sp = self.getMemoryObject("sp")

            block.addui_function(sp, -4, sp)  # Adjust frame/stack ptr

            block.sw_spill(var, fp, -(block.function.getOffset()+counter))  # Store to new ptr
            function_spill_map[var] = -(block.function.getOffset()+counter)
            self.register_spill_map[block.function.getFunctionName()] = function_spill_map

            var.is_loaded = False
            var.address = block.function.getOffset() + counter

            self.registers[reg] = None

        else:
            """
            Reuse spill location
            """
            block.sw_spill(var, fp, used_mem_loc)

            var.is_loaded = False
            var.address = -used_mem_loc
            self.registers[reg] = None

    def load(self, block, var: Memory, reg: str):
        """
        Load value from a memory location into a register with name reg
        """
        offset = var.address
        self.registers[reg] = var
        var.address = reg
        var.is_loaded = True
        block.lw_function(self.getMemoryObject("fp"), -offset, var)

    def getRegister(self, var: Memory):
        """
        Retrieve the register number for an object
        :return:
        """
        for key in self.registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        for key in self.special_registers.keys():
            if self.getMemoryObject(key) == var:
                return key
        return None

    def getMemoryObject(self, register: str):
        """
        Retrieve the object stored in a register
        :return:
        """
        if self.registers.get(register, None) is not None:
            return self.registers.get(register, None)
        else:
            return self.special_registers.get(register, None)

    def allocate(self, block, y: Memory = None, z: Memory = None):

        """
        Handles register assignment and follows the algorithm from the slides
        x := y op z

        :param y: May be None
        :param z: May be None
        :return:
        """
        """
        Following the  'Registers for result' 'Register Allocation' rules
        """

        store_register = Memory(None, False)
        free_register = self.__getFirstFree()

        if free_register is None:
            for key in self.registers.keys():
                self.spill(block, key)
            free_register = self.__getFirstFree()

        self.__claimRegister(store_register, free_register)
        return store_register

    def framePtrStore(self, mem_object: Memory):

        """
        When we store our value on the frame stack, as far as the child blocks of this frame know
        these register had never values
        """

        PreConditions.assertInstanceOff(mem_object, Memory)
        PreConditions.assertTrue(mem_object.is_loaded)
        reg = mem_object.address
        if reg in self.registers:
            self.registers[reg] = None

        if reg in self.special_registers:
            self.special_registers[reg] = None

        mem_object.is_loaded = False

    def framePtrLoad(self, mem_object: Memory):

        """
        Reverse the effects of framePtrStore after a function
        """
        PreConditions.assertInstanceOff(mem_object, Memory)
        PreConditions.assertTrue(not mem_object.is_loaded)

        reg = mem_object.address
        if reg in self.registers:
            self.registers[reg] = mem_object

        if reg in self.special_registers:
            self.special_registers[reg] = mem_object

        mem_object.is_loaded = True

    def getFramePtrRegisters(self):
        """
        Get all registers corresponding to its current MemoryObject that needs to be stored on the stack
        """

        registers = []
        for register, mem in self.registers.items():
            if mem is None:
                mem = Memory(register, True)
            registers.append(mem)

        for register, mem in self.special_registers.items():

            if register in ("fp", "sp", "zero", "v0"):
                continue

            if mem is None:
                mem = Memory(register, True)

            registers.append(mem)
        return registers

    def loadIfNeeded(self, block, load_list: list[Memory]):
        """
        Load a values if it is not loaded on a register

        We make sure that the entire list at the end is loaded
        """

        """
        If we just loaded a value into a register, it would be a shame we would override it again, so
        we have a list of everything we just loaded
        """
        loaded = []

        for load_mem in load_list:

            """
            When something is not loaded, we are going to load it
            """
            if not load_mem.is_loaded:
                """
                If no registers are available, we are going to spill everything, that we do not yet need,
                after spilling at least 1 register will be free
                """
                if self.__getFirstFree() is None:
                    for k, v in self.registers.items():
                        """
                        Skip all loaded registers, and registers in the load list (because we don't want to override)
                        those
                        """
                        if v in loaded or v in load_list:
                            continue
                        self.spill(block, k)

                """
                Get the free register
                """
                f = self.__getFirstFree()

                """
                Load the value from the stack onto the free register
                """
                self.load(block, load_mem, f)

                """
                Add the register to loaded, without any overhead
                """
                self.registers[f] = load_mem

            """
            Store this register among the loaded
            """
            loaded.append(load_mem)

    def storeVariable(self, block, value: Memory, symbol_type: SymbolType):
        if symbol_type.getPtrAmount() == 0:
            return value

        self.loadIfNeeded(block, [value])

        if block.function.getFunctionName() not in self.curr_function:
            self.curr_function[block.function.getFunctionName()] = 0

        byte_size = symbol_type.getBytesUsed()

        needed = math.ceil(byte_size/4)*4

        sp = self.getMemoryObject("sp")
        if isinstance(symbol_type, SymbolTypeArray):
            if isinstance(symbol_type, SymbolTypeArray):
                size = symbol_type.size
            else:
                size = 1
                needed = 4

            """
            4 bytes
            """
            values = []
            for v in range(size):
                v2 = self.storeVariable(block, value, symbol_type.deReference())
                values.append(v2)

            counter = self.curr_function[block.function.getFunctionName()]
            counter += needed
            self.curr_function[block.function.getFunctionName()] = counter

            block.addui_function(sp, -needed, sp)
            for i, v in enumerate(reversed(values)):

                self.loadIfNeeded(block, [v])
                if symbol_type.deReference().getBytesUsed() < 4:
                    block.sb_spill(v, sp, (i * symbol_type.deReference().getBytesUsed()) + 4)  # Store to new ptr
                else:
                    block.sw_spill(v, sp, (i*4) + 4)  # Store to new ptr

            store_ptr = block.addui(sp, 4)

        elif isinstance(symbol_type, SymbolTypePtr):

            value = self.storeVariable(block, value, symbol_type.deReference())

            counter = self.curr_function[block.function.getFunctionName()]
            counter += 4
            self.curr_function[block.function.getFunctionName()] = counter

            block.addui_function(sp, -4, sp)  # Adjust frame/stack ptr
            block.sw_spill(value, sp, 4)  # Store to new ptr

            store_ptr = block.addui(sp, 4)

        elif isinstance(symbol_type, SymbolTypeStruct):
            values = []
            needed = 4

            elem_count = symbol_type.getElementCount()
            if isinstance(symbol_type, SymbolTypeUnion):
                elem_count = 1

            for v in range(elem_count):

                elem_type = symbol_type.getElementType(v)
                if isinstance(symbol_type, SymbolTypeUnion):
                    elem_type = symbol_type.getStoreType()

                if isinstance(elem_type.deReference(), SymbolTypePtr) and isinstance(elem_type.deReference().deReference(), SymbolTypeStruct):
                    v2 = self.storeVariable(block, value, SymbolType("INT", False))
                else:
                    v2 = self.storeVariable(block, value, elem_type.deReference())

                byte_size = elem_type.deReference().getBytesUsed()
                byte_size = math.ceil(byte_size/4)*4

                if isinstance(elem_type.deReference(), SymbolTypeArray):
                    byte_size = 4
                needed += byte_size

                values.append(v2)

            counter = self.curr_function[block.function.getFunctionName()]
            counter += needed
            self.curr_function[block.function.getFunctionName()] = counter

            block.addui_function(sp, -needed, sp)
            for i, v in enumerate(values):
                self.loadIfNeeded(block, [v])
                block.sw_spill(v, sp, (i * 4) + 4)  # Store to new ptr

            store_ptr = block.addui(sp, 4)

        store_ptr.symbol_type = symbol_type

        return store_ptr

    def spillAll(self, block):
        """
        Spill all registers to memory, usefull at end of block in case of a loop
        """
        for k, v in self.registers.items():
            if v is None:
                continue

            self.spill(block, k)

    def claimStack(self, block, needed: int):
        counter = self.curr_function[block.function.getFunctionName()]
        counter += needed
        self.curr_function[block.function.getFunctionName()] = counter

        sp = self.getMemoryObject("sp")

        block.addui_function(sp, -needed, sp)
