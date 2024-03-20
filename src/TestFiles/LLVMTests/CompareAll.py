import os
import filecmp
import unittest
import subprocess
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *

"""
Filename Extension Explanation:
- LLVM.ll | Currently generated output
- LLVMtoCompare.ll | File that is right from our perspective ('File we can compare with')
- .ll | The clang generated LLVM file
"""


class CompareAll(unittest.TestCase):
    """
    Test case to create a llvm output for each file and compare it with the corresponding "right" file. Right in the
    sense that we pre-set an output we see as valid.

    NOTE: All the tests are run with constant folding enabled! (As by default)
    """
    def testEvaluateResults(self):
        path = "testfiles/"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith(".c") and "syntaxErr" not in file and "semanticErr" not in file:  # Error files will
                    # be ignored
                    filename = root + "/" + file
                    print(filename)

                    # if filename in ["testfiles/basic_tests_123/proj2_man_pass_conversionExplicitTypeCast.c","testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c","testfiles/basic_tests_123/proj2_opt_pass_constPointerToNonConstPointer1.c","testfiles/basic_tests_123/proj2_opt_pass_constPointerToNonConstPointer2.c","testfiles/basic_tests_123/proj2_man_pass_conversionImplicit.c"]:
                    #     continue
                    if filename.startswith("testfiles/advanced_tests/"):
                        continue

                    if self.runAST(filename):
                        assert self.compareLLVM(filename[:-2] + "LLVMtoCompare.ll", filename[:-2]+"LLVM.ll")

    @staticmethod
    def createEmptyLLVMFile(filename):
        """
        :param filename:
        :return:
        """
        filename = filename[:-2] + "LLVMtoCompare.ll"
        with open(filename, 'w'):
            pass

    @staticmethod
    def compareLLVM(newly, right):
        """
        Compare the contents of 2 files
        :param newly:
        :param right:
        :return: True if they are the same
        """
        return filecmp.cmp(newly, right,False)

    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        try:  # This test ignores thrown errors
            # Create LLVM file
            main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb", file_name[:-2] + "SymbolTable",
                  "--target_llvm", file_name[:-2] + "LLVM.ll",], False)

            subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                                 shell=True, capture_output=True)
            return True
        except:
            return False
