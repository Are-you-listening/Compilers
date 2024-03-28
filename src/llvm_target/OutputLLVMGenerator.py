from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir
import sys

"""
This line is not because our lack of capabilities to avoid recursions, this line exist because LLVMLite itself
uses recursions 
"""
sys.setrecursionlimit(10000000)


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
        return llvm_var

    @staticmethod
    def Incr(llvm_var):
        if llvm_var.type.is_pointer:
            llvm_var = Calculation.operation(llvm_var, ir.Constant(ir.IntType(64), 1), "+")
        else:
            llvm_var = Calculation.operation(llvm_var, ir.Constant(llvm_var.type, 1), "+")
        return llvm_var

    @staticmethod
    def Decr(llvm_var):
        if llvm_var.type.is_pointer:
            llvm_var = Calculation.operation(llvm_var, ir.Constant(ir.IntType(64), 1), "-")
        else:
            llvm_var = Calculation.operation(llvm_var, ir.Constant(llvm_var.type, 1), "-")
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

        """
        assignment
        :param store_register:
        :param value:
        :param align:
        :return:
        """

        block = LLVMSingleton.getInstance().getCurrentBlock()
        llvm_val = block.store(value, store_register)

        llvm_val.align = align
        return llvm_val

    @staticmethod
    def llvmLiteral(value: str, data_type: str, ptrs: str):
        if CTypesToLLVM.getIRType(data_type, ptrs) == ir.FloatType():
            value = float(value)
        elif CTypesToLLVM.getIRType(data_type, ptrs) == ir.IntType(32):
            value = int(value)
        elif CTypesToLLVM.getIRType(data_type, ptrs) == ir.IntType(8):

            """
            removes "'" before and after character
            """
            value = value[1:-1]

            """
            support right interpretation special characters like \n
            """
            value = value.encode('utf-8').decode('unicode-escape')

            value = ord(value)  # Values are strings

        return ir.Constant(CTypesToLLVM.getIRType(data_type, ptrs), value)

    @staticmethod
    def addComment(text: str):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        text = text.replace("\n","")  # Comments in LLVM cannot contain new lines
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

        op_translate_fcmp_float = {"<": block.fcmp_ordered,
                              ">": block.fcmp_ordered,
                              "==": block.fcmp_ordered,
                              "!=": block.fcmp_ordered,
                              "<=": block.fcmp_ordered,
                              ">=": block.fcmp_ordered
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
            llvm_op = op_translate_float.get(operator, None)

            """
            In case the operation is float specific execute it, if not check with other operations
            """
            if llvm_op is not None:
                llvm_var = llvm_op(left, right)
                return llvm_var

            llvm_op = op_translate_fcmp_float.get(operator, None)
            if llvm_op is not None:
                llvm_var = llvm_op(operator, left, right)
                return llvm_var


        if left.type.is_pointer and operator in ["+", "-"]:
            if not isinstance(right,
                              ir.Constant):  # If it is not a constant, LLVM requires a sign extend to match the size
                right = block.sext(right, ir.IntType(64))

            if operator == "-":  # Add subtract
                right = Calculation.unary(right, "-")

            new_value = block.gep(left, [right], True)  # Create the gep instruction

            return new_value

        """
        check normal operations
        """
        llvm_op = op_translate.get(operator, None)

        if llvm_op is not None:
            llvm_var = llvm_op(left, right)

            return llvm_var

        llvm_op = op_translate_icmp.get(operator, None)

        llvm_var = llvm_op(operator, left, right)

        return llvm_var


    @staticmethod
    def unary(llvm_val, op: str):

        op_translate_float = {"-": UnaryWrapper.fNeg,
                              "+": UnaryWrapper.Plus,
                              "++": UnaryWrapper.Incr,
                              "--": UnaryWrapper.Decr
                              }

        op_translate = {"-": UnaryWrapper.Min,
                        "+": UnaryWrapper.Plus,
                        "~": UnaryWrapper.BitNot,
                        "!": UnaryWrapper.LogicalNot,
                        "++": UnaryWrapper.Incr,
                        "--": UnaryWrapper.Decr
                        }

        if llvm_val.type == ir.FloatType():
            llvm_op = op_translate_float.get(op, None)
        # elif llvm_val.type
        else:
            llvm_op = op_translate.get(op, None)

        llvm_var = llvm_op(llvm_val)
        return llvm_var


class Printf:
    @staticmethod
    def printf(format_specifier: str, *args):
        base_format = format_specifier[format_specifier.index("%"):format_specifier.index("%")+2]

        if LLVMSingleton.getInstance().getPrintF() is None:
            module = LLVMSingleton.getInstance().getModule()
            voidptr_ty = ir.IntType(8).as_pointer()
            printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
            printf = ir.Function(module, printf_ty, name="printf")
            LLVMSingleton.getInstance().setPrintF(printf)

        format_specifier+='\00'
        builder = LLVMSingleton.getInstance().getCurrentBlock()
        format_str_const = ir.Constant(ir.ArrayType(ir.IntType(8), len(format_specifier)),
                                       bytearray(format_specifier.encode("utf8")))
        format_str_global = builder.module.globals.get(f".str.{base_format[1:]}")

        if not format_str_global:
            format_str_global = ir.GlobalVariable(builder.module, format_str_const.type, f".str.{base_format[1:]}")
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

        args_values = [format_str_ptr] + [Printf.__reformat(base_format, builder.load(arg_alloca)) for arg_alloca in args_alloca]
        printf_call = builder.call(LLVMSingleton.getInstance().getPrintF(), args_values)

        return printf_call

    @staticmethod
    def __reformat(base_format: str, llvm_var):
        """
        for certain formats we need to do a conversion

        :param base_format: format we use to print
        :param llvm_var:
        :return:
        """
        builder = LLVMSingleton.getInstance().getCurrentBlock()

        if base_format == "%f":
            return builder.fpext(llvm_var, ir.DoubleType())

        return llvm_var


class Conversion:
    @staticmethod
    def performConversion(llvm_var, to_type):
        native_type = to_type[0]
        ptrs = to_type[1]

        block = LLVMSingleton.getInstance().getCurrentBlock()  # Get the current block

        """
        dict we use to retrieve which conversion command to call
        """

        conversion_dict = {(ir.IntType, "FLOAT"): lambda x, x_to: block.sitofp(x, x_to),
                           (ir.FloatType, "INT"): lambda x, x_to: block.fptosi(x, x_to),
                           (ir.IntType, "CHAR"): lambda x, x_to: block.trunc(x, x_to),
                           (ir.FloatType, "CHAR"): lambda x, x_to: block.zext(x, x_to),
                           (ir.IntType, "INT"): lambda x, x_to: block.zext(x, x_to),
                           (ir.IntType, "PTR"): lambda x, x_to: block.inttoptr(x, x_to),
                           (ir.FloatType, "PTR"): lambda x, x_to: block.inttoptr(x, x_to),
                           (ir.IntType, "BOOL"): lambda x, x_to: block.icmp_signed("!=", x, ir.Constant(x.type, 0)),
                           (ir.FloatType, "BOOL"): lambda x, x_to: block.icmp_signed("!=", x, ir.Constant(x.type, 0)),
                           (ir.PointerType, "INT"): lambda x, x_to: block.ptrtoint(x, x_to),
                           (ir.PointerType, "CHAR"): lambda x, x_to: block.ptrtoint(x, x_to),
                           (ir.PointerType, "PTR"): lambda x, x_to: block.bitcast(x, x_to)}

        llvm_to_type = CTypesToLLVM.getIRType(native_type, ptrs)

        """
        make a simplified to type for checking the conversion dict
        """
        simplified_to_type = native_type
        if len(ptrs) > 0:
            simplified_to_type = "PTR"

        c = conversion_dict.get((type(llvm_var.type), simplified_to_type))
        llvm_var = c(llvm_var, llvm_to_type)
        return llvm_var