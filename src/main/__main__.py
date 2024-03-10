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
from src.llvm_target.AST2LLVMConverter import *
from src.llvm_target.LLVMDotVisitor import *
from src.llvm_target.LLVMTableDotVisitor import *


def cleanGreen(input_file, dot_file, crashtest):
    """
    Standard function to generate parseTree & Export it to Dot
    :param input_file:
    :param dot_file:
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

    astcleaner = ASTCleaner()  # Do a standard cleaning
    astcleaner.visit(ast)

    astcleanerafter = ASTCleanerAfter()  # Do a standard cleaning
    astcleanerafter.visit(ast)

    d = DotVisitor("output/debug0")  # Export AST in Dot
    d.visit(ast)

    ast_deref = ASTDereferencer()  # Correct the use of references & pointers
    ast_deref.visit(ast)

    d = DotVisitor("output/debug1")  # Export AST in Dot
    d.visit(ast)

    return ast


def Processing(ast):
    constraint_checker = ConstraintChecker()  # Checkup Semantic & Syntax Errors
    constraint_checker.visit(ast)


    cfv = ConstantFoldingVisitor()
    cfv.visit(ast)

    v = ValueAdderVisitor()
    v.visit(ast)

    ast_conv = ASTConversion()
    ast_conv.visit(ast)
    return ast


def LLVM():
    pass


def MIPS():
    pass


def main(argv,crashTest=False):
    """
    Main function to start program
    :param argv:
    :return:
    """

    input_file = "example_source_files/file0"  # Define some standard variables & settings
    dot_file = "output/ASTvisual"
    symbol_file = "output/SymbolTablevisual"
    llvm_dot_file = "output/LLVM"
    llvm_map_file = "output/LLVMMap"
    llvm_file = None
    mips_file = None

    for arg_index in range(1, len(argv), 2):  # Retrieve correct arguments
        param = argv[arg_index]
        arg = argv[arg_index + 1]
        if param == "--input":
            input_file = arg
        if param == "--render_ast":
            dot_file = arg
        elif param == "--render_symb":
            symbol_file = arg
        elif param == "--render_symb":
            llvm_file = arg
        elif param == "--target_mips":
            mips_file = arg

    ast = cleanGreen(input_file, dot_file, crashTest)  # Start AST cleanup & Dot Conversion

    Processing(ast)  # Check for Errors , Apply Folding Techniques , ...

    if not crashTest:
        d = DotVisitor(dot_file)  # Export AST in Dot
        d.visit(ast)

        d2 = TableDotVisitor(symbol_file, False)  # Export Symbol Table
        d2.visit(ast.root.getSymbolTable())

    print("LLVM")
    to_llvm = AST2LLVMConverter()
    to_llvm.visit(ast)
    llvm = to_llvm.getRoot()
    llvm_dot = LLVMDotVisitor(llvm_dot_file)
    llvm_dot.visit(llvm)
    llvm_table = LLVMTableDotVisitor(llvm_map_file, False)
    llvm_table.visit(llvm)


if __name__ == '__main__':
    main(sys.argv)
