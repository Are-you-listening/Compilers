from TestCases.ABCTests.abcTest import *


class LogicTests(MipsTest):
     """
     Test case to run all created mips output with Logical Ops
     """

     def test(self):
         MipsTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function