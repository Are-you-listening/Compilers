import unittest
from src.TestFiles.ASTTests.AstLoader import AstLoader
import json
from src.parser.ASTConversion import ASTConversion


class TestConversion(unittest.TestCase):
    def testConversionsBasic(self):
        file_indexes = range(1, 2)
        for index in file_indexes:
            file_path = f"tests/test{index}.json"
            with open(file_path, "rt") as f:
                json_data = f.read()

            ast_tree = AstLoader.load(json_data)
            ast_conv = ASTConversion()
            ast_conv.visit(ast_tree)

            file_path_result = f"tests/test{index}_result.json"
            with open(file_path_result, "rt") as f:
                json_data_result = f.read()

            json_test_result = AstLoader.store(ast_tree)
            assert json_test_result == json_data_result