
from src.parser.ASTVisitor import ASTVisitor
from src.parser.AST import ASTNode, ASTNodeTerminal, ASTNodeTypes
from src.internal_tools import *
import typing


class SizeOfTranslater(ASTVisitor):
    """
    Convert SizeOf expressions, to an integer indicating the size of this type
    """

    def visitNode(self, node: ASTNode):
        if node.text != "SizeOf":
            return

        PreConditions.assertEqual(node.getChildAmount(), 2)

        richt_child = node.getChild(1)

        if isinstance(richt_child, ASTNodeTypes):
            richt_type = typing.cast(ASTNodeTypes, richt_child)
            symbol_type = richt_type.symbol_type
        else:
            symbol_type = richt_child.getSymbolTable().getEntry(richt_child.text).getTypeObject()

        byte_amount = symbol_type.getBytesUsed()

        """
        Make a terminal node having the amount of bytes this type uses
        """
        ast_terminal = ASTNodeTerminal(byte_amount, node.parent, node.getSymbolTable(), "INT",
                                       node.position, node.structTable)

        """
        Remove the size of and replace it by the int
        """
        node.parent.replaceChild(node, ast_terminal)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
