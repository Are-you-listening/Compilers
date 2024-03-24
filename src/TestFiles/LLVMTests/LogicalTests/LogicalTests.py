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


class PrintTests(unittest.TestCase):
    """
    Test case to run all created llvm output
    """
    def testSimplePrints(self):
        file_range = range(1, 15)
        for i in file_range:

            file_name = f"tests/test{i}.c"
            self.runAST(file_name)
            c_out = self.runC(file_name)

            out = subprocess.run(f"""lli {file_name[:-2]}LLVM.ll""",
                                 shell=True, capture_output=True)

            """
            assert for same output
            """
            print(i, out.stdout, c_out.stdout)
            print(out.stderr)
            assert out.stdout == c_out.stdout


    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb",
              file_name[:-2] + "SymbolTable",
              "--target_llvm", file_name[:-2] + "LLVM.ll"], False)

        subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                       shell=True, capture_output=True)

    @staticmethod
    def runC(file_name: str):
        out = subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp && ./temp && rm temp""",
                             shell=True, capture_output=True)
        return out
