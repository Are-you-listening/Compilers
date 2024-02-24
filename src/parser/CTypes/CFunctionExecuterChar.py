import math
from src.parser.CTypes.CFunctionExecuter import CFunctionExecuter


class _RangeCheck:
    @staticmethod
    def checkRange(value):
        """assume 1 bytes/ char"""
        b = value.to_bytes(8, byteorder="big", signed=True)
        b = b[-1:]
        return int.from_bytes(b, 'big', signed=True)


class _UnaryOperations:
    """
    Unary functions equivalent to the functionality of C
    """
    @staticmethod
    def Plus(a):
        return a

    @staticmethod
    def Min(a):
        return a * -1


class _BinaryOperations:
    """
    Binary functions equivalent to the functionality of C
    """
    @staticmethod
    def Add(a, b):
        return a + b

    @staticmethod
    def Subtract(a, b):
        return a - b

    @staticmethod
    def Divide(a: int, b: int):
        return math.floor(a / b)

    @staticmethod
    def Multiply(a, b):
        return a * b

    @staticmethod
    def Modulus(a, b):
        return a % b


class _LogicalOperations:
    """
    Logical functions equivalent to the functionality of C
    """

    @staticmethod
    def LogicalAnd(a: int, b: int):
        if a and b:
            return 1
        else:
            return 0

    @staticmethod
    def LogicalOr(a: int, b: int):
        if a or b:
            return 1
        else:
            return 0

    @staticmethod
    def LogicalNot(a: int):
        if a == 0:
            return 1
        else:
            return 0


class _BitOperations:
    """
    Bit functions equivalent to the functionality of C
    """

    @staticmethod
    def BitAnd(a: int, b: int):
        return a & b

    @staticmethod
    def BitOr(a: int, b: int):
        return a | b

    @staticmethod
    def BitNot(a: int):
        return ~a

    @staticmethod
    def BitExclusive(a: int, b: int):
        return a ^ b

    @staticmethod
    def BitwiseLeftshift(a, b):
        if b < 0:
            return 0
        return a << b

    @staticmethod
    def BitwiseRightshift(a, b):

        a = a.to_bytes(32, byteorder="big", signed=True)
        a = int.from_bytes(a, 'big', signed=True)
        b = b.to_bytes(32, byteorder="big", signed=True)
        b = int.from_bytes(b, "big", signed=False)
        return a >> b


class _RelationalOperations:
    """
    Relation functions equivalent to the functionality of C
    """

    @staticmethod
    def LessThan(a, b):
        return int(a < b)

    @staticmethod
    def GreaterThan(a, b):
        return int(a > b)

    @staticmethod
    def LessThanOrEqualTo(a, b):
        return int(a <= b)

    @staticmethod
    def GreaterThanOrEqualTo(a, b):
        return int(a >= b)

    @staticmethod
    def EqualTo(a, b):
        return int(a == b)

    @staticmethod
    def NotEqualTo(a, b):
        return int(a != b)


class CFunctionExecuterChar(CFunctionExecuter):
    def __init__(self):
        super(CFunctionExecuter, self).__init__()

        self.RangeCheck = _RangeCheck
        self.UnaryOperations = _UnaryOperations
        self.BinaryOperations = _BinaryOperations
        self.LogicalOperations = _LogicalOperations
        self.BitOperations = _BitOperations
        self.RelationalOperations = _RelationalOperations
        self.conversion_dict = {"Float": ""}

    def fromString(self, string: str):
        return ord(string[1])

    def convertTo(self, data, to_type):
        if to_type == "CHAR":
            return data

    def getString(self, data):
        return f"'{chr(data)}'"
