import os
import unittest
import subprocess
import sys
from io import StringIO
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *
import json
"""
Filename Extension Explanation:
- LLVM.ll | Currently generated output
- LLVMtoCompare.ll | File that is right from our perspective ('File we can compare with')
- .ll | The clang generated LLVM file
"""


class ArrayTests(unittest.TestCase):
    """
    Test case to run all created llvm output
    """

    def testArray(self):
        file_range = range(1, 19)
        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        original = sys.stdout  # Temp catch any output
        buff = StringIO()
        sys.stdout = buff

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for i in file_range:
            print(i)
            file_name = f"tests/test{i}.c"

            original_error = sys.stderr  # Temp catch any errors
            error_buff = StringIO()
            sys.stderr = error_buff

            try:
                self.runAST(file_name)
                c_out = self.runC(file_name)

                out = subprocess.run(f"""lli {file_name[:-2]}LLVM.ll""",
                                     shell=True, capture_output=True)

                """
                assert for same output
                """
                #print(i, out.stdout, c_out.stdout)
                #print(out.stderr, c_out.stderr)
                assert out.stdout == c_out.stdout
            except SystemExit as e:
                """
                tests errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(i), []))
                print(errors, expected_errors)
                assert errors == expected_errors

            sys.stderr = original_error

        sys.stdout = original

    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        main([0, "--input", file_name, "--target_llvm", file_name[:-2] + "LLVM.ll"])

    @staticmethod
    def runC(file_name: str):
        out = subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp && ./temp && rm temp""",
                             shell=True, capture_output=True)
        return out
