from TestCases.ABCTests.abcTest import *
from src.parser.ASTTableCreator import *
from src.parser.ASTCleaner import *
from src.parser.StructCleaner import StructCleaner
from src.parser.StructCleanerAfter import StructCleanerAfter


class TestTypedef(ASTTest, unittest.TestCase):
    """
    Test typedef workings
    """

    def execute(self, abstract_syntax_tree: AST):
        ASTTypedefReplacer().visit(abstract_syntax_tree)  # Replace all uses of typedefs
        ASTCleaner().visit(abstract_syntax_tree)  # Do a standard cleaning
        ASTTableCreator().visit(abstract_syntax_tree)  # Create the symbol table

    def test(self):
        ASTTest.AST_test(self, os.path.abspath(__file__))  # Call the baseClass function
