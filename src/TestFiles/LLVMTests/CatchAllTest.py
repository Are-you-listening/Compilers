import os
import unittest
import subprocess
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *


class CatchAllTest(unittest.TestCase):
    def testEvaluateResults(self):
        """
        This testcase will run all files in the testfiles/ folder and checks if the amount of errors is the same
        :return:
        """

        path = "testfiles/"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith(".c"):
                    filename = root + "/" + file
                    print(filename)
                    self.runAST(filename)

    @staticmethod
    def runAST(file_name):
        """
        Run our actual compiler and catch its output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton instance
        valid = True

        if file_name.startswith("testfiles/HELP/proj1") or file_name.startswith(
                "testfiles/advanced_tests"):  # Don't want to run those bad boys for now
            return
        if file_name in ["testfiles/basic_tests_123/proj2_man_semanticErr_undeclaredVariable3.c",
                         "testfiles/basic_tests_123/proj2_man_syntaxErr_variableConst2.c"]:
            return

        out = subprocess.run(f"""clang-14 -S -emit-llvm {file_name} -o {file_name[:-2]}.ll""",
                             shell=True, capture_output=True)

        try:
            main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb", file_name[
                                                                                                          :-2] + "SymbolTable",
                  "--target_llvm", file_name[:-2] + "LLVM.ll"])

            if len(out.stderr) >= 1:
                if "error" in out.stderr or "ERROR" in out.stderr:
                    valid = False

        except:
            if len(out.stderr) == 0:
                valid = False

        if not valid:
            print(out.stderr)
            exit(1)
