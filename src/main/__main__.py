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
from src.parser.EnumTypeMerger import *
from src.parser.VirtualLineNrVisitor import *
from src.parser.ArrayCleaner import ArrayCleaner
from src.parser.DefineConverter import *
from src.parser.EnumConverter import *

def cleanGreen(input_file, symbol_file):
    """
    Standard function to generate parseTree & Export it to Dot
    :param input_file:
    :param symbol_file:
    :return:
    """
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

    codegetter = CodeGetter()  # Link each line of code to a line number
    codegetter.visit(ast)

    #DotVisitor("output/debug0").visit(ast)  # Export AST in Dot

    DefineConverter().visit(ast)  # Convert simple defines to typedefs & const values

    EnumConverter().visit(ast)  # Convert enum to typedef & const bools
    EnumTypeMerger().visit(ast)  # Reformat enum declarations to our format

    #DotVisitor("output/debug1").visit(ast)  # Export AST in Dot

    ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

    ASTIfCleaner().visit(ast)  # Do a cleanup of the if statements
    ASTLoopCleaner().visit(ast)  # Cleanup For/While loops

    ASTCleaner().visit(ast)  # Do a standard cleaning

    SwitchConverter().visit(ast)  # convert switch statement to if else
    #DotVisitor("output/i9").visit(ast)  # Export AST in Dot

    ArrayCleaner().visit(ast)
    #DotVisitor("output/u8").visit(ast)  # Export AST in Dot

    ASTTableCreator().visit(ast)  # Create the symbol table
    #DotVisitor("output/vss").visit(ast)  # Export AST in Dot


    ASTCleanerAfter().visit(ast)  # Clean even more :)

    ASTDereferencer().visit(ast)  # Correct the use of references & pointers into our format

    if symbol_file is not None:
        s = TableDotVisitor(symbol_file)
        s.visit(ast.root.getSymbolTable(), True)

    return ast, codegetter


def Processing(ast, dot_file, fold):
    #DotVisitor("output/debug1").visit(ast)  # Export AST in Dot

    ConstraintChecker().visit(ast)  # Checkup Semantic & Syntax Errors

    if fold:
        ConstantFoldingVisitor().visit(ast)

    ASTConversion().visit(ast)

    ValueAdderVisitor().visit(ast)

    ConstantStatementFolding().visit(ast)

    cfc = ControlFlowCreator()
    cfc.visit(ast)

    DeadCodeRemover().visit(ast)  # removes dead code inside a block coming after a return/continue or break

    if dot_file is not None:
        DotVisitor(dot_file).visit(ast)  # Export AST in Dot
    return ast, cfc.getControlFlowGraph()


def main(argv):
    """
    Main function to start program
    :param argv: Argument list as defined in the project description
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

    ast, codegetter = cleanGreen(input_file, symbol_file)  # Start AST cleanup & Dot Conversion
    ast, cfg = Processing(ast, dot_file, fold)  # Check for Errors , Apply Folding Techniques , ...

    if llvm_file is not None:
        LLVMSingleton.setName(input_file)

        to_llvm = AST2LLVM(codegetter, llvm_file)  # The codegetter is used to add the original code as comments
        to_llvm.visit(ast)

        if control_flow_file is not None:
            control_dot = ControlFlowDotVisitor(control_flow_file)  # Create a CFG
            control_dot.visit(cfg.root)


if __name__ == '__main__':
    main(sys.argv)
    LLVMSingleton.getInstance().clear()
