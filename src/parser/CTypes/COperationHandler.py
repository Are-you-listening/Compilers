from src.parser.CTypes.CFunctionExecuterInt import *


class RichnessChecker:
    def __init__(self, lexer, rich_order: list):
        self.lexer = lexer
        self.rich_order = rich_order

    def get_poorest(self, val1: tuple, val2: tuple):
        type1 = self.lexer.ruleNames[val1[1]-1]
        type2 = self.lexer.ruleNames[val2[1]-1]

        index1 = self.rich_order.index(type1)
        index2 = self.rich_order.index(type2)
        return self.rich_order[min(index1, index2)]


class COperationHandler:
    def __init__(self, lexer):
        self.richness_checker = RichnessChecker(lexer, ["CHAR", "INT", "FLOAT"])

    def doOperationBinary(self, val1: tuple, val2: tuple, operation: str):
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

        if operation not in foldable:
            return

        poorest_type = self.richness_checker.get_poorest(val1, val2)
        #print(poorest_type)

        result = str(c_type.RangeCheck.checkRange(
            foldable[operation](int(val1[0]), int(val2[0]))))

        return result

    def doOperationUnary(self, val1: tuple, operation: str):
        c_type = CFunctionExecuterInt()

        foldable = {'+': c_type.UnaryOperations.Plus,
                    '-': c_type.UnaryOperations.Min,
                    '~': c_type.BitOperations.BitNot,
                    '!': c_type.LogicalOperations.LogicalNot}

        if operation not in foldable:
            return

        result = str(c_type.RangeCheck.checkRange(foldable[operation](int(val1[0]))))
        return result
