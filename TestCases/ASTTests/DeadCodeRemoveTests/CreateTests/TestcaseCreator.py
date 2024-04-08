from antlr4 import *
from src.antlr_files.grammarCLexer import grammarCLexer
from src.antlr_files.grammarCParser import grammarCParser
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
from src.parser.ASTLoopCleaner import *
from src.parser.ASTIfCleaner import *
from src.parser.ConstantStatementFolding import *
from src.parser.DeadCodeRemover import *
from src.llvm_target.ControlFlowCreator import *

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

codegetter = CodeGetter()  # Link each line of code to a line number
codegetter.visit(ast)

ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

ASTIfCleaner().visit(ast)  # Do a cleanup of the if statements
ASTLoopCleaner().visit(ast)  # Cleanup For/While loops

ASTCleaner().visit(ast)  # Do a standard cleaning

ASTTableCreator().visit(ast)  # Create the symbol table

ASTCleanerAfter().visit(ast)  # Clean even more :)

ASTDereferencer().visit(ast)  # Correct the use of references & pointers into our format

ConstraintChecker().visit(ast)  # Checkup Semantic & Syntax Errors

ConstantFoldingVisitor().visit(ast)

ASTConversion().visit(ast)

ValueAdderVisitor().visit(ast)

ConstantStatementFolding().visit(ast)

cfc = ControlFlowCreator()
cfc.visit(ast)


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

DeadCodeRemover().visit(ast)  # removes dead code inside a block coming after a return/continue or break

"""
add check stuff above
"""

json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot
d.visit(ast_tree)
