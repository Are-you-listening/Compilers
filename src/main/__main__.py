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
from src.parser.ASTTableCreator import *
from src.llvm_target.AST2LLVM import *
from src.llvm_target.ControlFlow.ControlFlowDotVisitor import *
from src.parser.ASTIfCleaner import ASTIfCleaner
from src.llvm_target.ControlFlowCreator import *
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


def cleanGreen(input_file, symbol_file):
    """
    Standard function to generate parseTree & Export it to Dot
    :param input_file:
    :param symbol_file:
    :return:
    """
    input_stream = FileStream(input_file)  # Create input stream
    lexer = grammarCLexer(input_stream)

    lexer.removeErrorListeners()  # Add our own error listener
    lexer.addErrorListener(EListener())

    stream = CommonTokenStream(lexer)  # Extract tokens

    includeSTDIO, stream = PreProcessor(stream, lexer, input_file).preProcess()  # Apply preprocessing

    parser = grammarCParser(stream)  # Do actual parse
    parser.removeErrorListeners()  # Add our own error Listener
    parser.addErrorListener(EListener())
    tree = parser.start_()

    toAST = ASTCreator(lexer)  # Create Actual AST
    toAST.visit(tree)
    ast = toAST.getAST()

    virtualLine = VirtualLineVisitor()
    virtualLine.visit(ast)

    BlacklistVisitor().visit(ast)

    codegetter = CodeGetter()  # Link each line of code to a line number
    codegetter.visit(ast)

    structTable = StructCleaner().visit(ast)  # Massage the structs

    EnumConverter().visit(ast)  # Convert enum to typedef & const bools
    TypeMerger().visit(ast)  # Reformat enum & struct declarations to our format

    ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

    ASTIfCleaner().visit(ast)  # Do a cleanup of the if statements
    ASTLoopCleaner().visit(ast)  # Cleanup For/While loops

    ASTCleaner().visit(ast)  # Do a standard cleaning

    SwitchConverter().visit(ast)  # convert switch statement to if else

    StringToArray().visit(ast)

    FunctionPtrCleaner().visit(ast) #  cleans the function ptrs

    #DotVisitor("output/debug5").visit(ast)  # Export AST in Dot
    ArrayCleaner().visit(ast)

    ASTTableCreator().visit(ast)  # Create the symbol table

    #DotVisitor("output/debug0").visit(ast)  # Export AST in Dot

    StructCleanerAfter(structTable).visit(ast)

    ASTCleanerAfter().visit(ast)  # Clean even more :)

    ASTDereferencer().visit(ast)  # Correct the use of references & pointers into our format

    if symbol_file is not None:
        s = TableDotVisitor(symbol_file)
        s.visit(ast.root.getSymbolTable(), True)

    return ast, codegetter, includeSTDIO, structTable


def Processing(ast, dot_file, fold, includeSTDIO, structTable):
    ConstraintChecker(includeSTDIO).visit(ast)  # Checkup Semantic & Syntax Errors

    #DotVisitor("output/debug1").visit(ast)  # Export AST in Dot


    """
    It is vital that AST conversion occurs before constant folding
    """
    ASTConversion(structTable).visit(ast)

    #DotVisitor("output/debug2").visit(ast)  # Export AST in Dot

    if fold:
        ConstantFoldingVisitor().visit(ast)

    #DotVisitor("output/debug3").visit(ast)  # Export AST in Dot

    ValueAdderVisitor().visit(ast)

    #DotVisitor("output/debug4").visit(ast)  # Export AST in Dot

    ConstantStatementFolding().visit(ast)

    #DotVisitor("output/debug5").visit(ast)  # Export AST in Dot

    cfc = ControlFlowCreator()
    cfc.visit(ast)

    #DotVisitor("output/debug6").visit(ast)  # Export AST in Dot

    DeadCodeRemover().visit(ast)  # removes dead code inside a block coming after a return/continue or break

    #DotVisitor("output/debug7").visit(ast)  # Export AST in Dot

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

    if input_file is None:
        ErrorExporter.StupidUser()

    ast, codegetter, includeSTDIO, structTable = cleanGreen(input_file, symbol_file)  # Start AST cleanup & Dot Conversion
    ast, cfgs = Processing(ast, dot_file, fold, includeSTDIO, structTable)  # Check for Errors , Apply Folding Techniques , ...

    if llvm_file is not None:
        LLVMSingleton.setName(input_file)

        to_llvm = AST2LLVM(codegetter, llvm_file)  # The codegetter is used to add the original code as comments
        to_llvm.visit(ast)

        if control_flow_file is not None:
            for function_name, cfg in cfgs.items():
                control_dot = ControlFlowDotVisitor(f"{control_flow_file}_{function_name}")  # Create a CFG
                control_dot.visit(cfg.root)


if __name__ == '__main__':
    main(sys.argv)
    LLVMSingleton.getInstance().clear()
