import unittest
from src.TestFiles.ASTTests.AstLoader import AstLoader
import json


class TestConversion(unittest.TestCase):
    def testConversionsBasic(self):
        file_indexes = range(1, 2)
        for index in file_indexes:
            file_path = f"tests/test{index}.json"
            with open(file_path, "rt") as f:
                json_data = f.read()

            ast_tree = AstLoader.load(json_data)
