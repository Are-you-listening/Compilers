from TestCases.ABCTests.abcTest import *
from src.parser.ValueAdderVisitor import *


class TestValueAdder(ASTTest, unittest.TestCase):
    """
    Test the ValueAdder visitor
    """

    def execute(self, abstract_syntax_tree: AST):
        ValueAdderVisitor().visit(abstract_syntax_tree)

    def test(self):
        ASTTest.ASTtest(self, os.path.abspath(__file__))  # Call the baseClass function
