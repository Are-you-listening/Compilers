from src.parser.ASTVisitor import *
from src.parser.CFunctionExecuter import *


class ConstantFoldingVisitor(ASTVisitor):
    def __init__(self, lexer):
        self.lexer = lexer

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

        if node.getChildAmount() == node.getTerminalAmount() == 3:
            """Checked for BINARY operations"""

            """
            In this case we want to constant fold we our 3 Terminal children 
            Our format will be something like this: (5+6) (with the middle child being the operator)
            """
            type_name = node.getChild(1).text
            foldable = {'*': BinaryOperations.Multiply,
                        '/': BinaryOperations.Divide,
                        '%': BinaryOperations.Modulus,
                        '>>': BitOperations.BitwiseRightshift,
                        '<<': BitOperations.BitwiseLeftshift,
                        '&': BitOperations.BitAnd,
                        '|': BitOperations.BitOr,
                        '^': BitOperations.BitExclusive,
                        '+': BinaryOperations.Add,
                        '-': BinaryOperations.Subtract,
                        '<': RelationalOperations.LessThan,
                        '>': RelationalOperations.GreaterThan,
                        '<=': RelationalOperations.LessThanOrEqualTo,
                        '>=': RelationalOperations.GreaterThanOrEqualTo,
                        '==': RelationalOperations.EqualTo,
                        '!=': RelationalOperations.NotEqualTo,
                        '||': LogicalOperations.LogicalOr,
                        '&&': LogicalOperations.LogicalAnd}

            if type_name not in foldable:
                return

            datatype_name = node.getChild(0).type
            result = str(IntByte.checkRange(foldable[node.getChild(1).text](int(node.getChild(0).text), int(node.getChild(2).text))))

        elif node.getChildAmount() == node.getTerminalAmount() == 2:
            """Check for UNARY operations"""

            type_name = node.getChild(0).text
            foldable = {'+': UnaryOperations.Plus,
                        '-': UnaryOperations.Min,
                        '~': BitOperations.BitNot,
                        '!': LogicalOperations.LogicalNot}

            if type_name not in foldable:
                return

            datatype_name = node.getChild(1).type
            result = str(IntByte.checkRange(foldable[node.getChild(0).text](int(node.getChild(1).text))))

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

        if parent.getChildAmount() == 1:
            index = grand_parent.findChild(parent)
            grand_parent.setChild(index, node)
            # Overwrite index of parent with node

            self.visitNodeTerminal(node)
