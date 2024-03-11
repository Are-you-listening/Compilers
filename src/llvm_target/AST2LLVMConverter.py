from src.parser.ASTVisitor import *
from src.llvm_target.LLVMTree import *
from src.llvm_target.OutputStringGenerator import *
from src.llvm_target.MapTable.MapTable import *
from src.llvm_target.ControlFlow.ControlFlowGraph import *


class AST2LLVMConverter(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self):
        self.map_table = MapTable(None)
        self.current: LLVMNode = LLVMNode("", None, self.map_table)
        self.root = self.current
        self.last_function = self.root
        self.control_flow_graph = ControlFlowGraph()

    def visit(self, ast: AST):
        self.map_table = MapTable(None)
        self.current: LLVMNode = LLVMNode("", None, self.map_table)
        self.root = self.current
        self.last_function = self.root
        self.control_flow_graph = ControlFlowGraph()

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

        """
        end an eval of the control flow
        """
        if node.text not in ("Expr", "Literal", "Dereference"):
            if self.control_flow_graph.isEval():
                pass
                self.control_flow_graph.endEval()

        if node.text == "Declaration":
            self.handleDeclaration(node)

        if node.text == "Assignment":
            self.handleAssignment(node)

        if node.text == "Function":
            self.map_table = MapTable(self.map_table)
            self.handleFunction(node)

        if node.text == "Dereference":
            self.handleDereference(node)

        if node.text == "Expr":
            self.handleOperations(node)

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

    def handleOperations(self, node: ASTNode):
        """
        Handle Arithmetic operations
        :param node:
        :return:
        """
        text = ""
        new_reg = -1
        left = None

        if node.getChildAmount() == 2:
            operator = node.getChild(0).text

            left = self.current.getChild(1)
            text, new_reg = Calculation.unary(left.register, operator, left.type_tup[0], left.type_tup[1])
        if node.getChildAmount() == 3:

            operator = node.getChild(1).text

            """
            do special ControlFlow changes for logical operations
            """
            if operator in ("&&", "||"):
                self.handleLogicalOperations(node, operator)

            left = self.current.getChild(0)
            right = self.current.getChild(2)

            if left.type_tup != right.type_tup:
                raise Exception("conversion did not occur properly")

            text, new_reg = Calculation.operation(left.register, right.register, operator, left.type_tup[0], left.type_tup[1])

        self.current.store(text, self.map_table)
        self.current.register = new_reg
        self.current.type_tup = left.type_tup

    def handleComment(self, node: ASTNode):
        self.current.store(node.children[0].text, self.map_table)

    def handleLogicalOperations(self, node, operator):
        """
        Logical operations cause a change in the control Flow
        So we will make changes to the control flow graph

        :param node:
        :param operator:
        :return:
        """

        left_child = self.current.getChild(0)
        right_child = self.current.getChild(2)

        """
        when not Control Flow is yet occurring we need to start one.
        """
        if not self.control_flow_graph.isEval():
            self.control_flow_graph.startEval(left_child)

        if operator == "&&":
            self.control_flow_graph.addLogicalAnd(right_child)

        if operator == "||":
            self.control_flow_graph.addLogicalOr(right_child)


