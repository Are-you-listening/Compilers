import unittest
from src.main.__main__ import main
import os

class TestCrashTest(unittest.TestCase):
    def testEvaluateResults(self):
        """
        This testcase will test expression folding
        :return:
        """

        """
        Files that are checked
        """
        path = "../../testfiles/basic_tests_123"
        for root, dirs, filenames in os.walk(path):
            for file in filenames:
                self.runAST("../testfiles/basic_tests_123/"+file)

    def runAST(self, file_name):
        print(file_name)
        main([0, "--input", file_name])

