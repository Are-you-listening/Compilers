from src.antlr_files.grammarCParser import grammarCParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ValueAdderVisitor import *
from src.parser.ASTDereferencer import *
from src.parser.ASTCleaner import *
from src.parser.ASTCleanerAfter import *
from src.parser.Tables.TableDotVisitor import *
from src.parser.ASTTableCreator import *
from src.llvm_target.AST2LLVM import *
from src.parser.ASTIfCleaner import ASTIfCleaner
from src.llvm_target.ControlFlowCreator import *
from src.parser.ASTLoopCleaner import *
from src.parser.ConstantStatementFolding import *
from src.parser.DeadCodeRemover import *
from src.parser.BlacklistVisitor import *
from src.parser.SwitchConverter import *
from src.parser.EnumTypeMerger import *
from src.parser.VirtualLineNrVisitor import *
from src.parser.ArrayCleaner import ArrayCleaner
from src.parser.EnumConverter import *
from src.parser.Preproccesing.preProcessor import *

"""
This is a file used to created AST.JSON testdata with, which we can use to create ASTTests. We create a JSON before and after applying certain visitors we want to test. 
Both results will be stored in a JSON format and can then be reused to make reproducible tests.

The functionality below is quit literally a copy of our __main__.py, however, to make certain testcases different visitor can be moved or exlcuded depending on the test you want to create.
"""

input_file = "read_file.c"

"""
add needed stuff below:
"""
input_stream = FileStream(input_file)
lexer = grammarCLexer(input_stream)

lexer.removeErrorListeners()
lexer.addErrorListener(EListener())

stream = CommonTokenStream(lexer)

includeSTDIO, stream = PreProcessor(stream, lexer, input_file).preProcess()

parser = grammarCParser(stream)
parser.removeErrorListeners()
parser.addErrorListener(EListener())
tree = parser.start_()

toAST = ASTCreator(lexer)
toAST.visit(tree)
ast = toAST.getAST()

virtualLine = VirtualLineVisitor()
virtualLine.visit(ast)

black_list_visitor = BlacklistVisitor()
black_list_visitor.visit(ast)

CodeGetter().visit(ast)

EnumConverter().visit(ast)  # Convert enum to typedef & const bools

EnumTypeMerger().visit(ast)  # Reformat enum declarations to our format

ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

ASTIfCleaner().visit(ast)  # Do a cleanup of the if statements

ASTLoopCleaner().visit(ast)  # Cleanup For/While loops

ASTCleaner().visit(ast)  # Do a standard cleaning

SwitchConverter().visit(ast)  # convert switch statement to if else

ArrayCleaner().visit(ast)

ASTTableCreator().visit(ast)  # Create the symbol table

ASTCleanerAfter().visit(ast)  # Clean even more :)

ASTDereferencer().visit(ast)

ConstraintChecker(includeSTDIO).visit(ast)

ASTConversion().visit(ast)

ConstantFoldingVisitor().visit(ast)

ValueAdderVisitor().visit(ast)

ConstantStatementFolding().visit(ast)

ControlFlowCreator().visit(ast)

DeadCodeRemover().visit(ast)  # removes dead code inside a block coming after a return/continue or break


"""
add needed stuff above ^
"""

json = AstLoader.store(ast)
with open("file_read_json.json", "wt") as f:
    f.write(json)
d = DotVisitor("read_file_before")  # Export AST in Dot
d.visit(ast)


"""
add check stuff below:
"""

cfv = ConstantFoldingVisitor()
cfv.visit(ast)

"""
add check stuff above ^ 
"""

json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot
d.visit(ast_tree)
