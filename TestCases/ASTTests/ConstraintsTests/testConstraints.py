from src.parser.Constraints.ConstraintChecker import *
from TestCases.ABCTests.abcTest import *


class TestConstraints(ASTTest, unittest.TestCase):
    """
    Test all the constraints (part of the Semantic Analyses)
    """

    def execute(self, abstract_syntax_tree: AST):
        ConstraintChecker(True).visit(abstract_syntax_tree)

    def test(self):
        ASTTest.AST_test(self, os.path.abspath(__file__))  # Call the baseClass function
