from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.ASTVisitor import ASTVisitor
from src.parser.AST import ASTNode, ASTNodeTerminal, AST, ASTNodeTypes
from src.parser.Tables.TypeNodehandler import TypeNodeHandler
from src.parser.Tables.SymbolTypeStruct import SymbolTypeStruct
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.parser.CTypes.COperationHandler import RichnessChecker
from src.parser.Tables.SymbolTypeArray import *
from src.parser.ArrayCleaner import ArrayCleaner

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

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def cleanConversions(self, node: ASTNode):
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
        if node.text not in ["Struct", "Union"]:
            return

        self.__make_struct_type(node)

    def __make_struct_type(self, node: ASTNode):
        structName = node.children[0].text  # First child is struct type
        pts_to = []

        i = 1  # We can skip the first 2 nodes, these are used for the Struct itself
        while i < len(node.children):
            child = node.children[i].children[0]  # Pick the type node
            identifier = node.children[i].children[1].text

            PreConditions.assertInstanceOff(child, ASTNode)

            data_type = TypeNodeHandler.getInstance().typeToTypeNode(child)


            # TODO clean this array stuff later
            if node.children[i].getChildAmount() >= 3 and node.children[i].getChild(2).text == "ARRAY":
                temp = node.children[i].getChild(2)
                while not isinstance(temp, ASTNodeTerminal):
                    temp = temp.getChild(0)

                if temp.type == "INT":
                    data_type.symbol_type = SymbolTypeArray(data_type.symbol_type, False, int(temp.text))

            pts_to.append(data_type.symbol_type)
            # Remove the struct data member identifier from the table, it is no actual member

            i += 1

        if node.text == "Union":  # For Unions, take the biggest type as type for all data members
            richest = self.getRichestType(pts_to)
            print("heoo")
            struct_type = SymbolTypeUnion(structName, richest, pts_to)
        else:
            struct_type = SymbolTypeStruct(structName, pts_to)

        TypeNodeHandler.getInstance().addStructType(structName, struct_type)

        node.parent.removeChild(node)

    @staticmethod
    def getRichestType(pts_to: list):
        richest = pts_to[0]
        check = RichnessChecker(types)
        for pointee in pts_to:
            if isinstance(pointee,
                          SymbolTypeArray):  # Arrays are always the biggest since they contain 1 to multiple pointers
                richest = SymbolTypeArray(SymbolType("FLOAT", False), False, pointee.size)
                break
            if isinstance(pointee, SymbolTypePtr):
                richest = pointee
            else:
                data_type, ptrs = richest.getPtrTuple()
                data_type2, ptrs2 = pointee.getPtrTuple()
                if data_type2[0] == check.get_richest(data_type[0], data_type2[0]):
                    richest = pointee
        return richest


