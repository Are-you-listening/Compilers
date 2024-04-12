import os
import filecmp
import unittest
import sys
import json
from io import StringIO
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *

"""
Filename Extension Explanation:
- temp/output.ll | Currently generated output
- tests/test1.ll | File that is right from our perspective ('File we can compare with')
"""

"""
Test case to create a llvm output for each file and compare it with the corresponding "right" file. Right in the
sense that we pre-set an output we see as valid.

NOTE: All the tests are run with constant folding enabled! (As by default)
"""


class EnumTests(unittest.TestCase):
    def testEnum(self):
        file_range = range(1, 4)
        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        original = sys.stdout  # Temp catch any output
        buff = StringIO()
        sys.stdout = buff

        original_error = sys.stderr # Temp catch any errors
        error_buff = StringIO()
        sys.stderr = error_buff

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for i in file_range:
            file_name = f"tests/test{i}."
            print(file_name)

            try:
                self.runAST(file_name+"c")

                assert self.compareLLVM(file_name+"ll", 'temp/output.ll')  # assert for same output
            except SystemExit as e:
                """
                tests errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(i), []))
                print("error", error_buff.getvalue().splitlines(), i)
                assert errors == expected_errors

        sys.stdout = original  # Reset output
        sys.stderr = original_error

    @staticmethod
    def compareLLVM(newly, right):
        """
        Compare the contents of 2 files
        :param newly:
        :param right:
        :return: True if they are the same
        """
        return filecmp.cmp(newly, right, False)

    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        main([0, "--input", file_name, "--target_llvm", "temp/output.ll"])