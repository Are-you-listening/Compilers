from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.ASTVisitor import ASTVisitor
from src.parser.AST import ASTNode, ASTNodeTerminal, AST, ASTNodeTypes
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.parser.CTypes.COperationHandler import RichnessChecker
from src.parser.Tables.SymbolTypeArray import *
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType
from src.parser.Utils.ArraySizeReader import ArraySizeReader
from src.internal_tools import *

types = ["BOOL", "CHAR", "INT", "FLOAT"]


class TypeCleaner(ASTVisitor):
    """
    This function convert all the 'Type' subtrees to a ASTTypeNode containing the type
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        self.handleStruct(node)

        self.cleanConversions(node)
        self.cleanFunctionPtr(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def cleanConversions(node: ASTNode):
        """
        Check if the conversion to type, is already a ASTTypeNode, if not, we will convert it to such a type node
        """

        if node.text != "Type":
            return

        type_node = node
        if isinstance(type_node, ASTNodeTypes):
            return

        new_type_node = TypeNodeHandler.getInstance().typeToTypeNode(type_node)

        node.parent.replaceChild(type_node, new_type_node)

    def handleStruct(self, node: ASTNode):
        """
        When we have a struct definition, we will directly convert it to a struct type, and store it in the
        Singleton
        """
        if node.text not in ("Struct", "Union"):
            return

        self.__makeStructType(node)

    def __makeStructType(self, node: ASTNode):
        """
        Make a struct Symbol Type, and store it in a dict for struct types

        :param node: node we want to convert to a struct type
        """

        PreConditions.assertIn(node.text, ("Struct", "Union"))

        struct_name = node.children[0].text  # First child is struct type
        pts_to = []

        i = 1  # We can skip the first 2 nodes, these are used for the Struct itself
        while i < len(node.children):
            child = node.children[i].children[0]  # Pick the type node

            PreConditions.assertInstanceOff(child, ASTNode)

            data_type = TypeNodeHandler.getInstance().typeToTypeNode(child)

            """
            When we come across a struct type member that has an array, we need to make sure that this array
            is still propagated to being an array inside a struct
            """
            if node.children[i].getChildAmount() >= 3 and node.children[i].getChild(2).text == "ARRAY":
                array_node = node.children[i].getChild(2)

                """
                Retrieves the array sizes
                """
                array_sizes = ArraySizeReader.readSize(array_node)

                """
                For each array dimensions we come across add an array type with corresponding type
                """
                for a in reversed(array_sizes):
                    data_type.symbol_type = SymbolTypeArray(data_type.symbol_type, False, int(a))

            pts_to.append(data_type.symbol_type)

            i += 1

        """
        Make different symbol type depending on whether it is a union or not
        """
        if node.text == "Union":  # For Unions, take the biggest type as type for all data members
            richest = self.getUnionType(pts_to)
            struct_type = SymbolTypeUnion(struct_name, richest, pts_to)
        else:
            struct_type = SymbolTypeStruct(struct_name, pts_to)

        """
        Add the struct to the struct type dict
        """
        TypeNodeHandler.getInstance().addStructType(struct_name, struct_type)

        """
        Remove the struct form the AST
        """
        node.parent.removeChild(node)

    @staticmethod
    def getUnionType(union_types: list[SymbolType]):
        """
        For unions we want to retrieve the richest type, that we will use yo store our data in
        :param union_types: List of symbol types the union has
        """

        PreConditions.assertListInstanceOff(union_types, SymbolType)

        """
        Start by considering the first type the richest type
        """
        richest = union_types[0]
        check = RichnessChecker(types)
        for union_type in union_types:

            """
            When our richest type is an array, we consider an array of floats/ other arrays the richest type
            When a value is stored to an Union it will be converted to the richest datatype,
            When an array is present, The array will become the richest type, Arrays will be just single character 
            arrays (following they way Clang does it for situations of multidimensional arrays of multiple types)
            The size of the array, will have enough bytes to suit the largest array possible
            This keeps the code regular
            """
            if isinstance(union_type,
                          SymbolTypeArray):  # Utils are always the biggest since they contain 1 to multiple pointers

                new_array_size = max(union_type.getBytesUsed(), richest.getBytesUsed())

                """
                Take 4 bytes if array is smaller, so a float can still fit inside the array
                """
                new_array_size = max(new_array_size, 4)

                temp_richest = SymbolTypeArray(SymbolType("CHAR", False), False,
                                               new_array_size)

                richest = temp_richest

            if isinstance(richest, SymbolTypeArray):
                continue

            if isinstance(union_type, SymbolTypePtr):
                richest = union_type
            else:
                data_type, ptrs = richest.getPtrTuple()
                data_type2, ptrs2 = union_type.getPtrTuple()
                if data_type2[0] == check.get_richest(data_type[0], data_type2[0]):
                    richest = union_type
        return richest

    def cleanFunctionPtr(self, node: ASTNode):
        """
        Convert FunctionPtrs to its type

        """
        if node.text != "FunctionPtr":
            return

        symbol_type = self.__get_func_ptr_type(node)

        new_type_node = ASTNodeTypes("Type", node.parent, node.getSymbolTable(), symbol_type,
                                     node.position, node.structTable)

        node.parent.replaceChild(node, new_type_node)

    def __get_func_ptr_type(self, node: ASTNode):
        return_type_child = node.getChild(0)

        if return_type_child.text == "FunctionPtr":

            return_type = self.__get_func_ptr_type(return_type_child)
        else:
            if isinstance(return_type_child, ASTNodeTypes):
                return_type = return_type_child.symbol_type
            else:
                return_type = TypeNodeHandler.getInstance().typeToTypeNode(return_type_child).symbol_type


        function_params = node.getChild(1)
        param_type_list = []
        for param in function_params.children:

            if isinstance(param, ASTNodeTypes):
                param_type = param.symbol_type
            else:
                param_type = TypeNodeHandler.getInstance().typeToTypeNode(param).symbol_type

            param_type_list.append(param_type)

        function_type = FunctionSymbolType(return_type, param_type_list)
        func_ptr = SymbolTypePtr(function_type, False)

        return func_ptr
