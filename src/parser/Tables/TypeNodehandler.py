from src.parser.AST import ASTNode, ASTNodeTypes
from src.internal_tools import *

from src.parser.Tables.SymbolTypeArray import SymbolTypeArray, SymbolTypePtr, SymbolType

base_types = ["INT", "FLOAT", "CHAR", "VOID"]

class SymbolTypeStruct:
    pass

class SymbolTypeUnion:
    pass


class TypeNodeHandler:
    """
    Tools with regard to creating and retrieving AST TypeNode types
    """
    __instance = None

    def __init__(self):

        if self.__instance is not None:
            raise Exception("This class is a singleton!")

        """
        Store all struct and union type mappings
        """
        self.struct_types = {}
        self.struct_param = {}
        self.union_store = {}
        self.BaseTypes = ["INT", "FLOAT", "CHAR", "VOID"]

    def clear(self):

        self.struct_types = {}
        self.struct_param = {}
        self.union_store = {}
        self.BaseTypes = ["INT", "FLOAT", "CHAR", "VOID"]
        self.__instance = None

    @staticmethod
    def getInstance():
        if TypeNodeHandler.__instance is None:
            TypeNodeHandler.__instance = TypeNodeHandler()
        return TypeNodeHandler.__instance

    def addStructType(self, key: str, struct_type: SymbolTypeStruct):
        """
        Add a struct type to the singleton
        """

        """
        Check provided type is a struct type
        """
        PreConditions.assertInstanceOff(struct_type, SymbolTypeStruct)
        self.struct_types[key] = struct_type

    def addStructParam(self, key: str, struct_param_list: list[SymbolType]):
        """
        Add a struct param to the the struct in singleton
        """
        self.struct_param[key] = struct_param_list

    def getStructParam(self, key: str, index: int):
        return self.struct_param[key][index]

    def typeToTypeNode(self, node: ASTNode):
        """
        Convert a node with 'Type' to a TypeNode Instance Type
        :param node: the node we want to convert
        :return:
        """

        """
        Check we are dealing with a node with text 'Type'
        """
        PreConditions.assertEqual(node.text, "Type")

        """
        Check this type node has children
        """
        PreConditions.assertNOTEqual(node.getChildAmount(), 0)

        """
        Check that we are dealing with a normal AST Node
        """

        PreConditions.assertInstanceOff(node, ASTNode)

        symbol_type = self.__getSymbolType(node)

        """
        Replace old node by a new node
        """
        new_type_node = ASTNodeTypes("Type", node.parent, node.getSymbolTable(),
                                     symbol_type, node.position, node.structTable)
        return new_type_node

    def __getSymbolType(self, node: ASTNode):
        """
        Check we are dealing with a node with text 'Type'
        """
        PreConditions.assertEqual(node.text, "Type")

        is_const = False
        latest_datatype = None

        for child in node.children:
            if child.text == "const":

                """
                in case *const, the const is after, but it still needs to be applied
                """
                if latest_datatype is not None:
                    latest_datatype.const = True

                is_const = True
            elif child.text == "*":
                is_const = False

                latest_datatype = self.__make_ptr_type(latest_datatype, is_const, child.type)
            else:
                if child.text in base_types:
                    latest_datatype = SymbolType(child.text, is_const)

                elif self.struct_types.get(child.text) is None:
                    if child.text in ("struct", "union"):
                        continue

                    if child.text == "0_IO_FILE":
                        self.struct_types[child.text] = SymbolTypeStruct(child.text)
                        continue

                    is_union = node.structTable.isUnion(child.text, node.position)
                    if is_union:
                        self.struct_types[child.text] = SymbolTypeUnion(child.text)

                    else:
                        self.struct_types[child.text] = SymbolTypeStruct(child.text)

                    latest_datatype = self.struct_types[child.text]
                else:
                    latest_datatype = self.struct_types[child.text]

        return latest_datatype

    @staticmethod
    def __make_ptr_type(latest_datatype: SymbolType, is_const: bool, terminal_type: str):
        """
        We have 2 types of ptrs, normal ptrs and array ptrs (They do mostly the same, but are different for checks),
        whether a ptr is an array depends on the type, ARRAY_size is an ARRAY
        """
        if terminal_type.startswith("ARRAY_"):
            datatype = SymbolTypeArray(latest_datatype, is_const, int(terminal_type[6:]))
        else:
            datatype = SymbolTypePtr(latest_datatype, is_const)
        return datatype

    def getStruct(self, key, default=None):
        return self.struct_types.get(key, default)

from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion