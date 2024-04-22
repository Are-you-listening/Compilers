import unittest
from io import StringIO
import json
import os
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ASTTableCreator import *
from TestCases.ABCTests.AstLoader import AstLoader


class TestConstraints(unittest.TestCase):
    def testConstraints(self):
        file_indexes = range(1, 8)

        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for index in file_indexes:
            #print(index)
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
                ConstraintChecker(True).visit(ast_tree)
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", error_buff.getvalue().splitlines(), index)
                print(errors, expected_errors)
                assert errors == expected_errors
            except SystemExit as e:
                """
                tests errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", error_buff.getvalue().splitlines(), index)
                print(errors, expected_errors)
                assert errors == expected_errors

            sys.stdout = original
            sys.stderr = original_error
