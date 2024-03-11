from src.parser.ASTVisitor import *
import subprocess
from src.parser.CTypes.COperationHandler import *
from src.parser.Tables.SymbolTypePtr import *


class ASTConversion2(ASTVisitor):
    """
    Makes implicit conversions explicit
    """
    def __init__(self):
        self.rc = RichnessChecker(types)

        """
        map node on his resulting type
        """
        self.type_mapping = {}

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        if node.text == "Dereference":
            child = node.getChild(0)
            data_type, ptrs = self.type_mapping[child]
            """
            remove 1 ptr
            """
            ptrs = ptrs[:-1]
            self.type_mapping[node] = (data_type, ptrs)
            return

        if node.text == "Conversion":
            type_value = node.getChild(0)
            data_type, ptrs = self.calculateType(type_value)
            self.type_mapping[node] = (data_type, ptrs)
            return

        if node.text not in ("Literal", "Expr", "Declaration", "Assignment", "Function"):
            return

        """
        take the poorest type, if types are inconsistent add implicit conversion
        """
        current_poorest = None
        current_poorest_ptrs = ""

        for child in node.children:
            type_tup = self.type_mapping.get(child, None)
            if type_tup is None:
                continue

            data_type, ptrs = type_tup

            """
            ignore ptrs for now
            """

            if current_poorest is None:
                current_poorest = data_type
                current_poorest_ptrs = ptrs
            else:
                if current_poorest_ptrs != ptrs:
                    pass

                current_poorest = self.rc.get_poorest(data_type, current_poorest)

        """
        for declaration and assignment the type is the type of the value that is declared/assigned
        """
        if node.text in ("Declaration", "Assignment", "Function"):
            assign_node = node.getChild(0)
            data_type, ptrs = assign_node.getSymbolTable().getEntry(assign_node.text).getPtrTuple()
            current_poorest = data_type
            current_poorest_ptrs = ptrs

        """
        add implict conversions as explicit
        """
        for child in node.children:
            type_tup = self.type_mapping.get(child, None)
            if type_tup is None:
                continue

            data_type, ptrs = type_tup
            if data_type != current_poorest:

                new_node = ASTNode("Conversion", node, child.getSymbolTable())
                type_node = ASTNode("Type", new_node, new_node.getSymbolTable())
                new_node.addChildren(type_node)

                """
                add datatype
                """
                type_node.addChildren(
                    ASTNodeTerminal(current_poorest, type_node, type_node.getSymbolTable(), "Not Used",
                                    None))

                for t_child in current_poorest_ptrs.split():
                    type_node.addChildren(
                        ASTNodeTerminal(t_child, type_node, type_node.getSymbolTable(), "Not Used",
                                        None))
                child.addNodeParent(new_node)

        self.type_mapping[node] = (current_poorest, current_poorest_ptrs)

    def visitNodeTerminal(self, node: ASTNodeTerminal):

        if node.type == "IDENTIFIER":
            type_entry = node.getSymbolTable().getEntry(node.text)
            data_type, ptrs = type_entry.getPtrTuple()

            """
            Use LLVM ptr format
            """
            ptrs += "*"

            self.type_mapping[node] = (data_type, ptrs)

        elif node.type in types:
            self.type_mapping[node] = (node.type, '*')

    def calculateType(self, node: ASTNode):
        """
        provided node is a type node
        :param node:
        :return:
        """

        if node.text != "Type":
            raise Exception("wrong node type")

        data_type = ""
        ptrs = ""
        for child in node.children:
            if child.text.upper() in types:
                data_type = child.text.upper()

            if child.text == "*":
                ptrs += "*"

        return data_type, ptrs