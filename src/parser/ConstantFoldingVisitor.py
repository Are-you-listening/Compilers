from src.parser.ASTVisitor import *
from src.parser.CTypes.CFunctionExecuterInt import *


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

            c_type = CFunctionExecuterInt()

            foldable = {'*': c_type.BinaryOperations.Multiply,
                        '/': c_type.BinaryOperations.Divide,
                        '%': c_type.BinaryOperations.Modulus,
                        '>>': c_type.BitOperations.BitwiseRightshift,
                        '<<': c_type.BitOperations.BitwiseLeftshift,
                        '&': c_type.BitOperations.BitAnd,
                        '|': c_type.BitOperations.BitOr,
                        '^': c_type.BitOperations.BitExclusive,
                        '+': c_type.BinaryOperations.Add,
                        '-': c_type.BinaryOperations.Subtract,
                        '<': c_type.RelationalOperations.LessThan,
                        '>': c_type.RelationalOperations.GreaterThan,
                        '<=': c_type.RelationalOperations.LessThanOrEqualTo,
                        '>=': c_type.RelationalOperations.GreaterThanOrEqualTo,
                        '==': c_type.RelationalOperations.EqualTo,
                        '!=': c_type.RelationalOperations.NotEqualTo,
                        '||': c_type.LogicalOperations.LogicalOr,
                        '&&': c_type.LogicalOperations.LogicalAnd}

            if type_name not in foldable:
                return

            datatype_name = node.getChild(0).type
            result = str(c_type.RangeCheck.checkRange(foldable[node.getChild(1).text](int(node.getChild(0).text), int(node.getChild(2).text))))

        elif node.getChildAmount() == node.getTerminalAmount() == 2:
            """Check for UNARY operations"""

            type_name = node.getChild(0).text

            c_type = CFunctionExecuterInt()

            foldable = {'+': c_type.UnaryOperations.Plus,
                        '-': c_type.UnaryOperations.Min,
                        '~': c_type.BitOperations.BitNot,
                        '!': c_type.LogicalOperations.LogicalNot}

            if type_name not in foldable:
                return

            datatype_name = node.getChild(1).type
            result = str(c_type.RangeCheck.checkRange(foldable[node.getChild(0).text](int(node.getChild(1).text))))

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

        if parent.getChildAmount() == 1 and (parent.text in ("Literal", "Expr")) and node.type != self.lexer.IDENTIFIER:
            index = grand_parent.findChild(parent)
            grand_parent.setChild(index, node)
            # Overwrite index of parent with node

            self.visitNodeTerminal(node)
