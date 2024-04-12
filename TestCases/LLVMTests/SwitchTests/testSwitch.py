import os
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


class SwitchTests(unittest.TestCase):
    """
    Test case to run all created llvm output
    """
    def testSimpleSwitch(self):
        file_range = range(1, 6)
        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        for i in file_range:
            #print(i)
            file_name = f"tests/test{i}.c"
            self.runAST(file_name)
            c_out = self.runC(file_name)

            out = subprocess.run(f"""lli {file_name[:-2]}LLVM.ll""",
                                 shell=True, capture_output=True)

            """
            assert for same output
            """
            #print(out.stdout, c_out.stdout)
            #print(out.stderr, c_out.stderr)
            assert out.stdout == c_out.stdout

            """
            asser for no error
            """
            assert out.stderr == c_out.stderr

    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        main([0, "--input", file_name,
              "--target_llvm", file_name[:-2] + "LLVM.ll"])

        subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                       shell=True, capture_output=True)

    @staticmethod
    def runC(file_name: str):
        out = subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp && ./temp && rm temp""",
                             shell=True, capture_output=True)
        return out
