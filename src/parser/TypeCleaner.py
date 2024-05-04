from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.ASTVisitor import ASTVisitor
from src.parser.AST import ASTNode, ASTNodeTerminal, AST, ASTNodeTypes
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.parser.CTypes.COperationHandler import RichnessChecker
from src.parser.Tables.SymbolTypeArray import *


types = ["BOOL", "CHAR", "INT", "FLOAT"]


class TypeCleaner(ASTVisitor):
    """
    This function convert all the 'Type' subtrees to a ASTTypeNode containing the type
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):

        self.cleanConversions(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def cleanConversions(self, node: ASTNode):
        """
        Check if the conversion to type, is already a ASTTypeNode, if not, we will convert it to such a type node
        """

        if node.text != "Type":
            return

        type_node = node
        if isinstance(type_node, ASTNodeTypes):
            return

        new_type_node = TypeNodeHandler.getInstance().typeToTypeNode(type_node)

        node.parent.replaceChild(type_node, new_type_node)



