from TestCases.ABCTests.abcTest import *


class IfTests(LLVMTest, unittest.TestCase):
    """
    Test case to run llvm output with compiled if else statements
    """

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class test function
