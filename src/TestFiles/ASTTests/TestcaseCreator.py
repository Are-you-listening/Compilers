from antlr4 import *
from src.antlr_files.expressionLexer import expressionLexer
from src.antlr_files.expressionParser import expressionParser
from src.parser.ASTCreator import ASTCreator
from src.parser.TableDotVisitor import *
from AstLoader import AstLoader
input_file = "read_file"

input_stream = FileStream(input_file)  # Declare some variables
lexer = expressionLexer(input_stream)
stream = CommonTokenStream(lexer)
parser = expressionParser(stream)

parser.removeErrorListeners()  # Add our own error Listener
parser.addErrorListener(EListener())
tree = parser.start_()

toAST = ASTCreator(lexer)  # Create Actual AST
toAST.visit(tree)
ast = toAST.getAST()

json = AstLoader.store(ast)
with open("file_read_json.json", "wt") as f:
    f.write(json)