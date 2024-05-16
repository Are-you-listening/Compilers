from src.parser.Tables.SymbolTypeStruct import *
from src.llvm_target.MapTable import *
from src.parser.CodeGetter import *

from src.parser.AST import ASTNodeBlock, ASTNodeTypes
from src.internal_tools import PreConditions
from src.mips_target.OutputMIPSGenerator import *
from .MipsSingleton import MipsSingleton


class AST2MIPS(ASTVisitor):
    def __init__(self, codegetter: CodeGetter, fileName, comments):
        self.map_table = MapTable(None)
        self.mips_map = {}
        self.root = None
        self.codegetter = codegetter
        self.fileName = fileName
        self.comments = comments
        self.special_functions_declared = {}

    def visit(self, ast: AST):
        self.special_functions_declared = {}
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
                print("fffffffff", current_node.getChild(0).text)

                self.handleFunction(current_node)
                self.map_table = MapTable(self.map_table)

            if isinstance(current_node, ASTNodeBlock) and current_node.text == "Block" and current_node not in visited:
                node = current_node
                if node.vertex.mips is None:
                    node.vertex.mips = MipsSingleton.getInstance().addBlock()

                MipsSingleton.getInstance().setCurrentBlock(node.vertex.mips)

                self.addOriginalCodeAsComment(current_node)

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
            MipsSingleton.getInstance().getLastFunction().endFunction()

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
            self.mips_map[node] = self.mips_map[node.getChild(0)]

        if node.text not in ("Parameters"):
            self.addOriginalCodeAsComment(node)

        self.handleComment(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            entry = node.getSymbolTable().getEntry(node.text)
            entry = self.map_table.getEntry(entry)
            if entry is None:
                self.mips_map[node] = node.text
            else:
                mips_var = entry.llvm
                self.mips_map[node] = mips_var

        if node.type in ("INT", "FLOAT", "CHAR", "BOOL"):
            mips_var = Declaration.mipsLiteral(node.text, SymbolType(node.type, False))
            self.mips_map[node] = mips_var

        if node.type == "STRING":
            mips_var = Declaration.string(node.text)
            self.mips_map[node] = mips_var

    def handleDeclaration(self, node):
        var_node: ASTNode = node.getChild(0)
        entry = var_node.getSymbolTable().getEntry(var_node.text)

        if var_node.getSymbolTable().isRoot():
            # Handle global variable (add to .data segment)
            if node.getChild(1):
                Declaration.declare(var_node.text, node.getChild(1).text, is_global=True)
        else:
            # Handle non-global variable (reserve space on the stack)
            mips_var = Declaration.declare(var_node.text)
            self.mips_map[node] = mips_var
            self.mips_map[node.getChild(0)] = mips_var
            self.map_table.addEntry(MapEntry(var_node.text, mips_var), entry)

        if node.getChildAmount() == 2 and not var_node.getSymbolTable().isRoot():
            self.handleAssignment(node)

    def __del__(self):
        for text in self.comments:  # Add any leftover comments
            MipsSingleton.getInstance().getCurrentBlock().comment(self.comments[text])

        with open(self.fileName, 'w') as f:
            f.write(str(MipsSingleton.getInstance().getModule().toString()))

    def handleFunction(self, node: ASTNode):
        function_name = node.getChild(0).text

        mips_module = MipsSingleton.getInstance().getModule()
        function = mips_module.createFunction(function_name)
        MipsSingleton.getInstance().setLastFunction(function)
        current_table = node.getSymbolTable()
        symbol_entry = current_table.getEntry(function_name, node.position.virtual_linenr)

        self.map_table.addEntry(MapEntry(function_name, function), symbol_entry)

    def handleComment(self, node):
        if node.position is None or node.symbol_table is None or node.symbol_table.isRoot():  # We can't add comments in the global scope of llvm
            return

        curr_line = node.position.linenr
        file = node.position.file
        to_delete = []

        for text in self.comments.keys():
            if text[1] < curr_line and file == text[0]:  # Insert all comments before this line (since some comments might not have code on the same line)
                Comment.comment(self.comments[text])
                to_delete.append(text)

        for text in to_delete:
            del self.comments[text]

    def handleParameterCalls(self, node: ASTNode):
        args = []
        for child in node.children:
            mips_var = self.mips_map.get(child)
            if mips_var is not None:
                args.append(mips_var)

        self.mips_map[node] = args

    def handleAssignment(self, node: ASTNode):
        assign_target = self.mips_map[node.getChild(0)]
        assign_value = self.mips_map[node.getChild(1)]

        mips_var = Declaration.assignment(assign_target, assign_value)
        self.mips_map[node] = mips_var

    def handleDereference(self, node: ASTNode):

        if isinstance(node.getChild(0), ASTNodeTerminal) and node.getChild(0).type == "IDENTIFIER":
            self.mips_map[node] = self.mips_map[node.getChild(0)]

    def handleReturn(self, node: ASTNode):
        mips_var = self.mips_map[node.getChild(0)]
        Function.handleReturn(mips_var)

    def handlePrintScanf(self, node: ASTNode, printf):
        """
        Create printf function
        """
        if "printf" not in self.special_functions_declared:
            function = Printf.printf()
            self.special_functions_declared["printf"] = function
        else:
            function = self.special_functions_declared["printf"]

        params = []
        for c in node.children:
            mips = self.mips_map.get(c)
            params.append(mips)
            print("param", c.text, mips, mips.getAddress())

        Function.functionCall(None, function, params)

    def handleOperations(self, node: ASTNode):
        """
        Handle Arithmetic operations
        :param node:
        :return:
        """
        if node.getChildAmount() == 3:

            operator_child = node.getChild(1)
            operator = operator_child.text

            left = self.mips_map.get(node.getChild(0))
            right = self.mips_map.get(node.getChild(2))

            mips_var = Calculation.operation(left, right, operator)

        self.mips_map[node] = mips_var

    def handleConversions(self, node: ASTNode):
        pass

    def handleParameters(self, node: ASTNode):
        pass

    def addOriginalCodeAsComment(self, node: ASTNode):
        if node.symbol_table is None or node.symbol_table.isRoot():  # LLVM thing in which you can't properly place comments in the global scope
            return

        code = self.codegetter.getLine(node)
        if code is not None:
            Comment.comment(code)

    def handle_IO(self):
        pass
