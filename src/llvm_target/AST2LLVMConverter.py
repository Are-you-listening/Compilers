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
        self.current: LLVMNode = LLVMNode("", None, self.map_table)
        self.root = self.current
        self.last_function = self.root

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.current: LLVMNode = LLVMNode("", None, self.map_table)
        self.root = self.current
        self.last_function = self.root

        root = ast.root
        self.postorder(root)

    def postorder(self, root: ASTNode):
        """
        override default postorder
        """

        """
        create dummy nodes
        """
        dummy_node = LLVMNode("", self.current, self.map_table)
        self.current.addChild(dummy_node)
        self.current = dummy_node

        """
        store function on last function position
        """
        if root.text == "Function":
            self.last_function = self.current

        for child in root.children:
            self.postorder(child)
        root.accept(self)

        self.current = self.current.getParent()

    def visitNode(self, node: ASTNode):
        text = ""
        self.map_table = MapTable(self.map_table)

        if node.text == "Declaration":
            self.handleDeclaration(node)

            if node.getChildAmount() == 2:
                text = self.handleAssignment(node)
            else:
                text = ""

        if node.text == "Assignment":
            text = self.handleAssignment(node)

        if node.text == "Function":
            text = self.handleFunction(node)

        """
        change value of the node
        """
        self.current.store(text, self.map_table)

        """
        some after processing
        """

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.map_table = MapTable(self.map_table)

        self.current.store("temp", self.map_table)

    def handleDeclaration(self, node):
            """
            ask the var type, and search its value in the symbol table
            """
            var_child: ASTNode = node.getChild(0)
            data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()
            """
            all children of type_child are terminals
            """
            text, register = Declaration.declare(data_type, ptrs)

            """
            add the allocation to the start of the function
            """
            self.geCurrentFunction().addText(text)

            """
            add value to map to map var to address register
            """
            self.map_table.addEntry(MapEntry(var_child.text, register))

    def handleFunction(self, node: ASTNode):
        var_child: ASTNode = node.getChild(0)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()

        text = Declaration.function(var_child.text, data_type, ptrs)

        """
        add value to map to map var to address register
        """
        return text

    def getRoot(self):
        return self.root

    def geCurrentFunction(self) -> LLVMNode:
        return self.last_function

    def handleAssignment(self, node: ASTNode):
        return "assignment"
