from antlr4 import *
from src.antlr_files.expressionLexer import expressionLexer
from src.antlr_files.expressionParser import expressionParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ValueAdderVisitor import *
from src.parser.ASTDereferencer import *
from src.parser.ASTConversion import *
from src.parser.ASTCleaner import *
from src.parser.ASTCleanerAfter import *
from src.parser.Tables.TableDotVisitor import *
from src.parser.CodeGetter import *
from TestCases.ASTTests.AstLoader import AstLoader
from src.parser.ASTTableCreator import ASTTableCreator
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

"""
below add needed stuff
"""

codegetter = CodeGetter()
codegetter.visit(ast)

ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

astcleaner = ASTCleaner()  # Do a standard cleaning
astcleaner.visit(ast)

ASTTableCreator().visit(ast)  # Create the symbol table


astcleanerafter = ASTCleanerAfter()  # Do a standard cleaning
astcleanerafter.visit(ast)

ast_deref = ASTDereferencer()  # Correct the use of references & pointers into our format
ast_deref.visit(ast)

constraint_checker = ConstraintChecker()  # Checkup Semantic & Syntax Errors
constraint_checker.visit(ast)

cfv = ConstantFoldingVisitor()
cfv.visit(ast)

ast_conv = ASTConversion()
ast_conv.visit(ast)

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

value_adder = ValueAdderVisitor()
value_adder.visit(ast)

"""
add check stuff above
"""

json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot
d.visit(ast_tree)