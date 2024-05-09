from src.parser.ErrorExporter import *
from src.parser.ASTVisitor import *
from src.parser.SwitchConverter import SwitchConverter
from src.internal_tools import PreConditions
from src.parser.AST import ASTNodeTypes
from src.parser.Tables.SymbolTypePtr import SymbolTypePtr
from src.parser.Tables.SymbolTypeArray import SymbolTypeArray
import copy
from src.parser.Utils.ArraySizeReader import ArraySizeReader
from src.parser.SwitchConverter import SwitchConverter
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor

class ArrayPreProcessor(ASTVisitor):
    """
    We are required to fill in int b[a], if a is a const integer, this preprocessor will fill in this information
    """
    def __init__(self):
        self.scope_map = {}

    def visit(self, ast: AST):
        self.scope_map = {}
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        self.check_declare(node)
        self.check_array(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
    
    @staticmethod
    def get_parent_scope(node: ASTNode):
        temp = node
        while temp.text not in ("Function", "Code", "Scope", "Start"):
            temp = temp.parent
            
        return temp

    def check_declare(self, node: ASTNode):
        if node.text != "Declaration" or node.getChildAmount() != 3:
            return
        symbol_type = node.getChild(0).symbol_type
        if symbol_type.getPtrAmount() > 0 or symbol_type.getBaseType() != "INT" or not symbol_type.isConst():
            return

        """
        Keep track of const identifiers
        """
        self.scope_map[node.getChild(1).text] = node.getChild(2)

    def check_array(self, node: ASTNode):
        """
        Replace array identifiers

        """
        if node.text != "Declaration" or node.getChildAmount() < 3:
            return
        if node.getChild(2).text != "ARRAY":
            return

        for c in node.getChild(2).children:
            if c.text != "ArrayIndex":
                continue

            value = c.getChild(0)
            if not isinstance(value, ASTNodeTerminal) or value.type != "IDENTIFIER":
                ConstantFoldingVisitor().visit(AST(c))
                continue
            if value.text in self.scope_map:

                c.replaceChild(value, SwitchConverter.createCopy(self.scope_map[value.text]))

            ConstantFoldingVisitor().visit(AST(c))
