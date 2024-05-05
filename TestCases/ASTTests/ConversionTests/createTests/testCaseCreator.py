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
from src.parser.TypeMerger import *
from src.parser.VirtualLineNrVisitor import *
from src.parser.ArrayCleaner import ArrayCleaner
from src.parser.EnumConverter import *
from src.parser.Preproccesing.preProcessor import *
from src.parser.StringToArray import *
from src.parser.StructCleaner import *
from src.parser.StructCleanerAfter import *
from src.parser.FunctionPtrCleaner import FunctionPtrCleaner
from TestCases.ABCTests.AstLoader import AstLoader
from src.parser.Preproccesing.preProcessor import PreProcessor
from src.parser.TypeCleaner import TypeCleaner
from src.parser.PointerReformater import PointerReformater
from src.parser.EnumConverter import EnumConverter
from src.parser.FunctionPtrCleaner import FunctionPtrCleaner



input_file = "read_file.c"

input_stream = FileStream(input_file)  # Declare some variables
lexer = grammarCLexer(input_stream)
stream = CommonTokenStream(lexer)
includeSTDIO, stream, comments = PreProcessor(stream, lexer, input_file).preProcess()  # Apply preprocessing

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

virtualLine = VirtualLineVisitor()
virtualLine.visit(ast)

BlacklistVisitor().visit(ast)

PointerReformater().visit(ast)

ASTLoopCleaner().visit(ast)  # Cleanup For/While loops

StructCleaner().visit(ast)  # Massage the structs

EnumConverter().visit(ast)  # Convert enum to typedef & const bools

TypeMerger().visit(ast)  # Reformat enum & struct declarations to our format

ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

FunctionPtrCleaner().visit(ast)  # cleans the function ptrs

TypeCleaner().visit(ast)


ASTIfCleaner().visit(ast)  # Do a cleanup of the if statements

ASTCleaner().visit(ast)  # Do a standard cleaning

SwitchConverter().visit(ast)  # convert switch statement to if else

StringToArray().visit(ast)



ArrayCleaner().visit(ast)
ASTTableCreator().visit(ast)  # Create the symbol table

StructCleanerAfter().visit(ast)

ASTCleanerAfter().visit(ast)  # Clean even more :)

ASTDereferencer().visit(ast)  # Correct the use of references & pointers into our format

constraint_checker = ConstraintChecker(True)  # Checkup Semantic & Syntax Errors
constraint_checker.visit(ast)




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

ast_conv = ASTConversion()
ast_conv.visit(ast)

"""
add check stuff above
"""

json = AstLoader.store(ast)
with open("file_read_json_result.json", "wt") as f:
    f.write(json)
ast_tree = AstLoader.load(json)

d = DotVisitor("read_file_after")  # Export AST in Dot
d.visit(ast_tree)
