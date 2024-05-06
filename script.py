from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *
import os


def script():
    curr_dir = os.path.dirname(os.path.abspath(__file__))# Get directory file is in
    os.chdir(curr_dir)  # Change the dir to only focus on this test
    directory = "./example_source_files"  # Walk through the testfiles

    for file in os.listdir(directory):  # Loop through all files
        if file == "includes":
            continue
        file_name = directory+"/"+file+"/"+file

        c = file_name+".c"
        llvm = file_name+"_.ll"
        cfg = file_name+"_cfg.dot"
        ast = file_name+"_ast.dot"
        table = file_name+"_table.dot"

        # Clear singleton
        LLVMSingleton.getInstance().clear()



        # Run our llvm
        try:
            outfile = open(file_name+".sh", "w")  # Create a .sh file to execute files in the subdirectory
            outfile.write("cd ../../\n")
            outfile.write(f"python3 -m src.main --input {c} --target_llvm {llvm} --fold True --render_ast {ast} --render_symb {table} --target_control_flow {cfg}")
            outfile.close()



            main([0, "--input", f"{curr_dir}{c[1:]}", "--target_llvm", f"{curr_dir}{llvm[1:]}", "--fold", "True", "--render_ast", f"{curr_dir}{ast[1:]}", "--render_symb", f"{curr_dir}{table[1:]}", "--target_control_flow", f"{curr_dir}{cfg[1:]}"])  # Run our compiler with folding
        except:

            """
            Get the index
            """
            index = file[0:2]
            if index[1] == '_':
                index = index[0]

            if "error" not in file_name:
                if index == "in":
                    pass
                if index not in ["51", "6", "13"]:
                    raise Exception("ayayay")

            continue

script()
