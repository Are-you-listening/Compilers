from TestCases.ABCTests.abcTest import *
from src.parser.ASTConversion import ASTConversion
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
from src.parser.Constraints.ConstraintChecker import ConstraintChecker
from src.parser.ASTDereferencer import ASTDereferencer


class TestSemanticErrors(ASTTest, unittest.TestCase):
    """
    Test semantic errors
    """

    def execute(self, abstract_syntax_tree: AST):
        ASTDereferencer().visit(abstract_syntax_tree)  # Correct the use of references & pointers into our format
        ConstraintChecker(True).visit(abstract_syntax_tree)  # Checkup Semantic & Syntax Errors
        ConstantFoldingVisitor().visit(abstract_syntax_tree)
        ASTConversion().visit(abstract_syntax_tree)

    def test(self):
        ASTTest.AST_test(self, os.path.abspath(__file__))  # Call the baseClass function
