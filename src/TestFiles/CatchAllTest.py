import unittest
from src.main.__main__ import main
import os
import sys
import logging
import subprocess


class CatchAllTest(unittest.TestCase):
    def testEvaluateResults(self):
        """
        This testcase will run all tests
        :return:
        """

        path = "testfiles/"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith(".c"):
                    print(root + "/" + file)
                    self.runAST(root + "/" + file)



    def runAST(self, file_name):
        if file_name in ["testfiles/basic_tests_123/proj2_man_pass_pointerReassignment.c"]:
            return
        subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                             shell=True, capture_output=True)
        main([0, "--input", file_name, "--render_ast", file_name[:-2]+"ASTVisual", "--render_symb", file_name[:-2]+"SymbolTable",
              "--target_llvm", file_name[:-2] + "LLVM.ll"], True)



