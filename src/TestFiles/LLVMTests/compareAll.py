import unittest
from src.main.__main__ import main
import os
import filecmp
from src.llvm_target.LLVMSingleton import *


class compareAll(unittest.TestCase):
    def testEvaluateResults(self):
        path = "testfiles/"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith(".c"):
                    filename = root + "/" + file
                    print(filename)
                    self.runAST(root + "/" + file)
                    assert self.compareLLVM(filename[:-2] + "LLVMtoCompare.ll", filename)

    @staticmethod
    def createEmptyLLVMFile(filename):
        filename = filename[:-2] + "LLVMtoCompare.ll"
        with open(filename, 'w') as f:
            pass

    @staticmethod
    def compareLLVM(newly, right):
        return filecmp.cmp(newly, right)

    def runAST(self, file_name):
        LLVMSingleton.getInstance().clear()

        # Create LLVM file
        main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb", file_name[
                                                                                                      :-2] + "SymbolTable",
              "--target_llvm", file_name[:-2] + "LLVM.ll"], True)