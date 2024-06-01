import llvmlite.ir.types
from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir
import sys
from src.parser.Tables.SymbolType import SymbolType
from src.parser.Tables.SymbolTypePtr import SymbolTypePtr
from src.parser.Tables.SymbolTypeArray import SymbolTypeArray
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType
import math
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
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
        if isinstance(llvm_type, ir.PointerType):
            sub_bool = block.icmp_signed("!=", llvm_var, ir.Constant(llvm_type, None))  # Ptr expect 'null' instead of '0'
        else:
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
    def getBytesUse(data_type: SymbolType):

        byte_amount = data_type.getBytesUsed()
        exp = math.ceil(math.log2(byte_amount))
        byte_amount = 2**exp

        return byte_amount

    @staticmethod
    def getIRType(data_type: SymbolType, function_type=False):
        """
        :param data_type:
        :param function_type: When true we will translate our type to ptrs instead of arrays when we have an array
        :return:
        """
        if isinstance(data_type, FunctionSymbolType):
            return_llvm = CTypesToLLVM.getIRType(data_type.return_type)

            param_llvm = []
            for param in data_type.getParameterTypes():
                param_llvm.append(CTypesToLLVM.getIRType(param))

            llvm_type = ir.types.FunctionType(return_llvm, param_llvm)
            return llvm_type

        if isinstance(data_type, SymbolTypeStruct):

            """
            Exception for FILE support
            """
            if data_type.getBaseType() == "_IO_FILE":
                context = LLVMSingleton.getInstance().getModule().context

                struct_type = context.get_identified_type("_IO_FILE")
                return struct_type

            llvm_type = Declaration.makeStructType(data_type)
            return llvm_type

        if isinstance(data_type, SymbolTypePtr):
            llvm_type = CTypesToLLVM.getIRType(data_type.deReference(), function_type)

            if isinstance(data_type, SymbolTypeArray):
                llvm_type = ir.ArrayType(llvm_type, data_type.size)
            else:
                llvm_type = ir.PointerType(llvm_type)

            return llvm_type

        convert_map = {"INT": ir.IntType(32), "CHAR": ir.IntType(8), "FLOAT": ir.FloatType(), "BOOL": ir.IntType(1), "VOID": ir.VoidType()}
        llvm_type = convert_map.get(data_type.getBaseType())

        if llvm_type is None:  # Most likely, a struct was used
            return None

        return llvm_type


