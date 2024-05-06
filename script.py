from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *
import os


def script():
    directory = os.path.dirname(os.path.abspath(__file__))  # Get directory file is in
    os.chdir(directory)  # Change the dir to only focus on this test
    directory += "/example_source_files"  # Walk through the testfiles

    print(directory)

    for file in os.listdir(directory):  # Loop through all files
        if os.path.splitext(file)[-1] != '.c':  # We only run c files
            continue

        print(file)

            #LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

            # Run our llvm
            #main([0, "--input", file_name, "--target_llvm", f"{file_name[:-2]}.ll", "--fold", "True"])  # Run our compiler with folding

script()
