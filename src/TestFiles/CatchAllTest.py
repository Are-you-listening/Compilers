import unittest
from src.main.__main__ import main
import os
import sys
import logging


class CatchAllTest(unittest.TestCase):
    def testEvaluateResults(self):
        """
        This testcase will run all tests and catches the prints and exports it to a file
        :return:
        """

        path = "testfiles/"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                if file.endswith("c"):
                    file_name = root + "/" + file
                    print(root + "/" + file)
                    self.runAST(root + "/" + file)

                    # with open(file_name + '.txt', 'w') as old, open(file_name + 'Error2.txt', 'w') as new:
                    #     lines = old.readlines()
                    #     new.writelines(lines[:-48])
                    #
                    sys.exit()

    def runAST(self, file_name):
        print(file_name)
        sys.stdout = open(file_name + '.txt', 'w')
        # sys.stderr = open(file_name+'Error.txt', 'w')
        print("Hello")

        main([0, "--input", file_name, "--render_ast", file_name+"AST", "--render_symb", file_name+"SymbolTable",
              "--target_llvm", file_name + "LLVM"], True)
        sys.stdout.close()
        # sys.stderr.close()
