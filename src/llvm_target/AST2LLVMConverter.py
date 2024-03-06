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

        if node.text == "Declaration":
            self.handleDeclaration(node)

            if node.getChildAmount() == 2:
                text = self.handleAssignment(node)
            else:
                text = ""

        if node.text == "Assignment":
            text = self.handleAssignment(node)

        if node.text == "Function":
            self.map_table = MapTable(self.map_table)
            text = self.handleFunction(node)

        if node.text == "Dereference":
            text = self.handleDereference(node)


        """
        change value of the node
        """
        self.current.store(text, self.map_table)

    def visitNodeTerminal(self, node: ASTNodeTerminal):

        if node.type == "IDENTIFIER":
            entry = self.map_table.getEntry(node.text)

            """
            identifiers of declarations and functions are not yet defined
            """
            if entry is None:
                return

            self.current.register = entry.mem_register

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

    def handleDereference(self, node: ASTNode):
        addr_reg = self.current.getChild(0).register
        var_name = self.map_table.getEntry(addr_reg, True).entry
        s_e = node.getSymbolTable().getEntry(var_name)
        data_type, ptrs = s_e.getPtrTuple()

        entry = self.map_table.getEntry(var_name)

        """
        identifiers of declarations and functions are not yet defined
        """
        if entry is None:
            return

        text = Load.identifier(entry.mem_register, data_type, ptrs)
        return text
