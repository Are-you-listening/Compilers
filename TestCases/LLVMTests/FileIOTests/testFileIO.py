from TestCases.ABCTests.abcTest import *


class FileIOTests(LLVMTest,unittest.TestCase):
    """
    Test arrays
    """

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class test function
