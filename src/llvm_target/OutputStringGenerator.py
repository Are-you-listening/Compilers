import llvmlite.ir.types

from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir


class UnaryWrapper:
    @staticmethod
    def Plus(llvm_var):
        return llvm_var

    @staticmethod
    def Min(llvm_var):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_type = llvm_var.type
        return block.sub(ir.Constant(llvm_type, 0), llvm_var)

    @staticmethod
    def fNeg(llvm_var):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        return block.fneg(llvm_var)

    @staticmethod
    def BitNot(llvm_var):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_type = llvm_var.type
        return block.xor(llvm_var, ir.Constant(llvm_type, -1))

    @staticmethod
    def LogicalNot(llvm_var):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_type = llvm_var.type
        sub_bool = block.icmp_signed("!=", llvm_var, ir.Constant(llvm_type, 0))
        llvm_var = block.xor(sub_bool, ir.Constant(ir.IntType(1), 1))
        llvm_var = block.zext(llvm_var, llvm_type)
        return llvm_var


class CTypesToLLVM:
    @staticmethod
    def getBytesUse(data_type: str, ptrs: str):
        if len(ptrs) >= 1:
            return 8

        convert_map = {"INT": 4, "CHAR": 1, "FLOAT": 4}
        return convert_map.get(data_type, "TYPE ISSUE")

    @staticmethod
    def getIRType(data_type: str, ptrs: str):
        convert_map = {"INT": ir.IntType(32), "CHAR": ir.IntType(8), "FLOAT": ir.FloatType()}
        llvm_type = convert_map.get(data_type)
        for i in range(len(ptrs)):
            llvm_type = ir.PointerType(llvm_type)

        return llvm_type


class Declaration:
    @staticmethod
    def declare(data_type: str, ptrs: str):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_val = block.alloca(CTypesToLLVM.getIRType(data_type, ptrs))
        llvm_val.align = CTypesToLLVM.getBytesUse(data_type, ptrs)

        return llvm_val

    @staticmethod
    def function(func_name: str, return_type: str, ptrs: str):
        """
        change the current latest function
        """
        function_type = ir.FunctionType(CTypesToLLVM.getIRType(return_type, ptrs), ())
        new_function = ir.Function(LLVMSingleton.getInstance().getModule(), function_type, name=func_name)
        LLVMSingleton.getInstance().setLastFunction(new_function)

        return new_function

    @staticmethod
    def assignment(store_register: int, value: int, align: int):

        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_val = block.store(value, store_register)

        llvm_val.align = align
        return llvm_val

    @staticmethod
    def llvmLiteral(value: str, data_type: str, ptrs: str):
        if CTypesToLLVM.getIRType(data_type, ptrs) == ir.FloatType():
            value = float(value)
        if CTypesToLLVM.getIRType(data_type, ptrs) == ir.IntType(32):
            value = int(value)

        return ir.Constant(CTypesToLLVM.getIRType(data_type, ptrs), value)

    @staticmethod
    def addComment(text: str):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        block.comment(text)


class Load:
    @staticmethod
    def identifier(load_llvm):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_var = block.load(load_llvm)

        llvm_var.align = load_llvm.align
        return llvm_var