class Declaration:
    @staticmethod
    def declare(data_type: SymbolType, var_name: str):
        block = LLVMSingleton.getInstance().getCurrentBlock()

        irType = CTypesToLLVM.getIRType(data_type)

        if irType is None:
            if isinstance(data_type, SymbolTypeStruct):  # Declara a struct type
                return Declaration.struct(data_type, var_name)
            else:  # Declara a ptr to a struct type
                return Declaration.struct_ptr(data_type)

        llvm_val = block.alloca(irType)
        llvm_val.align = CTypesToLLVM.getBytesUse(data_type)

        return llvm_val

    @staticmethod
    def IdentifiedStructIO():
        """
        Create the identified structs for I/O operations
        :return:
        """
        context = LLVMSingleton.getInstance().getModule().context

        struct_type = context.get_identified_type("my_struct")

        struct_type.set_body(ir.IntType(32), ir.FloatType())

    @staticmethod
    def makeStructType(symbol_type: SymbolTypeStruct):
        context = LLVMSingleton.getInstance().getModule().context

        if symbol_type.data_type in context.identified_types.keys():
            return context.get_identified_type(symbol_type.data_type)

        struct_type = context.get_identified_type(symbol_type.data_type)

        types = []
        align = 0

        data_type = TypeNodeHandler.getInstance().struct_param[symbol_type.data_type]

        if isinstance(symbol_type, SymbolTypeUnion):
            data_type = [symbol_type.getStoreType().deReference()]

        for d in data_type:
            irType = CTypesToLLVM.getIRType(d)
            align += CTypesToLLVM.getBytesUse(d)
            types.append(irType)

        struct_type.elements = tuple(types)

        return struct_type


    @staticmethod
    def struct_ptr(data_type: SymbolType):
        """
        Create a ptr to a struct
        :param data_type:
        :return:
        """
        block = LLVMSingleton.getInstance().getCurrentBlock()

        struct_type = LLVMSingleton.getInstance().getStruct(data_type.getPtrTuple()[0][0])

        struct_ptr = ir.PointerType(struct_type)
        for i in range(1, data_type.getPtrAmount()):  # If we point to a struct ptr, the struct_ptr needs to be extended
            struct_ptr = ir.PointerType(struct_ptr)

        llvm_var = block.alloca(struct_ptr)
        llvm_var.align = 8
        return llvm_var

    @staticmethod
    def struct(data_type: SymbolTypeStruct, var_name: str):
        """
        Create a global struct type
        :param var_name:
        :param data_type:
        :return:
        """
        block = LLVMSingleton.getInstance().getCurrentBlock()
        types = []
        align = 0

        struct_name = data_type.getPtrTuple()[0][0]

        struct_type = Declaration.makeStructType(data_type)
        LLVMSingleton.getInstance().addStruct(struct_name, struct_type)
        # if LLVMSingleton.getInstance().getModule().globals.get(data_type[0]) is None:
        #     struct = ir.GlobalVariable(LLVMSingleton.getInstance().getModule(), struct_type, data_type[0])
        #     struct.align = align


        llvm_var = block.alloca(struct_type)
        llvm_var.align = max(align % 2, (align+1) % 2)  # In LLVM align must be a power of 2
        return llvm_var

    @staticmethod
    def function(func_name: str, return_type: SymbolType, args: list):
        """
        change the current latest function
        """
        llvmArgs = []
        for arg in args:
            arg_type = CTypesToLLVM.getIRType(arg)
            llvmArgs.append(arg_type)
        function_type = ir.FunctionType(CTypesToLLVM.getIRType(return_type), (llvmArgs))
        new_function = ir.Function(LLVMSingleton.getInstance().getModule(), function_type, name=func_name)
        LLVMSingleton.getInstance().addFunction(new_function)

        return new_function

    @staticmethod
    def assignment(store_register: ir.Instruction, value: ir.Instruction, align: int):
        """
        assignment
        :param store_register:
        :param value:
        :param align:
        :return:
        """

        block = LLVMSingleton.getInstance().getCurrentBlock()

        """
        In case we have an array of a string and we use its pointer, we want to add another bit cast
        """

        if store_register.type.is_pointer and value.type.is_pointer and \
                isinstance(value.type.pointee, ir.types.ArrayType):

            if isinstance(store_register.type.pointee, ir.IntType):
                """
                Following the clang reference, we h=give a weird constant this these kind of situations
                """
                value = ir.Constant(ir.IntType(8), 79)

            value = block.bitcast(value, store_register.type.pointee)

        if store_register.type.is_pointer and value.type.is_pointer and value.type.pointee is None:
            value = block.bitcast(value, store_register.type.pointee)

        llvm_val = block.store(value, store_register)

        llvm_val.align = align
        return llvm_val

    @staticmethod
    def llvmLiteral(value: str, data_type: SymbolType):
        if CTypesToLLVM.getIRType(data_type) == ir.FloatType():
            value = float(value)
        elif CTypesToLLVM.getIRType(data_type) == ir.IntType(32):
            value = int(value)
        elif CTypesToLLVM.getIRType(data_type) == ir.IntType(8):
            """
            removes "'" before and after character
            """
            value = value[1:-1]
            """
            support right interpretation special characters like \n
            """
            if len(value) != 1:
                value = value.encode('utf-8').decode('unicode-escape')

            value = ord(value)  # Values are strings

        return ir.Constant(CTypesToLLVM.getIRType(data_type), value)

    @staticmethod
    def addComment(text: str):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        text = text.replace("\n", "")  # Comments in LLVM cannot contain new lines
        block.comment(text)


def string(text: str):
    """
    Create LLVM strings
    """

    """
    Support escape characters
    """
    text = text.encode('utf-8').decode('unicode-escape')

    index = LLVMSingleton.getInstance().getStringIndex(text)
    format_str_const = ir.Constant(ir.ArrayType(ir.IntType(8), len(text)),
                                   bytearray(text.encode("utf8")))

    format_str_global = LLVMSingleton.getInstance().getModule().globals.get(f".str.{index}")

    if not format_str_global:
        format_str_global = ir.GlobalVariable(LLVMSingleton.getInstance().getModule(), format_str_const.type, f".str.{index}")
        format_str_global.linkage = "internal"
        format_str_global.global_constant = True
        format_str_global.initializer = format_str_const

    return format_str_global


