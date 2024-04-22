from TestCases.ABCTests.abcTest import *
from src.parser.SwitchConverter import *


class TestSwitchConversions(ASTTest, unittest.TestCase):
    """
    Test switch stament conversions
    """

    def execute(self, abstract_syntax_tree: AST):
        SwitchConverter().visit(abstract_syntax_tree)  # convert switch statement to if else

    def test(self):
        ASTTest.ASTtest(self, os.path.abspath(__file__))  # Call the baseClass function
