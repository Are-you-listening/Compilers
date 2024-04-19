from antlr4 import *
from src.antlr_files.grammarCLexer import grammarCLexer
from src.antlr_files.grammarCParser import grammarCParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.ASTCleaner import *
from src.parser.CodeGetter import *
from TestCases.ASTTests.AstLoader import AstLoader
from src.parser.ASTTableCreator import *
from src.parser.VirtualLineNrVisitor import VirtualLineVisitor
from src.parser.BlacklistVisitor import BlacklistVisitor
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ASTCleanerAfter import *
from src.parser.DefineConverter import *
from src.parser.EnumConverter import *
from src.parser.EnumTypeMerger import *
from src.parser.ASTTypedefReplacer import *
from src.parser.ASTIfCleaner import *
from src.parser.ASTLoopCleaner import *
from src.parser.ASTCleaner import *
from src.parser.ASTCleanerAfter import *
from src.parser.SwitchConverter import *
from src.parser.ArrayCleaner import *
from src.parser.ASTTableCreator import *
from src.parser.ASTDereferencer import *

input_file = "read_file"

input_stream = FileStream(input_file)  # Declare some variables
lexer = grammarCLexer(input_stream)
stream = CommonTokenStream(lexer)
parser = grammarCParser(stream)

lexer.removeErrorListeners()
lexer.addErrorListener(EListener())

parser.removeErrorListeners()  # Add our own error Listener
parser.addErrorListener(EListener())
tree = parser.start_()

toAST = ASTCreator(lexer)  # Create Actual AST
toAST.visit(tree)
ast = toAST.getAST()

virtualline = VirtualLineVisitor()
virtualline.visit(ast)

black_list_visitor = BlacklistVisitor()
black_list_visitor.visit(ast)

"""
below add needed stuff
"""

CodeGetter().visit(ast)
DefineConverter().visit(ast)
EnumConverter().visit(ast)
EnumTypeMerger().visit(ast)
ASTTypedefReplacer().visit(ast)
ASTIfCleaner().visit(ast)
ASTLoopCleaner().visit(ast)
ASTCleaner().visit(ast)
SwitchConverter().visit(ast)
ArrayCleaner().visit(ast)
ASTTableCreator().visit(ast)
ASTCleanerAfter().visit(ast)
ASTDereferencer().visit(ast)


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

ConstraintChecker().visit(ast)

"""
add check stuff above
"""

json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot
d.visit(ast_tree)
