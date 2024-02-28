from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ConstantFoldingVisitor(ASTVisitor):
    def __init__(self, lexer):
        self.lexer = lexer
        self.operation_handler = COperationHandler(lexer)

    def visit(self, ast: AST):
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        """
        check if we can do constant folding
        :param node: current node we are checking
        """

        parent = node.parent
        if parent is None:
            return

        """
        Only do constant folding on expressions
        """
        if node.text != "Expr":
            return

        if node.getChildAmount() == node.getTerminalAmount() == 3:
            """Checked for BINARY operations"""

            """
            In this case we want to constant fold we our 3 Terminal children 
            Our format will be something like this: (5+6) (with the middle child being the operator)
            """

            if node.getChild(0).type == self.lexer.IDENTIFIER:
                return
            if node.getChild(2).type == self.lexer.IDENTIFIER:
                return

            result, datatype_name = self.operation_handler.doOperationBinary((node.getChild(0).text, node.getChild(0).type),
                                                              (node.getChild(2).text, node.getChild(2).type),
                                                              node.getChild(1).text)

        elif node.getChildAmount() == node.getTerminalAmount() == 2:
            """Check for UNARY operations"""

            if node.node.getChild(1).type == self.lexer.IDENTIFIER:
                return

            result, datatype_name = self.operation_handler.doOperationUnary((node.getChild(1).text, node.getChild(1).type),
                                                             node.getChild(0).text)

        else:
            return

        """store the calculated value as an new node"""
        index = parent.findChild(node)

        node = ASTNodeTerminal(result,
                               parent, parent.getSymbolTable(), datatype_name)
        parent.setChild(index, node)

        """do the visiting again"""
        self.visitNodeTerminal(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        parent = node.parent
        if parent is None:
            return

        grand_parent = parent.parent
        if grand_parent is None:
            return

        if parent.getChildAmount() == 1 and (parent.text in ("Literal", "Expr")):
            index = grand_parent.findChild(parent)
            grand_parent.setChild(index, node)
            # Overwrite index of parent with node

            self.visitNodeTerminal(node)
