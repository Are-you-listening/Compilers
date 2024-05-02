from TestCases.ABCTests.abcTest import *
from src.parser.DeadCodeRemover import *
from src.llvm_target.ControlFlowCreator import *


class TestDeadCodeRemover(ASTTest, unittest.TestCase):
    """
    Test removal of dead code
    """

    def execute(self, abstract_syntax_tree: AST):
        LLVMSingleton.getInstance().clear()  # Make sure to reset the singleton service
        cfc = ControlFlowCreator()
        cfc.visit(abstract_syntax_tree)
        DeadCodeRemover().visit(abstract_syntax_tree, cfc.getControlFlowGraph())  # removes dead code inside a block coming after a return/continue or break

    def test(self):
        ASTTest.AST_test(self, os.path.abspath(__file__))  # Call the baseClass function
