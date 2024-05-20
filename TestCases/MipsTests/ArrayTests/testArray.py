from TestCases.ABCTests.abcTest import *


class ArrayTests(MipsTest):
     """
     Test arrays
     """

     def test(self):
         MipsTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function
