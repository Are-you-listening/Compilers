import unittest
from TestCases.ASTTests.AstLoader import AstLoader
from src.parser.ASTConversion import ASTConversion
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
import sys
from io import StringIO
import json
from src.parser.Constraints.ConstraintChecker import ConstraintChecker
import os
from src.parser.ASTDereferencer import ASTDereferencer
from src.parser.DeadCodeRemover import *
from src.llvm_target.ControlFlowCreator import *


class TestDeadCodeRemover(unittest.TestCase):
    def testDeadCodeRemover(self):
        file_indexes = range(1, 7)

        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for index in file_indexes:

            #print(index)
            file_path = f"tests/test{index}.json"
            with open(file_path, "rt") as f:
                json_data = f.read()

            LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

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
                cfc = ControlFlowCreator()
                cfc.visit(ast_tree)
                DeadCodeRemover().visit(ast_tree)  # removes dead code inside a block coming after a return/continue or break

                file_path_result = f"tests/test{index}_result.json"
                with open(file_path_result, "rt") as f:
                    json_data_result = f.read()

                json_test_result = AstLoader.store(ast_tree)
                assert json_test_result == json_data_result

                """
                tests errors (warnings)
                """
                errors = str(buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("buff", buff.getvalue().splitlines(), index)

                assert errors == expected_errors

            except SystemExit as e:
                """
                tests errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", error_buff.getvalue().splitlines(), index)
                assert errors == expected_errors

            sys.stdout = original
            sys.stderr = original_error
