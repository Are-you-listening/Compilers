import os
import sys
import json
import unittest
from abc import ABC
from io import StringIO
from src.parser.AST import *
from TestCases.ABCTests.AstLoader import AstLoader


class ASTTest(ABC):
    """
    Abstract Test Class to verify tests using the AST JSON format

    PRECONDITION: Test files should have the name "test"+<index>"+".c". Any other .c file in the directory will disrupt the process!

    Test may not necessarily be done on index order, as this depends on the os file system.
    """

    @abstractmethod
    def execute(self, abstract_syntax_tree: AST):
        """
        Execute any visitors we want to run on a given AST
        :param abstract_syntax_tree:
        """
        # <Include any visitors here>
        pass

    def ASTtest(self, abspath):
        directory = os.path.dirname(abspath)  # Get directory file is in
        os.chdir(directory)  # Change the dir to only focus on this test
        directory += "/tests"  # Walk through the testfiles

        with open("tests/error_dict.json", "rt") as f:  # Load the error dictionary
            error_dict = json.loads(f.read())

        for file in os.listdir(directory):  # Loop through all files
            if not file.endswith(".c"):  # We only run c files
                continue

            index = int(file[4:-2])  # The index is used to refer to the files & other data belonging to this testfile
            #print(index)

            """
            Load the AST from the JSON file
            """
            file_path = f"tests/test{index}.json"
            with open(file_path, "rt") as f:
                json_data = f.read()
            ast_tree = AstLoader.load(json_data)

            """
            Redirect error & output buffs
            """
            original = sys.stdout
            buff = StringIO()
            sys.stdout = buff

            original_error = sys.stderr
            error_buff = StringIO()
            sys.stderr = error_buff

            try:
                self.execute(ast_tree)  # Apply visitors we want to verify the output from

                """
                Load the AST Result we expect (preset values)
                """
                file_path_result = f"tests/test{index}_result.json"
                with open(file_path_result, "rt") as f:
                    json_data_result = f.read()
                json_test_result = AstLoader.store(ast_tree)

                assert json_test_result == json_data_result  # Verify if we retrieved the same result

                """
                Verify if we got the same warnings or outputs (can be empty)
                """
                errors = str(buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("buff", buff.getvalue().splitlines(), index) # Disable/Enable for Debug
                assert errors == expected_errors
            except SystemExit:  # Upon crash
                """
                Verify if any errors thrown are as expected
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", error_buff.getvalue().splitlines(), index)  # Disable/Enable for Debug
                assert errors == expected_errors

            """
            After 1 file, reset the buffers
            """
            sys.stdout = original
            sys.stderr = original_error


class LLVMTest(unittest.TestCase, ABC):
    @abstractmethod
    def runAST(self):
        pass

    @abstractmethod
    def runC(self):
        pass
