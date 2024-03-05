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
