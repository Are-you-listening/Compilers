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
from src.mips_target.MipsSingleton import MipsSingleton
from src.mips_target.MipsLibrary.MipsManager import MipsManager
from src.mips_target.MipsLibrary.Memory.RegisterManager import RegisterManager

class ASTTest(ABC):
    """
    Abstract Test Class to verify tests using the AST JSON format

    PRECONDITION: Test files should have the name "tests"+<index>"+".c". Any other .c file in the directory will disrupt the process!

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
        os.chdir(directory)  # Change the dir to only focus on this tests
        directory += "/tests"  # Walk through the testfiles

        with open("tests/error_dict.json", "rt") as f:  # Load the error dictionary
            error_dict = json.loads(f.read())

        for file in os.listdir(directory):  # Loop through all files
            if not os.path.splitext(file)[-1] == '.c':  # We only run c files
                continue

            index = int(file[4:-2])  # The index is used to refer to the files & other data belonging to this testfile
            #print(index, file)  # Toggle for debug

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
                #sys.stdout = original
                """
                Verify if we got the same warnings or outputs (can be empty)
                """
                errors = str(buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("buff", buff.getvalue().splitlines(), index)  # Disable/Enable for Debug
                assert errors == expected_errors
            except SystemExit:  # Upon crash
                #sys.stdout = original
                """
                Verify if any errors thrown are as expected
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", expected_errors, errors)  # Disable/Enable for Debug
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
        os.chdir(directory)  # Change the dir to only focus on this tests
        directory += "/tests"  # Walk through the testfiles

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        if useSTDIN:
            with open("tests/input_dict.json", "rt") as f:
                input_dict = json.loads(f.read())

        for file in os.listdir(directory):  # Loop through all files
            if not os.path.splitext(file)[-1] == '.c':  # We only run c files
                continue

            for fold in ['True', 'False']:
                index = file[4:-2]  # The index is used to refer to the files & other data belonging to this testfile
                file_name = f"tests/test{index}.c"

                # if index == "2":
                #     pass
                #print(index, file_name, fold)  # Toggle for debug

                """
                If input will be read, it needs to be retrieved
                """
                if useSTDIN:
                    inp = (input_dict.get(str(index), []))
                else:
                    inp = ""

                """
                Redirect error & output buffs
                """
                original = sys.stdout
                buff = StringIO()
                sys.stdout = buff

                original_error = sys.stderr
                error_buff = StringIO()
                sys.stderr = error_buff

                LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service
                MipsSingleton.getInstance().clear()
                MipsManager.getInstance().clear()
                RegisterManager.getInstance().clear()

                try:
                    #sys.stdout = original

                    # Run our llvm
                    out = self.run_compiler(inp, file_name, fold)

                    c_out = self.runC(file_name, inp, fold)



                    """
                    assert for same output
                    """
                    #sys.stdout = original
                    print('a', out.stdout, 'b', c_out.stdout)

                    assert out.stdout == c_out.stdout

                    """
                    asser for no error
                    """

                    print('1', out.stderr, '2', c_out.stderr)
                    assert out.stderr == c_out.stderr

                    """
                    Remove generated llvm file again
                    """
                    self.cleanup()

                    """
                    Double check that errors are as expected
                    """
                    errors = str(error_buff.getvalue().splitlines())
                    expected_errors = str(error_dict.get(str(index), []))
                    if "[ Warning ]" not in expected_errors:  # If we don't expect any warnings, we can ignore them
                        print("error", errors, expected_errors)  # Print any errors we didn't expect
                        assert errors == expected_errors

                except SystemExit:
                    #sys.stdout = original
                    """
                    In case of a failure, verify expected errors
                    """
                    errors = str(error_buff.getvalue().splitlines())
                    expected_errors = str(error_dict.get(str(index), []))
                    print("error", errors, expected_errors)  # Print any errors we didn't expect
                    assert errors == expected_errors

                sys.stdout = original
                sys.stderr = original_error

    def compileGCC(self, file_name):
        return subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp/temp""",
                                   shell=True, capture_output=True)

    def runC(self, file_name, inp, fold):
        """
        Run and compile a c file
        :param file_name: Name of the file
        :param inp: Any optional input
        :return:
        """

        json_file = file_name[:-2] + ".json"
        index = file_name[10:-2]

        if os.path.isfile(json_file):  # If a .json file exists, we need to load the value from this file as c_out instead of the gcc compiler
            with open(json_file, "rt") as f:
                output_dict = json.loads(f.read())
                c_out = subprocess.run(f"""ls""", shell=True, capture_output=True) # Create a useless c_out
                c_out.stdout = output_dict[str(index)+"_"+fold]  # Modify output
                c_out.stderr = ""  # No errors expected
        else:
            # Run c file using gcc
            c_out = self.compileGCC(file_name)
            if c_out.returncode != 0:  # Compilation failed, warn client!
                raise Exception(f"Compilation Failed {file_name}")

            # Run the compiled code
            c_out = subprocess.run(f" temp/./temp ; rm temp/temp", shell=True, capture_output=True, text=True, input=inp)

        return c_out

    def cleanup(self):
        subprocess.run(f"rm temp/temp.ll", shell=True, capture_output=True)

    @staticmethod
    def run_compiler(inp: str, file_name: str , fold: str):
        main([0, "--input", file_name, "--target_llvm", f"temp/temp.ll", "--fold", fold, "--unused_var",
              "True"])  # Run our compiler
        return subprocess.run(f"""lli temp/temp.ll""", shell=True, capture_output=True, input=inp, text=True)


class MipsTest(LLVMTest):
    """
    Test to execute Mips and compare the output with an expect output
    """
    @staticmethod
    def run_compiler(inp: str, file_name: str, fold: str):
        """
        Run our mips file
        :param file_name: Name of the file
        :param inp: Any optional input
        :return:
        """

        main([0, "--input", file_name, "--target_mips", f"temp/temp.asm", "--fold", fold, "--unused_var",
              "True"])  # Run our compiler

        c_out = subprocess.run(f"spim -file temp/temp.asm", shell=True, capture_output=True, text=True, input=inp)

        output = c_out.stdout
        if output == "":
            c_out.stdout = ""
        else:
            #to_remove = "SPIM Version 8.0 of January 8, 2010\nCopyright 1990-2010, James R. Larus.\nAll Rights Reserved.\nSee the file README for a full copyright notice.\nLoaded: /usr/lib/spim/exceptions.s\n"
            #a = len(to_remove)
            output = output[178:]
            c_out.stdout = output
        return c_out

    def cleanup(self):
        subprocess.run(f"rm temp/temp.asm", shell=True, capture_output=True)