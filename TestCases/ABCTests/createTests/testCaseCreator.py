from src.antlr_files.grammarCParser import grammarCParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ASTDereferencer import *
from src.parser.ASTCleaner import *
from src.parser.ASTCleanerAfter import *
from src.llvm_target.AST2LLVM import *
from src.parser.ASTIfCleaner import ASTIfCleaner
from src.parser.ASTLoopCleaner import *
from src.parser.BlacklistVisitor import *
from src.parser.SwitchConverter import *
from src.parser.EnumTypeMerger import *
from src.parser.VirtualLineNrVisitor import *
from src.parser.ArrayCleaner import ArrayCleaner
from src.parser.EnumConverter import *
from src.parser.Preproccesing.preProcessor import *
from TestCases.ABCTests.AstLoader import AstLoader


"""
This is a file used to created AST.JSON testdata with, which we can use to create ASTTests. We create a JSON before and after applying certain visitors we want to tests. 
Both results will be stored in a JSON format and can then be reused to make reproducible tests.

The functionality below is quit literally a copy of our __main__.py, however, to make certain testcases different visitor can be moved or exlcuded depending on the tests you want to create.
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

VirtualLineVisitor().visit(ast)

BlacklistVisitor().visit(ast)

CodeGetter().visit(ast)

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

# ConstraintChecker(includeSTDIO).visit(ast)
#
# ASTConversion().visit(ast)
#
# ConstantFoldingVisitor().visit(ast)
#
# ValueAdderVisitor().visit(ast)
#
# ConstantStatementFolding().visit(ast)
#
# ControlFlowCreator().visit(ast)
#
# DeadCodeRemover().visit(ast)


"""
add needed stuff above ^
"""

"""
Store the start AST into JSON
"""
json = AstLoader.store(ast)
with open("file_read_json.json", "wt") as f:
    f.write(json)

d = DotVisitor("read_file_before")  # Export AST in Dot to verify it was as expected
d.visit(ast)

"""
add check stuff below:
"""

# VirtualLineVisitor().visit(ast)
#
# BlacklistVisitor().visit(ast)
#
# CodeGetter().visit(ast)
#
# EnumConverter().visit(ast)
#
# EnumTypeMerger().visit(ast)
#
# ASTTypedefReplacer().visit(ast)
#
# ASTIfCleaner().visit(ast)
#
# ASTLoopCleaner().visit(ast)
#
# ASTCleaner().visit(ast)
#
# SwitchConverter().visit(ast)
#
# ArrayCleaner().visit(ast)
#
# ASTTableCreator().visit(ast)
#
# ASTCleanerAfter().visit(ast)
#
# ASTDereferencer().visit(ast)
#
ConstraintChecker(includeSTDIO).visit(ast)
#
# ASTConversion().visit(ast)
#
# ConstantFoldingVisitor().visit(ast)
#
# ValueAdderVisitor().visit(ast)
#
# ConstantStatementFolding().visit(ast)
#
# ControlFlowCreator().visit(ast)
#
# DeadCodeRemover().visit(ast)

"""
add check stuff above ^ 
"""

"""
Store the result into a JSON
"""
json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot to check the expected result once by hand
d.visit(ast_tree)
