from antlr4 import *
from src.antlr_files.expressionLexer import expressionLexer
from src.antlr_files.expressionParser import expressionParser
from src.parser.ASTCreator import ASTCreator
from src.parser.DotVisitor import *
from src.parser.Constraints.ConstraintChecker import *
from src.parser.ValueAdderVisitor import *
from src.parser.ASTDereferencer import *
from src.parser.ASTConversion2 import *
from src.parser.ASTCleaner import *
from src.parser.ASTCleanerAfter import *
from src.parser.TableDotVisitor import *
from src.llvm_target.AST2LLVMConverter import *
from src.llvm_target.LLVMDotVisitor import *
from src.llvm_target.LLVMTableDotVisitor import *
from src.llvm_target.ControlFlow.ControlFlowDotVisitor import *
from src.parser.CodeGetter import *


def cleanGreen(input_file, dot_file, crashtest,symbol_file, codegetter):
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


def Processing(ast):
    constraint_checker = ConstraintChecker()  # Checkup Semantic & Syntax Errors
    constraint_checker.visit(ast)

    cfv = ConstantFoldingVisitor()
    cfv.visit(ast)

    v = ValueAdderVisitor()
    v.visit(ast)

    ast_conv = ASTConversion2()
    ast_conv.postorder(ast.root)

    d = DotVisitor("output/debug1")  # Export AST in Dot
    d.visit(ast)

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

    codegetter = CodeGetter()

    ast = cleanGreen(input_file, dot_file, crashTest, symbol_file, codegetter)  # Start AST cleanup & Dot Conversion

    Processing(ast)  # Check for Errors , Apply Folding Techniques , ...

    if not crashTest:
        d = DotVisitor(dot_file)  # Export AST in Dot
        d.visit(ast)

        d2 = TableDotVisitor(symbol_file, False)  # Export Symbol Table
        d2.visit(ast.root.getSymbolTable())

    print("LLVM")
    # the codegetter is used to add the original code as comments
    to_llvm = AST2LLVMConverter(codegetter)
    to_llvm.visit(ast)
    llvm = to_llvm.getRoot()
    llvm_dot = LLVMDotVisitor(llvm_dot_file)
    llvm_dot.visit(llvm)
    llvm_table = LLVMTableDotVisitor(llvm_map_file, False)
    llvm_table.visit(llvm)

    control_dot = ControlFlowDotVisitor("output/ControlFlow")
    control_dot.visit(to_llvm.control_flow_graph.root)



if __name__ == '__main__':
    main(sys.argv)
