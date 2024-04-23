from TestCases.ABCTests.abcTest import *
from TestCases.ABCTests.abcTest import *


class TestSyntaxError(LLVMTest, unittest.TestCase):
    """
    Test syntax errors
    """

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class test function
