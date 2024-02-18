from src.parser.ASTVisitor import *


class ConstantFoldingVisitor(ASTVisitor):
    def __init__(self, lexer):
        self.lexer = lexer

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        #check for (BASE) operations
        if node.getChildAmount() == node.getTerminalAmount() == 3:
            type_name = self.lexer.ruleNames[node.getChild(1).type-1]
            type_name = node.getChild(1).text
            foldable = ['*', '/', '%', '>>', '<<', '&', '|', '~', '^', '+', '-']

            if type_name not in foldable:
                return

            parent = node.parent
            if parent is None:
                return

            datatype_name = node.getChild(0).type

            # Make into 1 node
            index = parent.findChild(node)
            node = ASTNodeTerminal(eval(f"{node.getChild(0).text}{node.getChild(1).text}{node.getChild(2).text}"), parent, datatype_name)
            parent.setChild(index, node)

        #check for UNARY operations
        elif node.getChildAmount() == node.getTerminalAmount() == 2:
            type_name = self.lexer.ruleNames[node.getChild(0).type - 1]
            type_name = node.getChild(0).text
            foldable = ['+', '-']

            if type_name not in foldable:
                return

            parent = node.parent
            if parent is None:
                return

            datatype_name = node.getChild(1).type
            # Make into 1 node
            index = parent.findChild(node)
            node = ASTNodeTerminal(eval(f"{node.getChild(0).text}{node.getChild(1).text}"),
                                   parent, datatype_name)
            parent.setChild(index, node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        parent = node.parent
        if (parent == None):
            return

        grand_parent = parent.parent
        if (grand_parent == None):
            return

        if parent.getChildAmount() == 1:
            index = grand_parent.findChild(parent)
            grand_parent.setChild(index, node)
            #Overwrite index of parent with node

            self.visitNodeTerminal(node)