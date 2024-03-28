from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *

for i in range(1, 13):
    file_name = f"example_source_files/test{i}"
    LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service


    try:
        main([0, "--input", file_name+'.c', "--target_llvm", file_name+'.ll', "--render_symb", file_name+'table.dot', "--render_ast", file_name+'ast.dot'])
    except Exception as e:
        print(e)
        print(e.args)
