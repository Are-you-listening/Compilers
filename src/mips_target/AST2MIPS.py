
from src.parser.Tables.SymbolTypeStruct import *
from src.llvm_target.MapTable import *
from src.parser.CodeGetter import *

from src.parser.AST import ASTNodeBlock, ASTNodeTypes
from src.internal_tools import PreConditions
from src.mips_target.MipsSingleton import MipsSingleton
from src.mips_target.OutputMIPSGenerator import *


class AST2MIPS(ASTVisitor):
    def __init__(self, codegetter: CodeGetter, fileName, comments):
        self.map_table = MapTable(None)
        self.mips_map = {}
        self.root = None

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.mips_map = {}

        self.root = ast.root
        self.postorder(self.root)

    def visitNode(self, node: ASTNode):
        """
        Visit function to construct LLVM
        :param node:
        :return:
        """

        if node.text == "Declaration":
            self.handleDeclaration(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            pass

    def handleDeclaration(self, node):
        """
        ask the var type, and search its value in the symbol table
        """
        var_child: ASTNode = node.getChild(0)
        entry = var_child.getSymbolTable().getEntry(var_child.text)

        register = Declaration.declare(entry.getTypeObject(), var_child.text)

        if node.getChildAmount() == 2 and not var_child.symbol_table.isRoot():
            self.handleAssignment(node)

    def handleAssignment(self, node):

        store_reg = 1

        #Declaration.assignment(store_reg, to_store_reg, alignment)