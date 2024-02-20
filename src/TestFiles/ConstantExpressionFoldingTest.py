import unittest
import subprocess
from src.parser.ASTOutput import *
import sys
from antlr4 import *
from antlr4.tree.Trees import Trees

from src.antlr_files.expressionLexer import expressionLexer
from src.antlr_files.expressionParser import expressionParser
from src.antlr_files.expressionVisitor import expressionVisitor
from src.parser.ASTCreator import ASTCreator
from src.parser.AST import *
from src.parser.ConstantFoldingVisitor import *
from src.parser.DotVisitor import *


class TestConstantExpression(unittest.TestCase):
    def testEvaluateResults(self):

        filenames = ["proj1_man_pass_constantFolding.c", "proj1_man_pass_intLiteral.c",
                     "proj1_man_pass_operators.c", "proj1_man_pass_whitespace.c"]

        for f in filenames:
            path = f"../../testfiles/basic_tests_123/{f}"
            with open(path, "rt") as open_file:

                test_expr = open_file.read()


            c_prints = []
            for expr in test_expr.split(';'):
                expr = expr.replace("\n", "")
                if len(expr) == 0:
                    continue
                c_print = f"""printf("%d", {expr});\nprintf(";");\n"""
                c_prints.append(c_print)

            c_format = f"""
                    #include <stdio.h>
                    int main(void){'{'}
                        {"".join(c_prints)}
                        
                    {'}'}
                    """

            out = subprocess.run(f"echo '{c_format}' | gcc -x c -o temp - && ./temp && rm temp",
                                 shell=True, capture_output=True)


            # run ast
            input_stream = FileStream(path)
            lexer = expressionLexer(input_stream)
            stream = CommonTokenStream(lexer)
            parser = expressionParser(stream)
            tree = parser.start_()
            toAST = ASTCreator()
            toAST.visit(tree)
            ast = toAST.getAST()

            cfv = ConstantFoldingVisitor(lexer)
            cfv.visit(ast)

            out2 = ASTOutput()
            out2.visit(ast)

            print(out.stdout)
            print(out2.getOutput()[:-6])

            self.assertEqual(out.stdout, bytes(out2.getOutput()[:-6], encoding='utf-8'))
