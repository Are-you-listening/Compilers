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
from src.parser.TableDotVisitor import *
from src.llvm_target.AST2LLVM import *
from src.llvm_target.ControlFlow.ControlFlowDotVisitor import *
from src.parser.CodeGetter import *


def cleanGreen(input_file, symbol_file, codegetter):
    """
    Standard function to generate parseTree & Export it to Dot
    :param input_file:
    :param dot_file:
    :param symbol_file:
    :param codegetter:
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

    codegetter.visit(ast)

    astcleaner = ASTCleaner()  # Do a standard cleaning
    astcleaner.visit(ast)

    astcleanerafter = ASTCleanerAfter()  # Do a standard cleaning
    astcleanerafter.visit(ast)

    ast_deref = ASTDereferencer()  # Correct the use of references & pointers into our format
    ast_deref.visit(ast)

    s = TableDotVisitor(symbol_file)
    s.visit(ast.root.getSymbolTable())

    return ast


def Processing(ast, dot_file, fold):
    constraint_checker = ConstraintChecker()  # Checkup Semantic & Syntax Errors
    constraint_checker.visit(ast)

    if fold:
        cfv = ConstantFoldingVisitor()
        cfv.visit(ast)

    v = ValueAdderVisitor()
    v.visit(ast)

    ast_conv = ASTConversion()
    ast_conv.visit(ast)

    d = DotVisitor(dot_file)  # Export AST in Dot
    d.visit(ast)

    return ast


def main(argv, clang=False):
    """
    Main function to start program
    :param argv: Argument list as defined in the project description
    :param fold:
    :param clang:
    :return:
    """

    input_file = "example_source_files/file0"  # Define some standard variables & settings
    dot_file = "output/ASTvisual"
    symbol_file = "output/SymbolTablevisual"
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

    codegetter = CodeGetter()  # Link each line of code to a line number
    ast = cleanGreen(input_file, symbol_file, codegetter)  # Start AST cleanup & Dot Conversion
    Processing(ast, dot_file, fold)  # Check for Errors , Apply Folding Techniques , ...

    LLVMSingleton.setName(input_file)
    to_llvm = AST2LLVM(codegetter, llvm_file)  # The codegetter is used to add the original code as comments
    to_llvm.visit(ast)

    if control_flow_file is not None:
        control_dot = ControlFlowDotVisitor(control_flow_file)  # Create a CFG
        control_dot.visit(to_llvm.control_flow_graph.root)


if __name__ == '__main__':
    main(sys.argv)
    LLVMSingleton.getInstance().clear()

