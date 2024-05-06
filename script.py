from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *
import os


def script():
    directory = os.path.dirname(os.path.abspath(__file__))  # Get directory file is in
    os.chdir(directory)  # Change the dir to only focus on this test
    directory += "/example_source_files"  # Walk through the testfiles

    for file in os.listdir(directory):  # Loop through all files
        file_name = directory+"/"+file+"/"+file

        c = file_name+".c"
        llvm = file_name+"_.ll"
        cfg = file_name+"_cfg.dot"
        ast = file_name+"_ast.dot"
        table = file_name+"_table.dot"

        print(c)
        # Clean singleton
        LLVMSingleton.getInstance().clear()

        # Run our llvm
        try:
            main([0, "--input", c, "--target_llvm", llvm, "--fold", "True", "--render_ast", ast, "--render_symb", table, "--target_control_flow", cfg])  # Run our compiler with folding
        except:
            continue

script()
