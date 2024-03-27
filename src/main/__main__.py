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
from src.parser.ASTTableCreator import *
from src.llvm_target.AST2LLVM import *
from src.llvm_target.ControlFlow.ControlFlowDotVisitor import *
from src.TestFiles.ASTTests.AstLoader import *


def cleanGreen(input_file, symbol_file):
    """
    Standard function to generate parseTree & Export it to Dot
    :param input_file:
    :param symbol_file:
    :return:
    """
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

    codegetter = CodeGetter()  # Link each line of code to a line number
    codegetter.visit(ast)

    #DotVisitor('output/debug0').visit(ast)

    ASTTypedefReplacer().visit(ast)  # Replace all uses of typedefs

    ASTCleaner().visit(ast)  # Do a standard cleaning

    ASTTableCreator().visit(ast)  # Create the symbol table

    ASTCleanerAfter().visit(ast)  # Clean even more :)

    ASTDereferencer().visit(ast)  # Correct the use of references & pointers into our format

    if symbol_file is not None:
        s = TableDotVisitor(symbol_file)
        s.visit(ast.root.getSymbolTable(), True)

    return ast, codegetter


def Processing(ast, dot_file, fold):
    ConstraintChecker().visit(ast)  # Checkup Semantic & Syntax Errors

    if fold:
        ConstantFoldingVisitor().visit(ast)

    ASTConversion().visit(ast)

    #ValueAdderVisitor().visit(ast)

    if dot_file is not None:
        DotVisitor(dot_file).visit(ast)  # Export AST in Dot

    return ast


def main(argv, clang=False):
    """
    Main function to start program
    :param argv: Argument list as defined in the project description
    :param clang:
    :return:
    """

    input_file = "example_source_files/file0"  # Define some standard variables & settings
    dot_file = None
    symbol_file = None
    llvm_file = "output/output.ll"
    mips_file = None
    clang_file = "output/outputClang.ll"
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

    if clang:  # Generate a reference clang file
        subprocess.run(f"""clang-14 -S -emit-llvm {input_file} -o {clang_file}""",
                       shell=True, capture_output=True)

    ast, codegetter = cleanGreen(input_file, symbol_file)  # Start AST cleanup & Dot Conversion
    Processing(ast, dot_file, fold)  # Check for Errors , Apply Folding Techniques , ...

    LLVMSingleton.setName(input_file)
    to_llvm = AST2LLVM(codegetter, llvm_file)  # The codegetter is used to add the original code as comments
    to_llvm.visit(ast)

    if control_flow_file is not None:
        control_dot = ControlFlowDotVisitor(control_flow_file)  # Create a CFG
        control_dot.visit(to_llvm.getControlFlowGraph().root)


if __name__ == '__main__':
    main(sys.argv)
    LLVMSingleton.getInstance().clear()
