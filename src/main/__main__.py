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
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ValueAdderVisitor import *
from src.parser.ASTDereferencer import *

def main(argv):
    input_stream = FileStream("../../example_source_files/file1")
    lexer = expressionLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = expressionParser(stream)
    tree = parser.start_()
    toAST = ASTCreator(lexer)
    toAST.visit(tree)
    ast = toAST.getAST()

    ast_deref = ASTDereferencer(lexer)
    ast_deref.visit(ast)

    d = DotVisitor()
    d.visit(ast)

    cfv = ConstantFoldingVisitor(lexer)
    cfv.visit(ast)

    constraint_checker = ConstraintChecker(lexer)
    constraint_checker.visit(ast)

    v = ValueAdderVisitor(lexer)
    v.visit(ast)

    print("end")


if __name__ == '__main__':
    main(sys.argv)