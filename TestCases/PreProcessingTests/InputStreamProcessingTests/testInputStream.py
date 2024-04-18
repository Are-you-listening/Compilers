import os
import unittest
from src.parser.Preproccesing.InputStreamProcessor import InputStreamProcessor
import filecmp


class InputStreamTests(unittest.TestCase):
    """
    Test case to run all created llvm output
    """

    def testSimpleInputStream(self):
        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        file_range = range(1, 2)

        for i in file_range:
            isp = InputStreamProcessor(f"tests/test{i}.c")
            print(isp)

    @staticmethod
    def compareOut(newly, right):
        """
        Compare the contents of 2 files
        :param newly:
        :param right:
        :return: True if they are the same
        """
        return filecmp.cmp(newly, right, False)
