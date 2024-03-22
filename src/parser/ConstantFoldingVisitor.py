from src.parser.ASTVisitor import *
from src.parser.CTypes.COperationHandler import COperationHandler


class ConstantFoldingVisitor(ASTVisitor):
    def __init__(self):
        self.operation_handler = COperationHandler()

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
        if node.getChildAmount() == 1 and (node.text in ("Literal", "Expr")):
            if parent is None:
                return

            index = parent.findChild(node)
            parent.setChild(index, node.getChild(0))
            # Overwrite index of parent with node

        if node.text != "Expr":
            return

        if node.getChildAmount() == node.getTerminalAmount() == 3:
            """Checked for BINARY operations"""

            """
            In this case we want to constant fold we our 3 Terminal children 
            Our format will be something like this: (5+6) (with the middle child being the operator)
            """

            if node.getChild(0).type == "IDENTIFIER":
                return
            if node.getChild(2).type == "IDENTIFIER":
                return

            result, datatype_name = self.operation_handler.doOperationBinary(
                (node.getChild(0).text, node.getChild(0).type),
                (node.getChild(2).text, node.getChild(2).type),
                node.getChild(1).text, node.linenr)

        elif node.getChildAmount() == node.getTerminalAmount() == 2:
            """Check for UNARY operations"""

            if node.getChild(1).type == "IDENTIFIER" or node.getChild(1).text == '++' or node.getChild(1).text == '--':
                return

            result, datatype_name = self.operation_handler.doOperationUnary(
                (node.getChild(1).text, node.getChild(1).type),
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
        pass
