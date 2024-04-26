from antlr4 import *
from src.antlr_files.grammarCLexer import grammarCLexer
from src.antlr_files.grammarCParser import grammarCParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.ASTCleaner import *
from src.parser.CodeGetter import *
from TestCases.ABCTests.AstLoader import AstLoader
from src.parser.ASTTableCreator import *
from src.parser.VirtualLineNrVisitor import VirtualLineVisitor
from src.parser.BlacklistVisitor import BlacklistVisitor
from src.parser.StructCleaner import StructCleaner
from src.parser.StructCleanerAfter import StructCleanerAfter

input_file = "read_file.c"

input_stream = FileStream(input_file)  # Declare some variables
lexer = grammarCLexer(input_stream)
stream = CommonTokenStream(lexer)
parser = grammarCParser(stream)

parser.removeErrorListeners()  # Add our own error Listener
parser.addErrorListener(EListener())
tree = parser.start_()

toAST = ASTCreator(lexer)  # Create Actual AST
toAST.visit(tree)
ast = toAST.getAST()

"""
below add needed stuff
"""

virtualline = VirtualLineVisitor()
virtualline.visit(ast)

black_list_visitor = BlacklistVisitor()
black_list_visitor.visit(ast)

codegetter = CodeGetter()
codegetter.visit(ast)

structTable = StructCleaner().visit(ast)  # Massage the structs

"""
add needed stuff above
"""

json = AstLoader.store(ast)
with open("file_read_json.json", "wt") as f:
    f.write(json)

d = DotVisitor("read_file_before")  # Export AST in Dot
d.visit(ast)

"""
add check stuff
"""

ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

ASTCleaner().visit(ast)  # Do a standard cleaning

ASTTableCreator().visit(ast)  # Create the symbol table

"""
add check stuff above
"""

json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot
d.visit(ast_tree)
