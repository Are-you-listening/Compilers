from src.parser.Tables.SymbolTable import *
from src.parser.Tables.SymbolTypeStruct import *
from src.parser.CTypes.COperationHandler import *
from src.parser.ASTVisitor import *
from src.parser.ASTTypedefReplacer import ASTTypedefReplacer
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.interal_tools.IntegrityChecks import PreConditions
from src.parser.AST import ASTNodeTypes
import typing


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """

    def __init__(self):
        self.table = None

        self.to_remove = set()
        self.param_list = []
        self.structTable = {}

    def visit(self, ast: AST):
        self.table = None
        self.param_list = []

        self.postorder(ast.root)

        for n in self.to_remove:
            n.parent.removeChild(n)

    def postorder(self, root: ASTNode):
        """for child in root.children:
            self.postorder(child)
        root.accept(self)"""

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack) - 1
            current_node = stack[current_index]  # get top of stack without popping it

            if current_node not in visited and current_node.text in ("Function", "Code", "Scope"):
                """
                Create a new scope for the children
                """
                temp = SymbolTable(self.table)
                if self.table is not None:
                    self.table.nextTable(temp)
                self.table = temp

            do_visit = True
            for child in reversed(current_node.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                current_node.accept(self)
                stack.pop(current_index)

            visited.add(current_node)

    @staticmethod
    def __equalParamTypes(param_types_and_ptrs: list, param_types: list):
        if len(param_types_and_ptrs) != len(param_types):
            return False
        for i in range(len(param_types_and_ptrs)):
            if param_types_and_ptrs[i].getPtrTuple() != param_types[i].getPtrTuple():
                return False
        return True

    def __checkFunctionDeclarations(self, node: ASTNode, param_types_and_ptrs: list, return_type: SymbolType):
        """
        This function will check information about the function declaration, like
        checking if it is already declared, if so, check matching parameter types, or check whether
        a definition already exists

        :param node:
        :param param_types_and_ptrs:
        :param return_type:
        :return:
        """

        function_node = node.children[1]
        """
        check if the function is already declared
        """
        if function_node.symbol_table.exists(function_node.text) and \
                isinstance(function_node.getSymbolTable().getEntry(function_node.text).getTypeObject(),
                           FunctionSymbolType):
            """
            check if the return types match, if not, throw an error
            """
            if return_type.getPtrTuple() != node.symbol_table.getEntry(function_node.text).getPtrTuple():
                ErrorExporter.conflictingFunctionReturnType(function_node.position, function_node.text)

            """
            check if the parameter types match, if not, throw an error
            """
            if not self.__equalParamTypes(param_types_and_ptrs, node.symbol_table.getEntry(
                    function_node.text).getTypeObject().getParameterTypes()):
                ErrorExporter.conflictingFunctionParameterTypes(function_node.position, function_node.text)

            """
            check if the function is a declaration or a definition
            """

            if node.getChildAmount() == 3:
                return
            else:
                """
                the function is a definition, check if it is already defined, if so, throw an error, 
                else set it to defined
                """
                if node.symbol_table.getEntry(function_node.text).is_function_defined():
                    ErrorExporter.functionRedefinition(function_node.position, function_node.text)
                else:
                    node.symbol_table.getEntry(function_node.text).set_function_defined(True)
        else:
            return

    def visitNode(self, node: ASTNode):
        """
        Assign the symbol table to the node
        """
        node.symbol_table = self.table

        if node.text == "Declaration" or node.text == "Parameter":
            child = node.getChild(0)

            PreConditions.assertInstanceOff(child, ASTNodeTypes)
            child = typing.cast(ASTNodeTypes, child)

            symbol_type, symbol_entry = self.__makeEntry(node, child, node.text == "Parameter")

            if node.text == "Parameter":
                self.param_list.append(symbol_type)

        if node.text in ("Function", "Code", "Scope"):
            """
            Go 1 scope back, and make sure the node its scope is recalibrated
            Because function definition needs to be in a global scope
            """
            if self.table.prev is not None:
                self.table = self.table.prev

                node.symbol_table = self.table

        if node.text == "Function":
            """
            When coming across a function we need to make a symbol table entry for this function
            """
            child = node.getChild(0)

            PreConditions.assertInstanceOff(child, ASTNodeTypes)
            child = typing.cast(ASTNodeTypes, child)

            PreConditions.assertInstanceOff(child, ASTNodeTypes)

            """
            retrieve the parameter types, created before using this visitor
            """
            param_types = self.param_list
            self.param_list = []

            return_type = child.symbol_type

            """
            Check if the declaration of this function is allowed
            """
            self.__checkFunctionDeclarations(node, param_types, return_type)

            """
            Create the function type
            """
            function_type = FunctionSymbolType(return_type, param_types)

            symbol_entry = SymbolEntry(function_type, node.children[1].text, None, node.children[1], None)
            node.symbol_table.add(symbol_entry)

            function_node = node.children[1]
            if node.getChildAmount() == 4:
                """
                When the function has a definition we will flag this function as defined
                """
                node.symbol_table.getEntry(function_node.text).set_function_defined(True)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        Assign the symbol table to the node
        """
        node.symbol_table = self.table

    @staticmethod
    def __makeEntry(node, child: ASTNodeTypes, referenced=False):
        """
        Make symbol table entry
        :param node:
        :param child: Type node
        :return:
        """

        PreConditions.assertInstanceOff(child, ASTNodeTypes)

        symbol_type = child.symbol_type

        """
        Check that normal void Types are not allowed
        """
        latest_datatype = symbol_type
        if latest_datatype.getBaseType() == "VOID":
            ErrorExporter.variableDeclaredVoid(node.position, node.children[1].text)

        """
        Create the symbol table entry
        the value in the symbol table is initially empty
        """
        symbol_entry = SymbolEntry(latest_datatype, node.children[1].text, None, node.children[1], None)
        if referenced:
            symbol_entry.reference()
        node.symbol_table.add(symbol_entry)
        return latest_datatype, symbol_entry