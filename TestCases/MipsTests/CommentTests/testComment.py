from TestCases.ABCTests.abcTest import *


class CommentTests(MipsTest, unittest.TestCase):
    """
    Test case to run all created mips output
    """

    def test(self):
        MipsTest.MIPS_test(self, os.path.abspath(__file__), False)   # Call the base class tests function
