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
from src.parser.ASTConversion import *
from src.parser.ASTCleaner import *


def main(argv):
    input_file = "file13"
    for arg_index in range(1, len(argv), 2):
        param = argv[arg_index]
        arg = argv[arg_index+1]
        if param == "--input":
            input_file = arg

    input_stream = FileStream(f"../../example_source_files/{input_file}")
    lexer = expressionLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = expressionParser(stream)
    parser.removeErrorListeners()
    parser.addErrorListener(EListener())
    tree = parser.start_()

    toAST = ASTCreator(lexer)
    toAST.visit(tree)
    ast = toAST.getAST()

    astcleaner = ASTCleaner()
    astcleaner.visit(ast)

    ast_deref = ASTDereferencer()
    ast_deref.visit(ast)

    d = DotVisitor()
    d.visit(ast)

    constraint_checker = ConstraintChecker()
    constraint_checker.visit(ast)

    cfv = ConstantFoldingVisitor()
    cfv.visit(ast)

    v = ValueAdderVisitor()
    v.visit(ast)

    print("end")

    ast_conv = ASTConversion()
    ast_conv.visit(ast)




if __name__ == '__main__':
    main(sys.argv)