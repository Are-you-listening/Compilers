import unittest
from src.main.__main__ import main
import os
import sys
import logging
import subprocess
from src.llvm_target.LLVMSingleton import *


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

        LLVMSingleton.getInstance().clear()

        # Specify filenames we don't want to run for now
        if file_name in [""]:
            return

        if file_name.startswith("testfiles/ownTests/proj1"):
            return

        # Specify filenames with syntaxt errors
        if file_name in ["testfiles/basic_tests_123/proj2_man_syntaxErr_invalidPointerDeclaration2.c","testfiles/basic_tests_123/proj2_man_syntaxErr_variable.c","testfiles/basic_tests_123/proj2_man_syntaxErr_pointerOperations2.c"
                         ,"testfiles/basic_tests_123/proj2_man_semanticErr_redeclaration.c", "testfiles/ownTests/proj2_horror1.c"]:
            return

        out = subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                             shell=True, capture_output=True)


        valid = True

        try:
            main([0, "--input", file_name, "--render_ast", file_name[:-2]+"ASTVisual", "--render_symb", file_name[
                                                                                                        :-2] + "SymbolTable",
                                                                         "--target_llvm", file_name[:-2] + "LLVM.ll"], True)

            if len(out.stderr) >= 1:
                valid = False

        except:

            if len(out.stderr) == 0:
                valid = False

        if not valid:
            exit(1)





