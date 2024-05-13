from TestCases.ABCTests.abcTest import *


class DefineTests(LLVMTest, unittest.TestCase):
    """
    Test case to run llvm output, using preprocessor directives
    """

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function
