from src.parser.CTypes.CFunctionExecuterInt import *
from src.parser.CTypes.CFunctionExecuterChar import *
from src.parser.CTypes.CFunctionExecuterFloat import *
from src.parser.ErrorExporter import *
from src.parser.CTypes.InvalidOperatorFloatError import InvalidOperatorFloatError
from src.parser.CTypes.InvalidOperatorPtrError import InvalidOperatorPtrError
types = ["BOOL", "CHAR", "INT", "FLOAT"]


class RichnessChecker:
    def __init__(self, rich_order: list):
        self.rich_order = rich_order

    def get_poorest(self, val1: str, val2: str):

        index1 = self.rich_order.index(val1)
        index2 = self.rich_order.index(val2)
        return self.rich_order[min(index1, index2)]

    def get_richest(self, val1: str, val2: str):
        index1 = self.rich_order.index(val1)
        index2 = self.rich_order.index(val2)
        return self.rich_order[max(index1, index2)]


class COperationHandler:
    def __init__(self):
        self.richness_checker = RichnessChecker(types)
        self.c_type_executors = {"INT": CFunctionExecuterInt, "CHAR": CFunctionExecuterChar, "FLOAT": CFunctionExecuterFloat, "BOOL": CFunctionExecuterInt}

    def doOperationBinary(self, val1: tuple, val2: tuple, operation: str, lineNr: int):

        if val1[1] == val2[1] == "PTR":
            poorest_type = "PTR"
        else:
            poorest_type = self.richness_checker.get_richest(val1[1], val2[1])

        """
        make sure we do the right type of operation (int op, char op, ...) and the values need to be converted
        to the poorest type
        """
        c_type1 = self.c_type_executors[val1[1]]()
        c_type2 = self.c_type_executors[val2[1]]()

        data1 = c_type1.fromString(val1[0])
        data2 = c_type2.fromString(val2[0])

        data1 = c_type1.convertTo(data1, poorest_type)
        data2 = c_type2.convertTo(data2, poorest_type)

        c_type = self.c_type_executors[poorest_type]()

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
            return None
        try:
            sub_result = c_type.RangeCheck.checkRange(
            foldable[operation](data1, data2))
        except ZeroDivisionError as e:
            ErrorExporter.divideByZero(lineNr, data1)
        except InvalidOperatorFloatError as e:
            ErrorExporter.invalidOperatorFloat(operation, lineNr)
        except InvalidOperatorPtrError as e:
            ErrorExporter.invalidOperatorPtr(operation, lineNr)

        result = c_type.getString(sub_result)

        return result, poorest_type

    def doOperationUnary(self, val1: tuple, operation: str, lineNr: int):

        c_type = self.c_type_executors[val1[1]]()
        data1 = c_type.fromString(val1[0])

        foldable = {'+': c_type.UnaryOperations.Plus,
                    '-': c_type.UnaryOperations.Min,
                    '~': c_type.BitOperations.BitNot,
                    '!': c_type.LogicalOperations.LogicalNot}

        if operation not in foldable:
            return

        try:
            sub_result = c_type.RangeCheck.checkRange(foldable[operation](data1))

        except InvalidOperatorFloatError as e:
            ErrorExporter.invalidOperatorFloat("UNARY "+operation, lineNr)
        except InvalidOperatorPtrError as e:
            ErrorExporter.invalidOperatorPtr("UNARY "+operation, lineNr)

        result = c_type.getString(sub_result)

        return result, val1[1]
