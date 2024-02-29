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
    input_stream = FileStream("../../example_source_files/file9")
    lexer = expressionLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = expressionParser(stream)
    tree = parser.start_()
    toAST = ASTCreator(lexer)
    toAST.visit(tree)
    ast = toAST.getAST()

    ast_deref = ASTDereferencer()
    ast_deref.visit(ast)

    d = DotVisitor()
    d.visit(ast)

    constraint_checker = ConstraintChecker()
    constraint_checker.visit(ast)

    astcleaner = ASTCleaner()
    astcleaner.visit(ast)

    cfv = ConstantFoldingVisitor()
    cfv.visit(ast)

    v = ValueAdderVisitor()
    v.visit(ast)

    print("end")

    ast_conv = ASTConversion()
    ast_conv.visit(ast)




if __name__ == '__main__':
    main(sys.argv)