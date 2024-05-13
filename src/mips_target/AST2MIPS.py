
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
        Visit function to construct Mips code
        :param node:
        :return:
        """
        if node.text == "Declaration":
            self.handleDeclaration(node)

        if node.text == "Parameters":
            self.handleParameters(node)

        if node.text == "Function":
            self.map_table = self.map_table.prev

        if node.text == "Dereference":
            self.handleDereference(node)

        if node.text == "Assignment":
            self.handleAssignment(node)

        if node.text == "printf":
            self.handlePrintScanf(node, True)

        if node.text == "scanf":
            self.handlePrintScanf(node, False)

        if node.text == "Expr":
            self.handleOperations(node)

        if node.text == "Conversion":
            self.handleConversions(node)

        if node.text == "Return":
            self.handleReturn(node)

        if node.text == "ParameterCalls":
            self.handleParameterCalls(node)

        if node.text == "ParameterCall":
            self.llvm_map[node] = self.llvm_map[node.getChild(0)]

        if node.text not in ("Parameters"):
            self.addOriginalCodeAsComment(node)

        self.handleComment(node)

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
        #for comment in self.comments:  # Add any leftover comments
        #    Declaration.addComment(self.comments[comment])

        with open(self.fileName, 'w') as f:
            f.write(str(MipsSingleton.getInstance().getModule().toString()))
        print(MipsSingleton.getInstance().getModule().toString())

    def handleFunction(self, node: ASTNode):
        function_name = node.getChild(0).text

        mips_module = MipsSingleton.getInstance().getModule()
        function = mips_module.createFunction(function_name)

        current_table = node.getSymbolTable()
        symbol_entry = current_table.getEntry(function_name, node.position.virtual_linenr)

        self.map_table.addEntry(MapEntry(function_name, function), symbol_entry)

    def handleComment(self, node):
        pass

    def handleParameterCalls(self, node: ASTNode):
        pass

    def handleAssignment(self, node: ASTNode):
        pass

    def handleDereference(self, node: ASTNode):
        pass

    def handleReturn(self, node: ASTNode):
        pass

    def handlePrintScanf(self, node: ASTNode, printf):
        pass

    def handleOperations(self, node: ASTNode):
        pass

    def handleConversions(self, node: ASTNode):
        pass

    def handleParameters(self, node: ASTNode):
        pass

    def addOriginalCodeAsComment(self, node: ASTNode):
        pass

    def handle_IO(self):
        pass
