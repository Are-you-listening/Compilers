from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir


class CTypesToLLVM:
    @staticmethod
    def convertType(data_type: str):
        convert_map = {"INT": "i32", "CHAR": "i8", "FLOAT": "float"}

        return convert_map.get(data_type, "TYPE ISSUE")

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
                             "==": block.icmp_signed
                             }

        if left.type == "float":
            llvm_op = op_translate_float.get(operator, "")
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
    def unary(val_1_reg: int, op: str, data_type: str, ptrs: str):
        register_nr = LLVMSingleton.getInstance().useRegister()
        llvm_type = CTypesToLLVM.convertType(data_type)

        op_translate_float = {
        }

        op_translate = {"+": "",
                        "-": f"%{register_nr} = sub nsw {llvm_type+ptrs} 0, %{val_1_reg}"
                        }

        if llvm_type == "float":
            out_str = op_translate_float.get(op, "")
        else:
            out_str = op_translate.get(op, "")

        return out_str, register_nr


class Printf:
    @staticmethod
    def printf(format_specifier: str, text: str):
        module = LLVMSingleton.getInstance().getModule()

        printf = ir.Function(module, ir.FunctionType(ir.IntType(32), [ir.IntType(8).as_pointer()], var_arg=True), name="printf")
        block = LLVMSingleton.getInstance().getCurrentBlock()


class Printf:
    @staticmethod
    def printfFormat(formatSpecifier):
        return f"@.str = private unnamed_addr constant [{len(formatSpecifier) + 1} x i8] c\"{formatSpecifier}\\00\", allign 1"

    @staticmethod
    def printfIR():
        register_nr = LLVMSingleton.getInstance().useRegister()
        return f"%{register_nr} = call i32 (i8*, ...) @printf"
