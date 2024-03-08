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

        """
        Visit function to construct LLVM
        :param node:
        :return:
        """

        """
        only change dummy nodes
        """
        if not self.current.dummy:
            return

        if node.text == "Declaration":
            self.handleDeclaration(node)

        if node.text == "Assignment":
            self.handleAssignment(node)

        if node.text == "Function":
            self.map_table = MapTable(self.map_table)
            self.handleFunction(node)

        if node.text == "Dereference":
            self.handleDereference(node)
        if node.text == "Comment":
            self.handleComment(node)


    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            entry = self.map_table.getEntry(node.text)

            """
            identifiers of declarations and functions are not yet defined
            """
            if entry is None:
                return

            data_type, ptrs = node.getSymbolTable().getEntry(node.text).getPtrTuple()

            self.current.register = entry.mem_register
            self.current.type_tup = (data_type, ptrs)

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

        """
        see assignment to declaration as assignment
        """
        if node.getChildAmount() == 2:
            self.handleAssignment(node)


    def handleFunction(self, node: ASTNode):
        var_child: ASTNode = node.getChild(0)
        data_type, ptrs = var_child.getSymbolTable().getEntry(var_child.text).getPtrTuple()

        text = Declaration.function(var_child.text, data_type, ptrs)

        """
        add value to map to map var to address register
        """
        self.current.store(text, self.map_table)

    def getRoot(self):
        return self.root

    def geCurrentFunction(self) -> LLVMNode:
        return self.last_function

    def handleAssignment(self, node: ASTNode):
        left_child = node.getChild(0)
        store_reg = self.map_table.getEntry(left_child.text).mem_register
        right_child = self.current.getChild(1)

        dt, ptr = left_child.getSymbolTable().getEntry(left_child.text).getPtrTuple()
        if right_child.register is None:
            """
            store literal
            """
            text = Declaration.assignmentLiteral(store_reg, node.getChild(1).text, dt, ptr)
        else:
            text = Declaration.assignment(store_reg, right_child.register, dt, ptr)

        self.current.store(text, self.map_table)

    def handleDereference(self, node: ASTNode):
        """
        Handle a dereference
        :param datatype_tup:
        :param node:
        :return:
        """
        addr_reg = self.current.getChild(0).register

        data_type, ptrs = self.current.getChild(0).type_tup

        """
        get the var register
        """

        text, new_reg = Load.identifier(addr_reg, data_type, ptrs)
        self.current.store(text, self.map_table)
        self.current.register = new_reg
        self.current.type_tup = (data_type, ptrs[:-1])

        if node.parent.text == "Dereference":
            """
            call recursively but remove 1 ptr
            """
            temp_current = self.current
            self.current = self.current.getParent()
            self.handleDereference(node.parent)
            self.current = temp_current
    def handleComment(self, node: ASTNode):
        self.current.store(node.children[0].text, self.map_table)