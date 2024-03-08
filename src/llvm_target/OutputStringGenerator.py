from src.llvm_target.LLVMSingleton import LLVMSingleton


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


class Declaration:
    @staticmethod
    def declare(data_type: str, ptrs: str):
        register_nr = LLVMSingleton.getInstance().useRegister()
        out_str = f"%{register_nr} = alloca {CTypesToLLVM.convertType(data_type)}{ptrs}, align {CTypesToLLVM.getBytesUse(data_type, ptrs)}"
        return out_str, register_nr

    @staticmethod
    def function(func_name: str, return_type: str, ptrs: str):
        out_str = f"define dso_local {CTypesToLLVM.convertType(return_type)}{ptrs} @{func_name}() #0 {'{'}"
        return out_str

    @staticmethod
    def assignment(store_register: int, value_register: int, data_type: str, ptrs: str):
        llvm_type = CTypesToLLVM.convertType(data_type)+ptrs
        out_str = f"store {llvm_type} %{value_register}, {llvm_type}* %{store_register}, align {CTypesToLLVM.getBytesUse(data_type, ptrs)}"
        return out_str

    @staticmethod
    def assignmentLiteral(store_register: int, value: str, data_type: str, ptrs: str):
        llvm_type = CTypesToLLVM.convertType(data_type) + ptrs
        out_str = f"store {llvm_type} {value}, {llvm_type}* %{store_register}, align {CTypesToLLVM.getBytesUse(data_type, ptrs)}"
        return out_str


class Load:
    @staticmethod
    def identifier(load_register: int, data_type: str, ptrs: str):
        register_nr = LLVMSingleton.getInstance().useRegister()
        llvm_type = CTypesToLLVM.convertType(data_type)
        out_str = f"%{register_nr} = load {llvm_type}{ptrs}, {llvm_type}{ptrs}* %{load_register}, align {CTypesToLLVM.getBytesUse(data_type, ptrs)}"
        return out_str, register_nr


class Calculation:
    @staticmethod
    def operation(val_1_reg: int, val_2_reg: int, op: str, data_type: str, ptrs: str):
        op_translate = {("+", "i32"): "add nsw",
                        ("-", "i32"): "sub nsw",
                        ("*", "i32"): "mul nsw",
                        ("/", "i32"): "sdiv",
                        ("%", "i32"): "srem",
                        ("+", "i8"): "add nsw",
                        ("-", "i8"): "sub nsw",
                        ("*", "i8"): "mul nsw",
                        ("/", "i8"): "sdiv",
                        ("%", "i8"): "srem",
                        ("+", "float"): "fadd",
                        ("-", "float"): "fsub",
                        ("*", "float"): "fmul",
                        ("/", "float"): "fdiv"
                        }

        register_nr = LLVMSingleton.getInstance().useRegister()
        llvm_type = CTypesToLLVM.convertType(data_type)
        llvm_op = op_translate.get((op, llvm_type), "")
        out_str = f"%{register_nr} = {llvm_op} {llvm_type+ptrs} %{val_1_reg}, %{val_2_reg}"
        return out_str, register_nr