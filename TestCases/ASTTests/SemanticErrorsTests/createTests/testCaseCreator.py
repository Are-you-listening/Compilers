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
from TestCases.ABCTests.AstLoader import AstLoader
from src.parser.ASTTableCreator import ASTTableCreator
from src.parser.TypeMerger import *
from src.parser.VirtualLineNrVisitor import VirtualLineVisitor
from src.parser.BlacklistVisitor import BlacklistVisitor
from src.parser.StructCleaner import StructCleaner
from src.parser.StructCleanerAfter import StructCleanerAfter
from src.parser.Preproccesing.preProcessor import PreProcessor
from src.parser.PointerReformater import PointerReformater
from src.parser.ASTLoopCleaner import ASTLoopCleaner
from src.parser.EnumConverter import EnumConverter
from src.parser.ASTIfCleaner import ASTIfCleaner
from src.parser.SwitchConverter import SwitchConverter
from src.parser.FunctionPtrCleaner import FunctionPtrCleaner
from src.parser.StringToArray import StringToArray
from src.parser.ArrayCleaner import ArrayCleaner
from src.parser.DynamicAllocation import DynamicAllocation
from src.parser.Constraints.CheckRvalues import CheckRvalues
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

#DotVisitor("output/debug0").visit(ast)  # Export AST in Dot

parser.reset()
lexer.reset()
stream.reset()
input_stream.reset()

virtualLine = VirtualLineVisitor()
virtualLine.visit(ast)

codegetter = CodeGetter()  # Link each line of code to a line number
codegetter.visit(ast)

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

#DotVisitor("output/debug0").visit(ast)  # Export AST in Dot
ASTTableCreator().visit(ast)  # Create the symbol table

DynamicAllocation.add_allocation(ast)

StructCleanerAfter().visit(ast)

ASTCleanerAfter().visit(ast)  # Clean even more :)

CheckRvalues().visit(ast)

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
ast_deref = ASTDereferencer()  # Correct the use of references & pointers into our format
ast_deref.visit(ast)

constraint_checker = ConstraintChecker(True)  # Checkup Semantic & Syntax Errors
constraint_checker.visit(ast)

cfv = ConstantFoldingVisitor()
cfv.visit(ast)


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
