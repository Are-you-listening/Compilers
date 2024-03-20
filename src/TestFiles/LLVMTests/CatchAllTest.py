import filecmp
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
        This testcase will run all files in the testfiles/ folder
        :return:
        """

        path = "testfiles/"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith(".c"):
                    filename = root + "/" + file
                    print(filename)
                    self.runAST(filename)



    def runAST(self, file_name):

        LLVMSingleton.getInstance().clear()

        # Specify filenames we don't want to run for now
        if file_name in ["testfiles/basic_tests_123/proj2_man_pass_conversionExplicitTypeCast.c"]:
            return

        if file_name.startswith("testfiles/ownTests/proj1"):
            return

        # Specify filenames with syntaxt errors
        if file_name in ["testfiles/basic_tests_123/proj2_man_syntaxErr_invalidPointerDeclaration2.c",
                         "testfiles/basic_tests_123/proj2_man_syntaxErr_variable.c",
                         "testfiles/basic_tests_123/proj2_man_syntaxErr_pointerOperations2.c"
            , "testfiles/basic_tests_123/proj2_man_semanticErr_redeclaration.c",
                         "testfiles/advanced_tests/SemanticErrors/incompatibleTypes7.c",
                         "testfiles/basic_tests_123/proj2_man_semanticErr_undeclaredVariable3.c",
                         "testfiles/basic_tests_123/proj2_man_syntaxErr_variableConst2.c"]:
            return

        if file_name.startswith("testfiles/advanced_tests"):
            return

        out = subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                             shell=True, capture_output=True)

        valid = True

        try:
            main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb", file_name[
                                                                                                          :-2] + "SymbolTable",
                  "--target_llvm", file_name[:-2] + "LLVM.ll"], True)

            if len(out.stderr) >= 1:
                if "error" in out.stderr or "ERROR" in out.stderr:
                    valid = False

        except:

            if len(out.stderr) == 0:
                valid = False

        if not valid:
            print(out.stderr)
            exit(1)
