from src.antlr_files.grammarCParser import grammarCParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ValueAdderVisitor import *
from src.parser.ASTDereferencer import *
from src.parser.ASTCleaner import *
from src.parser.ASTCleanerAfter import *
from src.parser.Tables.TableDotVisitor import *
from src.llvm_target.AST2LLVM import *
from src.parser.ASTIfCleaner import ASTIfCleaner
from src.parser.ASTLoopCleaner import *
from src.parser.ConstantStatementFolding import *
from src.parser.DeadCodeRemover import *
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
from src.parser.VoidReturnAdder import *
from src.parser.PointerReformater import *
from src.parser.Constraints.CheckRvalues import *
from src.parser.UnarySaVisitor import *
from src.parser.DynamicAllocation import DynamicAllocation
from src.parser.FileIO import FileIO
from src.parser.TypeCleaner import TypeCleaner
from src.parser.SizeOfTranslater import SizeOfTranslater
from src.parser.ControlFlow.ControlFlowCreator import *
from src.parser.ControlFlow.ControlFlowDotVisitor import *
from src.parser.UnusedCleaner import UnusedCleaner
from src.parser.ArrayPreProcessor import ArrayPreProcessor
from TestCases.ABCTests.AstLoader import AstLoader
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.ScopeCleaner import ScopeCleaner
from src.mips_target.AST2MIPS import AST2MIPS, MipsSingleton


def cleanGreen(input_file, symbol_file):
    """
    Standard function to generate parseTree & Export it to Dot
    :param input_file:
    :param symbol_file:
    :return:
    """

    """
    clear singletons for testcases
    """
    TypeNodeHandler.getInstance().clear()  # Clear any old singletons
    LLVMSingleton.getInstance().clear()

    input_stream = FileStream(input_file)  # Create input stream
    lexer = grammarCLexer(input_stream)

    lexer.removeErrorListeners()  # Add our own error listener
    lexer.addErrorListener(EListener())

    stream = CommonTokenStream(lexer)  # Extract tokens

    p = PreProcessor(stream, lexer, input_file)
    includeSTDIO, stream, comments = p.preProcess()  # Apply preprocessing
    includeSTLIB = p.stdlib

    parser = grammarCParser(stream)  # Do actual parse
    parser.removeErrorListeners()  # Add our own error Listener
    parser.addErrorListener(EListener())
    tree = parser.start_()

    toAST = ASTCreator(lexer)  # Create Actual AST
    toAST.visit(tree)
    ast = toAST.getAST()

    # Reset services after old run
    parser.reset()
    lexer.reset()
    stream.reset()
    input_stream.reset()

    virtualLine = VirtualLineVisitor()  # Map virtual lines (for each ';')
    virtualLine.visit(ast)

    codegetter = CodeGetter()  # Link each line of code to a line number
    codegetter.visit(ast)

    BlacklistVisitor().visit(ast)  # Remove blacklisted characters

    PointerReformater().visit(ast)  # Reformat pointer nodes

    ASTLoopCleaner().visit(ast)  # Cleanup For/While loops

    StructCleaner().visit(ast)  # Massage the structs

    EnumConverter().visit(ast)  # Convert enum to typedef & const bools

    TypeMerger().visit(ast)  # Reformat enum & struct declarations to our format

    FileIO.add_file_type()  # Implement file ptrs as fancy structs

    ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

    FunctionPtrCleaner().visit(ast)  # cleans the function ptrs

    ASTIfCleaner().visit(ast)  # Do a cleanup of the if statements

    ASTCleaner().visit(ast)  # Do a standard cleaning

    TypeCleaner().visit(ast)  # Make ASTNodeTypes with associated SymbolType

    SwitchConverter().visit(ast)  # convert switch statement to if else

    StringToArray().visit(ast)  # Convert strings to arrays

    ArrayPreProcessor().visit(ast)  # Fill in any already known array indices (literal values)

    ArrayCleaner().visit(ast)  # Cleanup array stuff

    ASTTableCreator().visit(ast)  # Create the symbol table

    SizeOfTranslater().visit(ast)  # Resolve sizes of types

    if includeSTLIB:
        DynamicAllocation.add_allocation(ast)  # Add heap functions
    FileIO.add_io(ast)  # Add io functions

    StructCleanerAfter().visit(ast)  # Massage & Clean

    ASTCleanerAfter().visit(ast)  # Clean even more :)

    CheckRvalues().visit(ast)  # Check up semantics already

    ASTDereferencer().visit(ast)  # Correct the use of references & pointers into our format

    if symbol_file is not None:
        s = TableDotVisitor(symbol_file)  # Create symbol table
        s.visit(ast.root.getSymbolTable(), False)

    return ast, codegetter, includeSTDIO, comments