class Calculation:
    @staticmethod
    def operation(left, right, operator):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        op_translate_float = {
            "+": block.fadd,
            "-": block.fsub,
            "*": block.fmul,
            "/": block.fdiv
        }

        op_translate = {"+": block.add,
                        "-": block.sub,
                        "*": block.mul,
                        "/": block.sdiv,
                        "%": block.srem,
                        "<<": block.shl,
                        ">>": block.ashr,
                        "&": block.and_,
                        "|": block.or_,
                        "^": block.xor
                        }

        op_translate_icmp = {"<": block.icmp_signed,
                             ">": block.icmp_signed,
                             "==": block.icmp_signed,
                             "!=": block.icmp_signed,
                             "<=": block.icmp_signed,
                             ">=": block.icmp_signed
                             }

        if left.type == ir.FloatType():
            llvm_op = op_translate_float.get(operator, "")
            llvm_var = llvm_op(left, right)
            return llvm_var

        elif left.type.is_pointer and operator in ["+", "-"]:
            if not isinstance(right, ir.Constant):  # If it is no constant, LLVM requires a sign extend to match the size
                right = block.sext(right, ir.IntType(64))

            if operator == "-":  # Add a subtract
                Calculation.operation(right, right, operator)

            new_value = block.gep(left, [right], True) # Create the gep instruction
            return new_value

        else:
            llvm_op = op_translate.get(operator, None)
            if llvm_op is not None:
                llvm_var = llvm_op(left, right)
                return llvm_var
            llvm_op = op_translate_icmp.get(operator, None)
            llvm_var = llvm_op(operator, left, right)

            """
            convert 1 bit to 32 bit
            """
            llvm_var = block.zext(llvm_var, left.type)
            return llvm_var


    @staticmethod
    def unary(llvm_val, op: str):

        op_translate_float = {"-": UnaryWrapper.fNeg,
                              "+": UnaryWrapper.Plus,
                              "++": lambda llvm_var: Calculation.operation(llvm_var, ir.Constant(llvm_var.type, 1), "+")
                              }

        op_translate = {"-": UnaryWrapper.Min,
                        "+": UnaryWrapper.Plus,
                        "~": UnaryWrapper.BitNot,
                        "!": UnaryWrapper.LogicalNot,
                        "++": lambda llvm_var: Calculation.operation(llvm_var, ir.Constant(llvm_var.type, 1), "+")
                        }

        if llvm_val.type == ir.FloatType():
            llvm_op = op_translate_float.get(op, None)
        else:
            llvm_op = op_translate.get(op, None)

        return llvm_op(llvm_val)


class Printf:
    @staticmethod
    def printf(format_specifier: str, *args):
        if LLVMSingleton.getInstance().getPrintF() == None:
            module = LLVMSingleton.getInstance().getModule()
            voidptr_ty = ir.IntType(8).as_pointer()
            printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
            printf = ir.Function(module, printf_ty, name="printf")
            LLVMSingleton.getInstance().setPrintF(printf)


        current_function = LLVMSingleton.getInstance().getLastFunction()
        block = current_function.append_basic_block("printf_block")

        builder = ir.IRBuilder(block)
        format_str_const = ir.Constant(ir.ArrayType(ir.IntType(8), len(format_specifier) + 1),
                                       bytearray(format_specifier.encode("utf8")))
        format_str_global = builder.module.globals.get(".str")
        if not format_str_global:
            format_str_global = ir.GlobalVariable(builder.module, format_str_const.type, ".str")
            format_str_global.linkage = "internal"
            format_str_global.global_constant = True
            format_str_global.initializer = format_str_const
        format_str_ptr = builder.bitcast(format_str_global, ir.IntType(8).as_pointer())

        """
        Create an alloca instruction for each argument
        """
        args_alloca = [builder.alloca(arg.type) for arg in args]

        """
        Store the arguments in their respective alloca instructions
        """
        for arg_alloca, arg_value in zip(args_alloca, args):
            builder.store(arg_value, arg_alloca)

        """ 
        Load the arguments from their respective alloca instructions 
        """
        args_values = [format_str_ptr] + [builder.load(arg_alloca) for arg_alloca in args_alloca]

        printf_call = builder.call(LLVMSingleton.getInstance().getPrintF(), args_values)

        return printf_call

class Conversion:
    @staticmethod
    def performConversion(llvm_var, to_type):
        block = LLVMSingleton.getInstance().getCurrentBlock()  # Get the current block
        if isinstance(llvm_var.type, ir.IntType) and (to_type == "float" or to_type == "FLOAT"):
            return block.fpext(llvm_var, ir.FloatType())
        elif isinstance(llvm_var.type, ir.FloatType) and (to_type == "int" or to_type == "INT"):
            return block.fptosi(llvm_var, ir.IntType(32))
        elif isinstance(llvm_var.type, ir.IntType) and (to_type == "char" or to_type == "CHAR"):
            return block.trunc(llvm_var, ir.IntType(8))
        elif isinstance(llvm_var.type, ir.FloatType) and (to_type == "char" or to_type == "CHAR"):
            return block.trunc(llvm_var, ir.IntType(8))
        elif isinstance(llvm_var.type, ir.IntType) and (to_type == "int" or to_type == "INT"):
            return block.zext(llvm_var, ir.IntType(32))
        else:
            return llvm_var










