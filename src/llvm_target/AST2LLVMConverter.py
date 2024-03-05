from src.parser.ASTVisitor import *
from src.llvm_target.LLVMTree import *
from src.llvm_target.OutputStringGenerator import *
from src.llvm_target.MapTable.MapTable import *


class AST2LLVMConverter(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self):
        self.map_table = MapTable(None)
        self.parent: LLVMNode = LLVMNode("", None, self.map_table)
        self.root = self.parent

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.parent: LLVMNode = LLVMNode("", None, self.map_table)
        self.root = self.parent

        super().visit(ast)

    def preorder(self, root: ASTNode):
        """
        override default preorder
        """
        root.accept(self)
        for child in root.children:
            self.preorder(child)
        if isinstance(root, ASTNodeTerminal):
            return

        self.parent = self.parent.getParent()

    def visitNode(self, node: ASTNode):
        text = ""
        self.map_table = MapTable(self.map_table)

        if node.text == "Declaration":
            text = self.handleDeclaration(node)

        if node.text == "Function":
            text = self.handleFunction(node)

        llvm_node = LLVMNode(text, self.parent, self.map_table)
        self.parent.addChild(llvm_node)
        self.parent = llvm_node

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def handleDeclaration(self, node):
        """
        ask the var type, and search its value in the symbol table
        """
        var_child: ASTNode = node.getChild(1)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()
        """
        all children of type_child are terminals
        """
        text, register = Declaration.declare(data_type, ptrs)

        """
        add value to map to map var to address register
        """
        self.map_table.addEntry(MapEntry(var_child.text, register))
        return text

    def handleFunction(self, node):
        var_child: ASTNode = node.getChild(1)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()

        text = Declaration.function(var_child.text, data_type, ptrs)

        """
        add value to map to map var to address register
        """
        return text

    def getRoot(self):
        return self.root
