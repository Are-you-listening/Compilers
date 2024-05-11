
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

    def postorder(self, root: ASTNode):
        """
        override default postorder
        """

        """
        store function on last function position
        """

        stack = [root]
        visited = set()
        while len(stack) > 0:
            current_node = stack[-1]  # get top of stack without popping it

            if current_node.text == "Function" and current_node not in visited:
                visited.add(current_node)

                self.handleFunction(current_node)
                self.map_table = MapTable(self.map_table)

                function = MipsSingleton.getInstance().getFunction(current_node.getChild(0).text)
                MipsSingleton.getInstance().setLastFunction(function)

            child_not_visited = False
            for child in reversed(current_node.getChildren()):
                if child not in visited:
                    stack.append(child)
                    child_not_visited = True
            if not child_not_visited:
                current_node.accept(self)
                stack.pop()

            visited.add(current_node)

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

        if node.getChildAmount() == 2:
            self.handleAssignment(node)

    def handleAssignment(self, node):
        store_reg = 1
        to_store = 5

        Declaration.assignment(store_reg, to_store, 4)

    def __del__(self):
        print(MipsSingleton.getInstance().getModule().toString())

    def handleFunction(self, node: ASTNode):
        function_name = node.getChild(0).text

        mips_module = MipsSingleton.getInstance().getModule()
        function = mips_module.createFunction(function_name)

        current_table = node.getSymbolTable()
        symbol_entry = current_table.getEntry(function_name, node.position.virtual_linenr)

        self.map_table.addEntry(MapEntry(function_name, function), symbol_entry)
