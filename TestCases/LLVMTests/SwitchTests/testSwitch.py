from TestCases.ABCTests.abcTest import *


class SwitchTests(LLVMTest,unittest.TestCase):
    """
    Test case to run all created llvm output
    """

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function
