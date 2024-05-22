import subprocess
import unittest
from io import StringIO
import json
import os
import sys
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *

from TestCases.ABCTests.abcTest import *


class StringTests(MipsTest):
     """
     Test case to run all created llvm output
     """

     def test(self):
         MipsTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class tests function
