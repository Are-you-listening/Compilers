import os
import sys
import json
import unittest
import subprocess
from abc import ABC
from io import StringIO
from src.parser.AST import *
from src.main.__main__ import main
from src.llvm_target.LLVMSingleton import *
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

    def AST_test(self, abspath):
        """
        Base Method to run all tests
        :param abspath: Absolute Path to run from
        """
        directory = os.path.dirname(abspath)  # Get directory file is in
        os.chdir(directory)  # Change the dir to only focus on this test
        directory += "/tests"  # Walk through the testfiles

        with open("tests/error_dict.json", "rt") as f:  # Load the error dictionary
            error_dict = json.loads(f.read())

        for file in os.listdir(directory):  # Loop through all files
            if not os.path.splitext(file)[-1] == '.c':  # We only run c files
                continue

            index = int(file[4:-2])  # The index is used to refer to the files & other data belonging to this testfile
            # print(index, file)  # Toggle for debug

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
                print("buff", buff.getvalue().splitlines(), index)  # Disable/Enable for Debug
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
    """
    Test to execute LLVM and compare the output with a run of a compiled .c file using gcc
    """

    def LLVM_test(self, abspath, useSTDIN=False):
        """
        Base function
        :param abspath: Absolute Path to run from
        :param useSTDIN: Specifies if an input value should be used
        """
        directory = os.path.dirname(abspath)  # Get directory file is in
        os.chdir(directory)  # Change the dir to only focus on this test
        directory += "/tests"  # Walk through the testfiles

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        if useSTDIN:
            with open("tests/input_dict.json", "rt") as f:
                input_dict = json.loads(f.read())

        for file in os.listdir(directory):  # Loop through all files
            if not os.path.splitext(file)[-1] == '.c':  # We only run c files
                continue

            index = file[4:-2]  # The index is used to refer to the files & other data belonging to this testfile
            file_name = f"tests/test{index}.c"
            print(index, file_name)  # Toggle for debug

            """
            If input will be read, it needs to be retrieved
            """
            if useSTDIN:
                input = (input_dict.get(str(index), []))
            else:
                input = ""

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
                LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service

                # Run our llvm
                main([0, "--input", file_name, "--target_llvm", "temp/temp.ll"])  # Run our compiler


                # Run c file using gcc
                c_out = subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp/temp""",
                                       shell=True, capture_output=True)
                if c_out.returncode != 0:  # Compilation failed, warn client!
                    raise Exception("Compilation Failed")

                # Run the compiled code
                c_out = subprocess.run(f" temp/./temp ; rm temp/temp", shell=True, capture_output=True, text=True,input=input)

                # Run our llvm
                out = subprocess.run(f"""lli temp/temp.ll""", shell=True, capture_output=True, input=input, text=True)

                """
                assert for same output
                """
                assert out.stdout == c_out.stdout

                """
                asser for no error
                """
                assert out.stderr == c_out.stderr

                """
                Remove generated llvm file again
                """
                subprocess.run(f"rm temp/temp.ll", shell=True, capture_output=True)

            except SystemExit:
                """
                In case of a failure, verify expected errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                # print("error", error_buff.getvalue().splitlines(), index)  # Print any errors we didn't expect
                assert errors == expected_errors

            sys.stdout = original
            sys.stderr = original_error