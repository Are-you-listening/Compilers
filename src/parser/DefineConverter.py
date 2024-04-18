from src.parser.ASTVisitor import *
from src.parser.EnumConverter import *

definelist = []


class DefineConverter(ASTVisitor):
    """
    Convert simplistic defines to typedefs and const variables (to propagate them) ~ to defines
    """

    def __init__(self):
        self.toDelete = []

    def visit(self, ast: AST):
        self.preorder(ast.root)

        for node in self.toDelete:  # Delete the older nodes
            node.parent.removeChild(node)

    def visitNode(self, node: ASTNode):
        if node.text != "Define":
            return

        line = node.linenr
        self.toDelete.append(node)
        parent = node.parent
        valuePart = node.children[2]  # The node in which the RHS of a define is stored
        if valuePart.text == '-':
            valuePart = node.children[3]
            valuePart.children[0].text = '-' + valuePart.children[0].text
        identPart = node.children[1]  # The nod ein which the LHS of a define is stored

        if valuePart.text == 'Literal':  # It's an actual value; convert to const <type> value
            temp = EnumConverter.make_manual_declaration(node.parent, line, identPart.text,
                                                         [valuePart.children[0].type], valuePart.children[0].text,
                                                         node.symbol_table, parent.findChild(node))
            definelist.append(
                temp)  # Keep track of the defines, since they may be used in declarations in the Global Space (See GlobalConstrained)
        elif valuePart.text == 'Type':  # It's a type define; convert to typedef
            baseTypes = ["const"]
            for child in valuePart.children:
                baseTypes.append(child.text)
            EnumConverter.make_manual_typedef(line, baseTypes, identPart.text, node.symbol_table, node.parent,
                                              parent.findChild(node))

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
