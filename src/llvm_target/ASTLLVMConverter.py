from src.parser.ASTVisitor import *
from src.llvm_target.LLVMTree import *
from src.llvm_target.output_string_generator import *


class ASTLLVMConverter(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self):
        self.parent: LLVMNode = LLVMNode("root node header text", None)
        self.root = self.parent

    def visit(self, ast: AST):
        self.parent: LLVMNode = LLVMNode("root node header text", None)
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
        text = "empty placeholder"
        if node.text == "Declaration":
            text = self.handleDeclaration(node)

        llvm_node = LLVMNode(text, self.parent)
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

        return Declaration.declare(data_type, ptrs)

    def getRoot(self):
        return self.root