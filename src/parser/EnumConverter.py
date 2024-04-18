from src.parser.ASTVisitor import *


class EnumConverter(ASTVisitor):
    """
    Translate enums to typedefs and declarations in our format
    """
    def __init__(self):
        self.toDelete = []

    def visit(self, ast: AST):
        self.preorder(ast.root)

        for node in self.toDelete:  # Delete the older nodes
            node.parent.removeChild(node)

    def visitNode(self, node: ASTNode):
        if node.text != "Enum":
            return

        line = node.linenr  # Line nr
        index = 0  # Value for each enum
        parent = node.parent
        self.toDelete.append(node)

        self.make_manual_typedef(line, ["INT"], "enum "+node.children[1].text, node.symbol_table, node.parent, parent.findChild(node))  # Make a typedef for this enum type

        # Add all other enums 'identifiers/variables' as "const int" variables to the current scope
        for i in range(2, len(node.children)):
            name = node.children[i].text
            # For each enum, recreate the Declaration structure so the rest of the program will take care of it!
            self.make_manual_declaration(parent, line, name, ["const", "INT"], index, node.symbol_table, parent.findChild(node))
            index += 1  # Incr value for enum

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def make_manual_declaration(parent: ASTNode, line: str, name: str, types: list, value, table, insertIndex: int):
        """
        Helper function to create some (const) declarations manually without a real ctx for AST manipulation
        :param table:
        :param parent: To this node, any new nodes will be added as children
        :param line: Line nr
        :param name: Name of the variable
        :param types: Type of the variable
        :param value: Value of the variable
        :return:
        """
        declaration = ASTNode("Declaration", parent, table, line, None)  # Add declaration node
        parent.insertChild(insertIndex, declaration)

        typeNode = ASTNode("Type", declaration, table, line, None)  # Add type nodes
        declaration.addChildren(typeNode)
        for type in types:
            typePartNode = ASTNodeTerminal(type, typeNode, table, -1, line, None)  # Add the actual types
            typeNode.addChildren(typePartNode)

        var = ASTNodeTerminal(name, declaration, table, "IDENTIFIER", line, None)  # Add enum variable
        declaration.addChildren(var)
        equalSign = ASTNodeTerminal("=", declaration, table, -1, line, None)  # Add '='
        declaration.addChildren(equalSign)
        expr = ASTNode("Expr", declaration, table, line, None)  # Add value nodes
        declaration.addChildren(expr)
        literal = ASTNode("Literal", expr, table, line, None)
        expr.addChildren(literal)

        terminalType = ""
        if "FLOAT" in types:
            terminalType = "FLOAT"
            value = float(value)
        elif "INT" in types:
            terminalType = "INT"
            value = int(value)
        elif "CHAR" in types:
            terminalType = "CHAR"

        valueNode = ASTNodeTerminal(value, literal, table, terminalType, line, None)
        literal.addChildren(valueNode)
        return name

    @staticmethod
    def make_manual_typedef(line: str, baseTypes: list, replaceType: str, table, grandparent, insertIndex: int):
        """
        Create a manual typedef without relying on ctx for AST manipulation
        :return:
        """
        parent = ASTNode("Typedef", grandparent, table, line, None)
        grandparent.insertChild(insertIndex, parent)

        node_typedef = ASTNodeTerminal("typedef", parent, table, -1, line, None)
        parent.addChildren(node_typedef)

        node_Type = ASTNode("Type", parent, table, line, None)  # Add the type translations
        parent.addChildren(node_Type)
        for type in baseTypes:  # Add base types
            node_baseType = ASTNodeTerminal(type, node_Type, table, -1, line, None)
            node_Type.addChildren(node_baseType)

        node_typedef_part2 = ASTNodeTerminal(replaceType, parent, table, "IDENTIFIER", line, None)  # Add second part of typedef
        parent.addChildren(node_typedef_part2)
