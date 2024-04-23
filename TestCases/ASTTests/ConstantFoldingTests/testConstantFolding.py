from TestCases.ABCTests.abcTest import *
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor


class TestConstantFolding(ASTTest, unittest.TestCase):
    """
    Test the ConstantFolding visitor
    """

    def execute(self, abstract_syntax_tree: AST):
        ConstantFoldingVisitor().visit(abstract_syntax_tree)

    def test(self):
        ASTTest.AST_test(self, os.path.abspath(__file__))  # Call the baseClass function
