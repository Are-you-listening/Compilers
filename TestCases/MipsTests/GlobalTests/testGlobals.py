from TestCases.ABCTests.abcTest import *


class GlobalTests(MipsTest):
     """
     Test some files with Globals
     """

     def test(self):
         MipsTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function