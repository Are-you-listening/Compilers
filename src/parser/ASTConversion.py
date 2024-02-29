from src.parser.ASTVisitor import *
import subprocess
from src.parser.CTypes.COperationHandler import *


class ASTConversion(ASTVisitor):
    """
    Makes implicit conversions explicit
    """
    def __init__(self, lexer):
        self.lexer = lexer
        self.rc = RichnessChecker(lexer, types)

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration" and node.getChildAmount() == 4:
            """
            situation when declaration
            """
            child = node.getChild(3)
            poorest = self.getPoorestType(child)
            child_type = self.rc.getType(poorest)

            to_type_tree = node.getChild(0)
            if to_type_tree.getChild(0).text.upper() != child_type:
                new_node = ASTNode("Conversion", node, child.getSymbolTable())
                type_node = ASTNode("Type", new_node, new_node.getSymbolTable())
                new_node.addChildren(type_node)

                for t_child in to_type_tree.children:
                    type_node.addChildren(ASTNodeTerminal(t_child.text, type_node, type_node.getSymbolTable(), t_child.type,
                                                          t_child.operation_type))
                child.addNodeParent(new_node)

        if node.text == "Assignment" and node.getChildAmount() == 3:
            """
            situation Assignment
            """
            type_child = node.getChild(0)
            child = node.getChild(2)
            data_type = type_child.getSymbolTable().getEntry(type_child.text).type.upper()
            if self.getPoorestType(child) != data_type:
                new_node = ASTNode("Conversion", node, child.getSymbolTable())
                type_node = ASTNode("Type", new_node, new_node.getSymbolTable())
                new_node.addChildren(type_node)

                type_node.addChildren(
                    ASTNodeTerminal(data_type, type_node, type_node.getSymbolTable(), data_type,
                                    None))

                child.addNodeParent(new_node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        parent = node.parent

        if parent.text == "Expr":
            poorest = self.getPoorestType(parent)
            node_type = self.rc.getType(node.type)
            if node_type == "IDENTIFIER":
                type_entry = node.getSymbolTable().getEntry(node.text)
                node_type = type_entry.type.upper()

            """
            We check for nodes that have a type, if so we check if this type is the poorest type
            If not it will implicitly be converted to the poorest type
            """

            if self.rc.getType(poorest) != node_type and node_type in types:

                new_node = ASTNode("Conversion", parent, node.getSymbolTable())
                type_node = ASTNode("Type", new_node, new_node.getSymbolTable())
                new_node.addChildren(type_node)
                type_node.addChildren(ASTNodeTerminal(node_type, type_node, type_node.getSymbolTable(), self.rc.getTypeNumber(node_type)))
                node.addNodeParent(new_node)


    def getPoorestType(self, node: ASTNode):
        """
        Function to get the poorest type of the subtree
        :param node: root of the subtree
        :return: poorest type
        """
        if isinstance(node, ASTNodeTerminal):
            t_type = self.rc.getType(node.type)

            if t_type == "IDENTIFIER":
                """
                return type corresponding to the value of the Identifier
                """
                type_entry = node.getSymbolTable().getEntry(node.text)
                #return self.rc.getTypeNumber(type_entry.type.upper())
                return type_entry.type

            if t_type not in types:
                return None
            return node.type

        if node.text == "Conversion":
            type_value = node.getChild(0)
            return self.getPoorestType(type_value)

        poorest_child = None
        for child_index in range(node.getChildAmount()):
            child = node.getChild(child_index)
            child_type = self.getPoorestType(child)
            if child_type is None:
                continue

            if poorest_child is None:
                poorest_child = child_type
            else:
                poorest_child = self.rc.getTypeNumber(self.rc.get_poorest(poorest_child, child_type))

        return poorest_child