def Processing(ast, dot_file, fold, includeSTDIO, unused_var):
    ConstraintChecker(includeSTDIO).visit(ast)  # Checkup Semantic & Syntax Errors

    """
    It is vital that AST conversion occurs before constant folding
    """

    ASTConversion().visit(ast)  # Resolve types & add conversions as explicit

    UnarySaVisitor().visit(ast)  # Check up semantics for unary ops

    ConstantFoldingVisitor().visit(ast)  # Apply folding
    if fold:
        ValueAdderVisitor().visit(ast)  # Apply propagation
    ConstantStatementFolding().visit(ast)   # Fold simple statements and remove useless statements
    if unused_var:
        UnusedCleaner().visit(ast)  # Remove unused vars

    ScopeCleaner().visit(ast)  # Clean the use of scope nodes

    cfc = ControlFlowCreator()  # creates control flow graph
    cfc.visit(ast)

    DeadCodeRemover().visit(ast, cfc.getControlFlowGraph())  # removes dead code inside a block coming after a return/continue or break

    VoidReturnAdder().addReturn(cfc.getControlFlowGraph())  # Semantic analysis, to check all paths have a return (and implict void returns)

    if dot_file is not None:
        DotVisitor(dot_file).visit(ast)  # Export AST in Dot

    return ast, cfc.getControlFlowGraph()


def main(argv):
    """
    Main function to start program
    :param argv: Argument list as defined in the project description
    PRECONDITION: Given files should exist and be reachable from the compilers directory
    :return:
    """
    input_file = None  # Define some standard variables & settings
    dot_file = None
    symbol_file = None
    llvm_file = None
    mips_file = None
    fold = True
    control_flow_file = None
    unused_var = True

    for arg_index in range(1, len(argv), 2):  # Retrieve correct arguments
        param = argv[arg_index]
        arg = argv[arg_index + 1]
        if param == "--input":
            input_file = arg
        if param == "--render_ast":
            dot_file = arg
        elif param == "--render_symb":
            symbol_file = arg
        elif param == "--target_llvm":
            llvm_file = arg
        elif param == "--target_mips":
            mips_file = arg
        elif param == "--target_control_flow":
            control_flow_file = arg
        elif param == "--fold":
            if arg != 'True':
                fold = False
        elif param == "--unused_var":
            if arg != 'True':
                unused_var = False

    if input_file is None:
        ErrorExporter.StupidUser()

    ast, codegetter, includeSTDIO, comments = cleanGreen(input_file, symbol_file)  # Start AST cleanup & Dot Conversion
    ast, cfgs = Processing(ast, dot_file, fold, includeSTDIO, unused_var)  # Check for Errors , Apply Folding Techniques , ...
    if llvm_file is not None:
        LLVMSingleton.setName(input_file)

        to_llvm = AST2LLVM(codegetter, llvm_file, copy.deepcopy(comments))  # The codegetter is used to add the original code as comments
        to_llvm.visit(ast)

        if control_flow_file is not None:
            for function_name, cfg in cfgs.items():
                control_dot = ControlFlowDotVisitor(function_name, control_flow_file)  # Create a CFG
                control_dot.visit(cfg.root)
    codegetter.reset()
    if mips_file is not None:
        to_mips = AST2MIPS(codegetter, mips_file,
                           comments)  # The codegetter is used to add the original code as comments
        to_mips.visit(ast)

        if control_flow_file is not None:
            for function_name, cfg in cfgs.items():
                control_dot = ControlFlowDotVisitor(f"{function_name}_mips", control_flow_file, True)  # Create a CFG
                control_dot.visit(cfg.root)


if __name__ == '__main__':
    main(sys.argv)
    LLVMSingleton.getInstance().clear()
    MipsSingleton.getInstance().clear()
