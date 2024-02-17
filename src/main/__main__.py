import sys
from antlr4 import *
from antlr4.tree.Trees import Trees

from src.antlr_files.expressionLexer import expressionLexer
from src.antlr_files.expressionParser import expressionParser
from src.antlr_files.expressionVisitor import expressionVisitor
from src.parser.ASTCreator import ASTCreator

def main(argv):
    input_stream = FileStream("../../example_source_files/file1")
    lexer = expressionLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = expressionParser(stream)
    tree = parser.start_()
    print(Trees.toStringTree(tree, None, parser))
    vinterp = ASTCreator()
    vinterp.visit(tree)


if __name__ == '__main__':
    main(sys.argv)