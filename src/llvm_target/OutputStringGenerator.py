import llvmlite.ir.types

from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir


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
    def assignment(store_register: int, value: int, data_type: str, ptrs: str):

        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_val = block.store(value, store_register)

        llvm_val.align = CTypesToLLVM.getBytesUse(data_type, ptrs)
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
                        "%": block.srem
                        }

        op_translate_icmp = {"<": block.icmp_signed,
                             ">": block.icmp_signed,
                             "==": block.icmp_signed,
                             "!=": block.icmp_signed
                             }

        if left.type == "float":
            llvm_op = op_translate_float.get(operator, "")
            llvm_var = llvm_op(operator, left, right)
            return llvm_var
        elif left.type.is_pointer:
            if not isinstance(right, ir.Constant):
                right = block.sext(right, ir.IntType(64))

            if operator == "-":  # Add a subtract
                Calculation.operation(right, right, operator)

            new_value = block.gep(left, [right], True)
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
        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_type = llvm_val.type

        op_translate_float = {"-": block.fneg(llvm_val),
                              "+": llvm_val
                              }

        op_translate = {"-": block.sub(ir.Constant(llvm_type, 0), llvm_val),
                        "+": llvm_val,
                        "~": block.xor(llvm_val, ir.Constant(llvm_type, -1)),
                        "!": block.xor(block.icmp_signed("!=", llvm_val, ir.Constant(llvm_type, 0)), 1)
                        }

        if llvm_type == "float":
            llvm_result = op_translate_float.get(op, None)
        else:
            llvm_result = op_translate.get(op, None)

        return llvm_result


class Printf:
    @staticmethod
    def printf(format_specifier: str, *args):
        module = LLVMSingleton.getInstance().getModule()
        voidptr_ty = ir.IntType(8).as_pointer()
        printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        printf = ir.Function(module, printf_ty, name="printf")

        # Create a new basic block in the current function
        current_function = LLVMSingleton.getInstance().getLastFunction()
        block = current_function.append_basic_block("printf_block")

        # Create a new IRBuilder for the basic block
        builder = ir.IRBuilder(block)

        # Load the format specifier string
        format_str_const = ir.Constant(ir.ArrayType(ir.IntType(8), len(format_specifier) + 1),
                                       bytearray(format_specifier.encode("utf8")))
        format_str_global = builder.module.globals.get(".str")
        if not format_str_global:
            format_str_global = ir.GlobalVariable(builder.module, format_str_const.type, ".str")
            format_str_global.linkage = "internal"
            format_str_global.global_constant = True
            format_str_global.initializer = format_str_const
        format_str_ptr = builder.bitcast(format_str_global, ir.IntType(8).as_pointer())

        # Create an alloca instruction for each argument
        args_alloca = [builder.alloca(arg.type) for arg in args]

        # Store the arguments in their respective alloca instructions
        for arg_alloca, arg_value in zip(args_alloca, args):
            builder.store(arg_value, arg_alloca)

        # Load the arguments from their respective alloca instructions
        args_values = [format_str_ptr] + [builder.load(arg_alloca) for arg_alloca in args_alloca]

        # Call the printf function
        printf_call = builder.call(printf, args_values)

        # Return the result of the printf call
        return printf_call
