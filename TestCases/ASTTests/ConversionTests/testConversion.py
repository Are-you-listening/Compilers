from TestCases.ABCTests.abcTest import *
from src.parser.ASTConversion import ASTConversion


class TestConversion(ASTTest, unittest.TestCase):
    """
    Test the Conversion Visitor
    """

    def execute(self, abstract_syntax_tree: AST):
        ASTConversion().visit(abstract_syntax_tree)

    def test(self):
        ASTTest.ASTtest(self, os.path.abspath(__file__))  # Call the baseClass function
