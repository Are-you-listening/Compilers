import math
from src.parser.CTypes.CFunctionExecuter import CFunctionExecuter
import struct

class _RangeCheck:
    @staticmethod
    def checkRange(value):
        """assume 4 bytes/ float"""
        b = struct.pack("f", value)
        b = b[-4:]

        return struct.unpack("f", b)[0]


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
    def Divide(a, b):
        return a / b

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
    def LogicalAnd(a, b):
        if a and b:
            return 1
        else:
            return 0

    @staticmethod
    def LogicalOr(a, b):
        if a or b:
            return 1
        else:
            return 0

    @staticmethod
    def LogicalNot(a):
        if a == 0:
            return 1
        else:
            return 0


class _BitOperations:
    """
    Bit functions equivalent to the functionality of C
    """

    @staticmethod
    def BitAnd(a, b):
        return a & b

    @staticmethod
    def BitOr(a, b):
        return a | b

    @staticmethod
    def BitNot(a):
        return ~a

    @staticmethod
    def BitExclusive(a, b):
        return a ^ b

    @staticmethod
    def BitwiseLeftshift(a, b):
        if b < 0:
            return 0
        return a << b

    @staticmethod
    def BitwiseRightshift(a, b):
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


class _Conversions:
    @staticmethod
    def ToChar(value):
        """assume 4 bytes/ int"""
        value = int(value)
        b = value.to_bytes(8, byteorder="big", signed=True)
        b = b[-1:]
        return int.from_bytes(b, 'big', signed=True)

    @staticmethod
    def ToInt(value):
        """assume 4 bytes/ int"""
        value = int(value)
        b = value.to_bytes(32, byteorder="big", signed=True)
        b = b[-4:]
        return int.from_bytes(b, 'big', signed=True)


class CFunctionExecuterFloat(CFunctionExecuter):
    def __init__(self):
        super(CFunctionExecuter, self).__init__()

        self.RangeCheck = _RangeCheck
        self.UnaryOperations = _UnaryOperations
        self.BinaryOperations = _BinaryOperations
        self.LogicalOperations = _LogicalOperations
        self.BitOperations = _BitOperations
        self.RelationalOperations = _RelationalOperations
        self.conversion_dict = {"CHAR": _Conversions.ToChar,
                                "INT": _Conversions.ToInt}

    def fromString(self, string):
        return float(string)

    def convertTo(self, data, to_type):
        if to_type == "FLOAT":
            return data

        return self.conversion_dict[to_type](data)

    def getString(self, data):
        return str(data)
