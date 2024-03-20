from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import *
from src.parser.Tables.SymbolTable import *


class ASTConversion2(ASTVisitor):
    """
    Makes implicit conversions explicit
    """

    def __init__(self):
        self.rc = RichnessChecker(types)

        """
        Map each node on its resulting type
        """
        self.type_mapping = {}

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        if node.text == "Dereference":
            child = node.getChild(0)
            data_type, ptrs = self.type_mapping[child]
            ptrs = ptrs[:-1]  # Remove 1 ptr
            self.type_mapping[node] = (data_type, ptrs)
            return

        if node.text == "Conversion":
            type_value = node.getChild(0)
            data_type, ptrs = self.calculateType(type_value)
            self.type_mapping[node] = (data_type, ptrs)
            return

        if node.text not in ("Literal", "Expr", "Declaration", "Assignment"):  # Exclude "Function" for now
            return

        """
        Take the poorest type, if types are inconsistent: add implicit conversion
        """
        current_poorest = None
        current_poorest_ptrs = ""
        checkCompatibility = []  # Helper variable

        for child in node.children:
            type_tup = self.type_mapping.get(child, None)
            if type_tup is None:
                checkCompatibility.append(child.text)
                continue

            data_type, ptrs = type_tup

            if current_poorest is None:
                current_poorest = data_type
                current_poorest_ptrs = ptrs
            else:
                if current_poorest_ptrs == ptrs:  # If the amount of "*" is the same; nothing to worry about
                    current_poorest = self.rc.get_poorest(data_type, current_poorest)
                else:
                    # Handle errors
                    if len(current_poorest_ptrs) >= 2 and data_type == "FLOAT" and len(ptrs) == 0:
                        ErrorExporter.invalidOperation(node.linenr, "", "PTR", "FLOAT")
                        """This type of warnings is at the moment not fully implementable without a proper 
                        distinction between int b; int* ptr = &b; and int* ptr = b;"""
                    else:  # PTR and INT/CHAR can convert in between each other, however a warning will be shown

                        type1 = current_poorest + current_poorest_ptrs
                        type2 = data_type + self.type_mapping[child][1]

                        if type1 != type2 and (len(current_poorest_ptrs) - len(self.type_mapping[child][
                                                                                   1]) > 1):  # If the types are
                            # different and the length differs more than 1, we can for sure say it's a correct
                            # warning. (int b; int* b_ptr = &b; has a difference of 1 but is allowed)
                            ErrorExporter.conversionWarning(node.linenr, type1, type2)

            """
            Collect Data for the incompatible operation test
            """
            appendix = current_poorest  # Preset the type
            while child.text == "Dereference":  # When a dereference node is found, we cannot get the type from that
                # node
                child = child.children[0]
            entry = child.getSymbolTable().getEntry(child.text)
            if entry is not None:  # If there exists an entry we want the type from the SymbolTable (which is most
                # likely a PTR)
                appendix = entry.getType()
            checkCompatibility.append(appendix)  # Add it to the verifier list

        """
        Verify if the operators are allowed | Semantic Analyse
        """
        if not self.compatible(checkCompatibility):
            if len(checkCompatibility) == 3:  # Binary operation
                ErrorExporter.invalidOperation(node.linenr, checkCompatibility[1], checkCompatibility[0],
                                               checkCompatibility[2])
            elif checkCompatibility[0] not in types:  # Operator is on index 0
                ErrorExporter.invalidOperation(node.linenr, checkCompatibility[0], checkCompatibility[1],
                                               "")
            elif checkCompatibility[1] not in types:  # Operator is on index 1
                ErrorExporter.invalidOperation(node.linenr, checkCompatibility[1], checkCompatibility[1],
                                               "")

        """for declaration and assignment the type is the type of the value that is declared/assigned (and not the 
        necessarily the poorest type)"""
        if node.text in ("Declaration", "Assignment", "Function"):
            assign_node = node.getChild(0)

            while assign_node.text == "Dereference":
                assign_node = assign_node.getChild(0)

            entry = assign_node.getSymbolTable().getEntry(assign_node.text)

            data_type, ptrs = entry.getPtrTuple()
            current_poorest = data_type
            current_poorest_ptrs = ptrs

        """
        add implicit conversions as explicit
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

    @staticmethod
    def calculateType(node: ASTNode):
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

    @staticmethod
    def compatible(items):
        """
        Check the blacklist for absolute incompatible operations or types
        :param items:
        :return:
        """
        blocklist = [["PTR", "+", "PTR"], ["PTR", "*", "PTR"], ["PTR", "*", "INT"], ["PTR", "*", "CHAR"],
                     ["CHAR", "*", "PTR"], ["INT", "*", "PTR"]]
        incompatible = {  # Keep a list of absolutely incompatible types & operations
            "FLOAT": ["%", "|", "&", "~", "CHAR"],  # FLOAT & CHAR are always incompatible
            "PTR": ["/", "^", ">>", "<<", "%", "|", "~"]
        }

        for item in items:  # Make all combinations of items
            for item2 in items:
                if item != item2:  # Except the combination when it has itself twice
                    if item in incompatible.keys() and item2 in incompatible[item]:  # An incompatible match
                        return False
                    elif item2 in incompatible.keys() and item in incompatible[item2]:
                        return False
        if items in blocklist:
            return False
        return True
