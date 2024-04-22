import subprocess
import unittest
from io import StringIO
import json
import os
import sys
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *

"""
Filename Extension Explanation:
- .ll | Currently generated output
"""


class StringTests(unittest.TestCase):
    """
    Test case to run all created llvm output
    """
    def testString(self):
        file_range = range(1, 7)
        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for i in file_range:
            #print(i)
            file_name = f"tests/test{i}.c"

            """
            make print buff
            """

            original = sys.stdout
            buff = StringIO()
            sys.stdout = buff

            original_error = sys.stderr
            error_buff = StringIO()
            sys.stderr = error_buff

            try:
                self.runAST(file_name)
                c_out = self.runC(file_name)

                out = subprocess.run(f"""lli {file_name[:-2]}.ll""",
                                     shell=True, capture_output=True)

                """
                assert for same output
                """
                assert out.stdout == c_out.stdout

                """
                asser for no error
                """
                assert out.stderr == c_out.stderr
            except:
                """
                tests errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(i), []))
                print("error", error_buff.getvalue().splitlines(), i)
                assert errors == expected_errors

            sys.stdout = original
            sys.stderr = original_error

    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        main([0, "--input", file_name, "--target_llvm", file_name[:-2] + ".ll"])

    @staticmethod
    def runC(file_name: str):
        out = subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp && ./temp && rm temp""",
                             shell=True, capture_output=True)
        return out
