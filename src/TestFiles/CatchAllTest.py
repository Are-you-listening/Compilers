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
        # Specify filenames we don't want to run
        if file_name in ["testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c"]:
            return

        # Specify filenames with syntaxt errors
        if file_name in ["testfiles/basic_tests_123/proj2_man_syntaxErr_invalidPointerDeclaration2.c","testfiles/basic_tests_123/proj2_man_syntaxErr_variable.c","testfiles/basic_tests_123/proj2_man_syntaxErr_pointerOperations2.c"
                         ,"testfiles/basic_tests_123/proj2_man_semanticErr_redeclaration.c"]:
            return

        subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                             shell=True, capture_output=True)
        main([0, "--input", file_name, "--render_ast", file_name[:-2]+"ASTVisual", "--render_symb", file_name[:-2]+"SymbolTable",
              "--target_llvm", file_name[:-2] + "LLVM.ll"], True)



