import unittest
from io import StringIO
import json
import os
from antlr4 import *
from src.antlr_files.grammarCLexer import grammarCLexer
from src.antlr_files.grammarCParser import grammarCParser
from src.parser.ASTTableCreator import *


class TestSyntaxError(unittest.TestCase):
    def testSyntaxErrors(self):
        file_indexes = range(1, 31)

        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        with open("tests/error_dict.json", "rt") as f:
            error_dict = json.loads(f.read())

        for index in file_indexes:
            #print(index)
            file_path = f"tests/test{index}.c"

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
                input_stream = FileStream(file_path)  # Declare some variables
                lexer = grammarCLexer(input_stream)
                stream = CommonTokenStream(lexer)
                parser = grammarCParser(stream)

                lexer.removeErrorListeners()
                lexer.addErrorListener(EListener())

                parser.removeErrorListeners()  # Add our own error Listener
                parser.addErrorListener(EListener())
                parser.start_()
            except SystemExit as e:
                """
                tests errors Real errors
                """
                errors = str(error_buff.getvalue().splitlines())
                expected_errors = str(error_dict.get(str(index), []))
                print("error", error_buff.getvalue().splitlines(), index)
                #print(errors, expected_errors)
                assert errors == expected_errors

            sys.stdout = original
            sys.stderr = original_error
