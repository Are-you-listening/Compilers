from TestCases.ABCTests.abcTest import *


class WhileTests(LLVMTest,unittest.TestCase):
    """
    Test case to run all created llvm output
    """

    def compileGCC(self, file_name):
        c_out = subprocess.run(f"""gcc {file_name} -o temp/temp""",
                                   shell=True, capture_output=True)
        return c_out

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function
