from TestCases.ABCTests.abcTest import *


class ScanfTests(LLVMTest,unittest.TestCase):
    """
    Test case to run all created llvm output
    """

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), True)  # Call the base class test function
