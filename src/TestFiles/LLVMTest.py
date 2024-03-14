import unittest
from src.main.__main__ import main
import os

class LLVMTest(unittest.TestCase):
    def testEvaluateResults(self):
        """
        This testcase will run all LLVM tests
        :return:
        """

        path = "testfiles/LLVM_tests"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith("c"):
                    print(root + "/" + file)
                    self.runAST(root + "/" + file)


    def runAST(self, file_name):
        main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb",
          file_name[:-2] + "SymbolTable",
          "--target_llvm", file_name[:-2] + "LLVM"], True)

