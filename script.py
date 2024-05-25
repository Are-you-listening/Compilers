from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *
import os
import subprocess

from src.mips_target.MipsLibrary import MipsManager, RegisterManager
from src.mips_target.MipsSingleton import MipsSingleton


def script():
    curr_dir = os.path.dirname(os.path.abspath(__file__))  # Get directory file is in
    os.chdir(curr_dir)  # Change the dir to only focus on this tests
    directory = "./example_source_files"  # Walk through the testfiles

    for file in os.listdir(directory):  # Loop through all files
        if file == "includes":
            continue
        file_name = directory+"/"+file+"/"+file
        working_dir = directory+"/"+file

        c = file_name+".c"
        llvm = file_name+"_.ll"
        mips = file_name+"_.asm"
        cfg = file_name+"_cfg.dot"
        ast = file_name+"_ast.dot"
        table = file_name+"_table.dot"

        # Clear singleton
        LLVMSingleton.getInstance().clear()
        MipsSingleton.getInstance().clear()
        MipsManager.getInstance().clear()
        RegisterManager.getInstance().clear()

        unused_var = "False"
        if file_name.endswith("56_unused_variables"):
            unused_var = "True"

        for old in os.listdir(working_dir):  # List all files for a specific example dir
            if not old.endswith(".c"):  # Ignore the test file
                os.chdir(working_dir)  # Cd to the specific example dir
                if os.path.isfile(old):  # Double check file exists
                     os.remove(old)  # Remove old file
                os.chdir("../../")  # Cd back

        try:
            outfile = open(file_name+".sh", "w")  # Create a .sh file to execute files in the subdirectory
            outfile.write("cd ../../\n")
            outfile.write(f"python3 -m src.main --input {c} --target_llvm {llvm} --target_mips {mips} --fold True --render_ast {ast} --render_symb {table} --target_control_flow {cfg} --unused_var {unused_var}")
            outfile.close()

            cfg_target = f"{curr_dir}{cfg[1:]}"
            if file_name == "./example_source_files/46_unions/46_unions":
                cfg_target = ""

            main([0, "--input", f"{curr_dir}{c[1:]}", "--target_llvm", f"{curr_dir}{llvm[1:]}", "--target_mips", f"{curr_dir}{mips[1:]}", "--fold", "True", "--render_ast", f"{curr_dir}{ast[1:]}", "--render_symb", f"{curr_dir}{table[1:]}", "--target_control_flow", cfg_target, "--unused_var", unused_var])  # Run our compiler with folding

            outfile = open(file_name+".sh", "a")  # Create a .sh file to execute files in the subdirectory
            outfile.write(f"\n spim -file {mips}")
            outfile.close()
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
            continue

script()
