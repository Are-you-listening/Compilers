from TestCases.ABCTests.abcTest import *


class CommentTests(MipsTest):
    """
    Test case to run all created mips output
    """

    def test(self):
        MipsTest.LLVM_test(self, os.path.abspath(__file__), False)   # Call the base class tests function
