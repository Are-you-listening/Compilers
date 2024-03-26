import unittest
from src.TestFiles.ASTTests.AstLoader import AstLoader
import json
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
import sys
from io import StringIO
import os

class TestConstantFolding(unittest.TestCase):
    def testConstantFolding(self):

        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        file_indexes = range(1, 9)
        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for index in file_indexes:
            file_path = f"tests/test{index}.json"
            with open(file_path, "rt") as f:
                json_data = f.read()

            ast_tree = AstLoader.load(json_data)

            """
            make print buff
            """
            original = sys.stdout
            buff = StringIO()
            sys.stdout = buff

            original_error = sys.stderr
            error_buff = StringIO()
            sys.stderr = error_buff

            """
            conversion
            """
            try:
                ast_const = ConstantFoldingVisitor()
                ast_const.visit(ast_tree)

                file_path_result = f"tests/test{index}_result.json"
                with open(file_path_result, "rt") as f:
                    json_data_result = f.read()

                json_test_result = AstLoader.store(ast_tree)
                assert json_test_result == json_data_result

                """
                test errors (warnings)
                """
                errors = str(buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("buff", buff.getvalue().splitlines(), index)
                assert errors == expected_errors

            except SystemExit as e:
                """
                test errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", error_buff.getvalue().splitlines(), index)
                assert errors == expected_errors

            sys.stdout = original
            sys.stderr = original_error