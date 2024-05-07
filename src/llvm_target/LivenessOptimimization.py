from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir


class LivenessOptimization:
    """
    Apply the liveness optimization on the remaining LLVM
    """

    def __init__(self):
        self.functions = LLVMSingleton.getInstance().getModule().functions
        self.blacklist_instances = {ir.Comment, ir.CallInstr, ir.Ret}

    def optimize(self):
        for function in self.functions:
            for block in function.blocks:
                self.liveness_block(block)

    def liveness_block(self, block: ir.Block):
        liveness = set()

        useless = set()

        if len(block.instructions) == 0:
            return

        """
        Initialize liveness with some elements
        """
        last_index = -1
        while len(liveness) == 0 and abs(last_index) < len(block.instructions):
            last = block.instructions[last_index]
            last_index -= 1

            if not isinstance(last, ir.Ret) and not isinstance(last, ir.ConditionalBranch):
                continue
            for o in last.operands:
                if not isinstance(o, ir.Constant):
                    liveness.add(o.name)
        if len(liveness) == 0:
            return

        for i, instruction in enumerate(reversed(block.instructions[:last_index])):

            keep_store = False
            if isinstance(instruction, ir.StoreInstr) and (instruction.operands[1].name in liveness
                                                           or not isinstance(instruction.operands[1], ir.AllocaInstr)):
                keep_store = True
                for o in instruction.operands:
                    if not isinstance(o, ir.Constant):
                        liveness.add(o.name)

            if instruction.name not in liveness:
                if not self.in_instance_blacklist(instruction) and not keep_store:
                    useless.add(instruction)
                else:
                    for o in instruction.operands:
                        if not isinstance(o, ir.Constant):
                            liveness.add(o.name)
                continue

            """
            Add others to liveness and remove self from this set
            """
            for o in instruction.operands:
                if not isinstance(o, ir.Constant):
                    liveness.add(o.name)

            liveness.remove(instruction.name)

        """
        Remove useless LLVM instructions
        """

        for u in useless:
            #print("u", u)
            block.instructions.remove(u)

    def in_instance_blacklist(self, instruction):
        for b in self.blacklist_instances:
            if isinstance(instruction, b):
                return True
        return False