def initList(entry_bef, node):
    entry = entry_bef.deReference()
    elements = []
    for child in node.children:
        if child.text == "InitList":
            llvm_element = initList(entry, child)
        else:
            text = child.text
            if child.type == "CHAR":
                text = ord(child.text[1:-1])

            llvm_element = ir.Constant(CTypesToLLVM.getIRType(entry), text)
        elements.append(llvm_element)

    return ir.Constant(CTypesToLLVM.getIRType(entry_bef), elements)


class Load:
    @staticmethod
    def identifier(load_llvm):
        block = LLVMSingleton.getInstance().getCurrentBlock()

        if isinstance(load_llvm.type.pointee, ir.types.ArrayType):
            index_list = []
            index_list.insert(0, ir.Constant(ir.types.IntType(32), 0))
            index_list.insert(0, ir.Constant(ir.types.IntType(32), 0))

            llvm_var = block.gep(load_llvm, index_list, True)  # Create the gep instruction
        else:
            llvm_var = block.load(load_llvm)

        if isinstance(load_llvm, ir.Function):
            llvm_var.align = 8
        elif not isinstance(load_llvm, ir.GEPInstr) and not isinstance(load_llvm, ir.CastInstr) and not isinstance(load_llvm, ir.CallInstr):
            llvm_var.align = load_llvm.align
        else:
            llvm_var.align = CTypesToLLVM.getBytesUse(SymbolType("INT", False))
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

        op_translate_fcmp_float = {"<": block.fcmp_ordered, ">": block.fcmp_ordered, "==": block.fcmp_ordered, "!=": block.fcmp_ordered, "<=": block.fcmp_ordered, ">=": block.fcmp_ordered}

        op_translate = {"+": block.add,
                        "-": block.sub,
                        "*": block.mul,
                        "/": block.sdiv,
                        "%": block.srem,
                        "<<": block.shl,
                        ">>": block.ashr,
                        "&": block.and_,
                        "|": block.or_,
                        "^": block.xor,
                        "()": block.call
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
        pointer = None
        non_pointer = None
        if isinstance(left.type, ir.types.PointerType) and operator in ["+", "-", "[]"]:
            pointer = left
            non_pointer = right
        if right is not None and not isinstance(right, list) and isinstance(right.type, ir.types.PointerType) and operator in ["+", "-", "[]"]:
            pointer = right
            non_pointer = left
            """
            operator '[]' is for access of arrays. We can access an array using a GetElementPointer
            """
        if pointer is not None or non_pointer is not None and operator in ["+", "-", "[]"]:
            if not isinstance(non_pointer,
                              ir.Constant):  # If it is not a constant, LLVM requires a sign extend to match the size
                if isinstance(non_pointer.type, ir.PointerType):
                    non_pointer = block.ptrtoint(non_pointer, ir.IntType(64))
                else:
                    non_pointer = block.sext(non_pointer, ir.IntType(64))

            if operator == "-":  # Add subtract
                non_pointer = Calculation.unary(non_pointer, "-")

            index_list = [non_pointer]

            """
            When we come across an array we need to define a value 0 followed by the index we want to access
            """
            #print(type(pointer.type.pointee))
            if isinstance(pointer.type.pointee, ir.ArrayType) and operator == "[]":
                index_list.insert(0, ir.Constant(ir.types.IntType(64), 0))
            elif (isinstance(pointer.type.pointee, ir.LiteralStructType) or isinstance(pointer.type.pointee, ir.IdentifiedStructType)) and operator == "[]":
                index_list.insert(0, ir.Constant(ir.types.IntType(32), 0))
            elif operator == "[]":
                pointer = block.load(pointer)

            new_value = block.gep(pointer, index_list, True)  # Create the gep instruction

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
    def printf(format_specifier: ir.Constant, *args):
        """
        :param format_specifier:
        :param args:
        :return:
        """
        if LLVMSingleton.getInstance().getPrintF() is None:
            module = LLVMSingleton.getInstance().getModule()
            voidptr_ty = ir.IntType(8).as_pointer()
            printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
            printf = ir.Function(module, printf_ty, name="printf")
            LLVMSingleton.getInstance().setPrintF(printf)

        builder = LLVMSingleton.getInstance().getCurrentBlock()
        args_values = Printf.makeArguments(format_specifier, args)
        printf_call = builder.call(LLVMSingleton.getInstance().getPrintF(), args_values)

        return printf_call

    @staticmethod
    def __reformat(llvm_var):
        """
        for certain formats we need to do a conversion

        :param llvm_var: Variable to check
        :return:
        """
        builder = LLVMSingleton.getInstance().getCurrentBlock()

        if isinstance(llvm_var.type, llvmlite.ir.types.FloatType):  # Floats need to be converted to doubles under the hood
            return builder.fpext(llvm_var, ir.DoubleType())

        return llvm_var

    @staticmethod
    def makeArguments(format_specifier: ir.Constant, args):
        builder = LLVMSingleton.getInstance().getCurrentBlock()
        format_str_ptr = builder.bitcast(format_specifier, ir.IntType(8).as_pointer())

        """
        Create an alloca instruction for each argument
        """
        args_alloca = [builder.alloca(arg.type) for arg in args]

        """
        Store the arguments in their respective alloca instructions
        """
        for arg_alloca, arg_value in zip(args_alloca, args):
            s = builder.store(arg_value, arg_alloca)

        """ 
        Load the arguments from their respective alloca instructions 
        """
        args_values = [format_str_ptr] + [Printf.__reformat(builder.load(arg_alloca)) for arg_alloca in args_alloca]

        return args_values


class Scanf(Printf):
    @staticmethod
    def scanf(format_specifier: str, *args):
        """
        :param format_specifier:
        :param args:
        :return:
        """
        if LLVMSingleton.getInstance().getScanF() is None:  # Make sure the function is added hardcoded
            module = LLVMSingleton.getInstance().getModule()
            voidptr_ty = ir.IntType(8).as_pointer()
            scanf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
            scanf = ir.Function(module, scanf_ty, name="scanf")
            LLVMSingleton.getInstance().setScanF(scanf)

        builder = LLVMSingleton.getInstance().getCurrentBlock()
        args_values = Printf.makeArguments(format_specifier, args)
        scanf_call = builder.call(LLVMSingleton.getInstance().getScanF(), args_values)

        return scanf_call


class Conversion:

    @staticmethod
    def intToInt(x: ir.Instruction, x_to: ir.types):
        block = LLVMSingleton.getInstance().getCurrentBlock()
        if x.type.width == 8 and x_to.width == 32:
            v = block.sext(x, x_to)
        else:
            v = block.zext(x, x_to)
        return v

    @staticmethod
    def performConversion(llvm_var, to_type: SymbolType):

        block = LLVMSingleton.getInstance().getCurrentBlock()  # Get the current block

        """
        dict we use to retrieve which conversion command to call
        """
        conversion_dict = {(ir.IntType, "FLOAT"): lambda x, x_to: block.sitofp(x, x_to),
                           (ir.FloatType, "INT"): lambda x, x_to: block.fptosi(x, x_to),
                           (ir.IntType, "CHAR"): lambda x, x_to: block.trunc(x, x_to),
                           (ir.FloatType, "CHAR"): lambda x, x_to: block.fptosi(x, x_to),
                           (ir.IntType, "INT"): lambda x, x_to: Conversion.intToInt(x, x_to),
                           (ir.IntType, "PTR"): lambda x, x_to: block.inttoptr(x, x_to),
                           (ir.FloatType, "PTR"): lambda x, x_to: block.inttoptr(x, x_to),
                           (ir.IntType, "BOOL"): lambda x, x_to: block.icmp_signed("!=", x, ir.Constant(x.type, 0)),
                           (ir.FloatType, "BOOL"): lambda x, x_to: block.icmp_signed("!=", x, ir.Constant(x.type, 0)),
                           (ir.PointerType, "INT"): lambda x, x_to: block.ptrtoint(x, x_to),
                           (ir.PointerType, "CHAR"): lambda x, x_to: block.ptrtoint(x, x_to),
                           (ir.PointerType, "PTR"): lambda x, x_to: block.bitcast(x, x_to),
                           (ir.IntType, "ARRAY"): lambda x, x_to: block.bitcast(x, x_to),
                           (ir.PointerType, "BOOL"): lambda x, x_to: block.icmp_signed("!=", x, ir.Constant(x.type, None))

                           }  # todo add ptr/toint bool

        llvm_to_type = CTypesToLLVM.getIRType(to_type)

        """
        make a simplified to type for checking the conversion dict
        """
        simplified_to_type = to_type.getBaseType()
        if to_type.getPtrAmount() > 0:
            if isinstance(to_type, SymbolTypeArray):
                simplified_to_type = "ARRAY"
            else:
                simplified_to_type = "PTR"

        c = conversion_dict.get((type(llvm_var.type), simplified_to_type))
        llvm_var = c(llvm_var, llvm_to_type)

        return llvm_var
