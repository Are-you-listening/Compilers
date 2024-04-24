from src.parser.ASTVisitor import *


class EnumConverter(ASTVisitor):
    """
    Translate enums to typedefs and declarations in our format
    """
    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        """
        Keep into account, when this visitor would be converted to a postorder, we will need to add a self.to_add
        instead of directly adding children. Currently, it is a preorder which is fine for everything it currently
        needs to do.
        """
        self.preorder(ast.root)

        for node in self.to_remove:  # Delete the older nodes
            node.parent.removeChild(node)

    def visitNode(self, node: ASTNode):
        """
        This visitor will make sure to only take into account 'Enum nodes'
        """
        if node.text not in ["Enum"]:
            return

        """
        Retrieve the relevant information about the enum node and add this enum node tot the to remove
        """
        name = node.text.lower()
        line = node.linenr  # Line nr
        index = 0  # Value for each enum
        parent = node.parent
        self.to_remove.add(node)

        self.__make_manual_typedef(line, node.virtuallinenr, ["INT"], name + " " + node.children[1].text, node.symbol_table, node.parent, parent.findChild(node))  # Make a typedef for this enum type

        # Add all other enums 'identifiers/variables' as "const int" variables to the current scope
        for i in range(2, len(node.children)):
            name = node.children[i].text
            # For each enum, recreate the Declaration structure so the rest of the program will take care of it!
            self.__make_manual_declaration(parent, line, node.virtuallinenr, name, ["const", "INT"], index, node.symbol_table, parent.findChild(node))
            index += 1  # Incr value for enum

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def __make_manual_declaration(parent: ASTNode, line: str, virtuallinenr, name: str, types: list, value, table, insert_index: int):
        """
        Helper function to create some (const) declarations manually for AST manipulation

        Enum for a Thursday with value 0 -> const int Thursday = 0;

        :param insert_index: de index of the parent where our value needs to be inserted
        :param table:
        :param parent: To this node, any new nodes will be added as children
        :param line: Line nr
        :param name: Name of the variable
        :param types: Type of the variable
        :param value: Value of the variable
        :return:
        """

        """
        Add the const declaration node
        """
        declaration = ASTNode("Declaration", parent, table, line, virtuallinenr)
        """
        Insert the parent on the right spot of the parent
        """
        parent.insertChild(insert_index, declaration)

        """
        Create the node containing the type of the declaration value
        """
        type_node = ASTNode("Type", declaration, table, line, virtuallinenr)
        declaration.addChildren(type_node)

        """
        types is a list of type related parts that are used to construct the type ex: ["const", "INT"]
        """
        for type_element in types:
            type_part_node = ASTNodeTerminal(type_element, type_node, table, -1, line, virtuallinenr)  # Add the actual types
            type_node.addChildren(type_part_node)

        """
        We will also add the identifier itself, being the enum value
        """
        var = ASTNodeTerminal(name, declaration, table, "IDENTIFIER", line, virtuallinenr)  # Add enum variable
        declaration.addChildren(var)

        """
        At this point the compiler sequence, we haven't removed the '=' sign so we still need to add it
        """
        equal_sign = ASTNodeTerminal("=", declaration, table, -1, line, virtuallinenr)  # Add '='
        declaration.addChildren(equal_sign)

        """
        On the right hand side of our declaration we have the literal
        We will construct the subtree Expr -> Literal -> Value
        """
        expr = ASTNode("Expr", declaration, table, line, virtuallinenr)  # Add value nodes
        declaration.addChildren(expr)
        literal = ASTNode("Literal", expr, table, line, virtuallinenr)
        expr.addChildren(literal)

        """
        Determine the type of the terminal
        """
        terminal_type = ""
        for potential_type in ["FLOAT", "INT", "CHAR"]:
            if potential_type in types:
                terminal_type = potential_type
                break

        """
        Create the node containing the value corresponding to the ENUM identifier
        """
        value_node = ASTNodeTerminal(value, literal, table, terminal_type, line, virtuallinenr)
        literal.addChildren(value_node)
        return name

    @staticmethod
    def __make_manual_typedef(line: str, virtuallinenr, base_types: list, replace_type: str, table, grandparent, insert_index: int):
        """
        Create a manual typedef without relying on ctx for AST manipulation
        :return:
        """
        parent = ASTNode("Typedef", grandparent, table, line, virtuallinenr)
        grandparent.insertChild(insert_index, parent)

        node_typedef = ASTNodeTerminal("typedef", parent, table, -1, line, virtuallinenr)
        parent.addChildren(node_typedef)

        """
        Store the type under a 'Type node'
        """
        node_type = ASTNode("Type", parent, table, line, virtuallinenr)  # Add the type translations
        parent.addChildren(node_type)
        for type_element in base_types:  # Add base types
            node_base_type = ASTNodeTerminal(type_element, node_type, table, -1, line, virtuallinenr)
            node_type.addChildren(node_base_type)

        node_typedef_part2 = ASTNodeTerminal(replace_type, parent, table, "IDENTIFIER", line, virtuallinenr)  # Add second part of typedef
        parent.addChildren(node_typedef_part2)
