import os
import filecmp
import unittest
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *


class CompareAll(unittest.TestCase):
    """
    Test case to create a llvm output for each file and compare it with the corresponding "right" file. Right in the
    sense that we pre-set an output we see as valid.
    """
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
        """
        :param filename:
        :return:
        """
        filename = filename[:-2] + "LLVMtoCompare.ll"
        with open(filename, 'w'):
            pass

    @staticmethod
    def compareLLVM(newly, right):
        """
        Compare the contents of 2 files
        :param newly:
        :param right:
        :return: True if they are the same
        """
        return filecmp.cmp(newly, right)

    @staticmethod
    def runAST(file_name: str):
        """
        Run our compiler to generate LLVM output
        :param file_name:
        :return:
        """
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

        # Create LLVM file
        main([0, "--input", file_name, "--render_ast", file_name[:-2] + "ASTVisual", "--render_symb", file_name[:-2] + "SymbolTable",
              "--target_llvm", file_name[:-2] + "LLVM.ll"])
