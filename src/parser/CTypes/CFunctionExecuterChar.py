import math
from src.parser.CTypes.CFunctionExecuter import *
import struct


class _RangeCheck(BaseRangeCheck):
    @staticmethod
    def checkRange(value):
        """assume 1 byte/char"""
        b = value.to_bytes(8, byteorder="big", signed=True)
        b = b[-1:]

        val = int.from_bytes(b, 'big', signed=True)

        return val

    @staticmethod
    def toSigned(val: int):
        while val > 127:
            val -= 256
        return val

    @staticmethod
    def toUnsigned(val: int):
        while val < 0:
            val += 256
        return val


class _UnaryOperations(BaseUnaryOperations):
    """
    Unary functions equivalent to the functionality of C
    """


class _BinaryOperations(BaseBinaryOperations):
    """
    Binary functions equivalent to the functionality of C
    """

    @staticmethod
    def Subtract(a, b):
        return a - b

    @staticmethod
    def Divide(a: int, b: int):
        r = a / b
        r = math.floor(r)
        return r

    @staticmethod
    def Modulus(a, b):

        r = a - _BinaryOperations.Divide(a, b) * b
        return r


class _LogicalOperations(BaseLogicalOperations):
    """
    Logical functions equivalent to the functionality of C
    """


class _BitOperations(BaseBitOperations):
    """
    Bit functions equivalent to the functionality of C
    """

    @staticmethod
    def BitwiseRightshift(a, b):
        a = a.to_bytes(8, byteorder="big", signed=True)
        a = a[-1:]
        a = int.from_bytes(a, 'big', signed=True)
        b = b.to_bytes(8, byteorder="big", signed=True)
        b = int.from_bytes(b, "big", signed=False)
        return a >> b


class _RelationalOperations(BaseRelationalOperations):
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


class _Conversions:

    @staticmethod
    def ToInt(value):
        """assume 4 bytes/ int"""
        b = value.to_bytes(8, byteorder="big", signed=True)
        b = b[-1:]
        return int.from_bytes(b, 'big', signed=True)

    @staticmethod
    def ToFloat(value):
        """assume 4 bytes/ float"""
        value = float(value)
        b = struct.pack("f", value)
        b = b[-4:]

        return struct.unpack("f", b)[0]

    @staticmethod
    def ToBool(value):
        """assume 4 bytes/ float"""
        value = int(value != 0)

        b = value.to_bytes(32, byteorder="big", signed=True)
        b = b[-4:]

        return int.from_bytes(b, 'big', signed=True)


class CFunctionExecuterChar(CFunctionExecuter):
    def __init__(self):
        super(CFunctionExecuter, self).__init__()

        self.RangeCheck = _RangeCheck
        self.UnaryOperations = _UnaryOperations
        self.BinaryOperations = _BinaryOperations
        self.LogicalOperations = _LogicalOperations
        self.BitOperations = _BitOperations
        self.RelationalOperations = _RelationalOperations
        self.conversion_dict = {"INT": _Conversions.ToInt, "FLOAT": _Conversions.ToFloat, "BOOL": _Conversions.ToBool}

    def fromString(self, string: str):
        string = string.encode('utf-8').decode('unicode-escape')

        data = ord(string[1])
        return _RangeCheck.toSigned(data)

    def convertTo(self, data, to_type):
        if to_type == "CHAR":
            return data
        return self.conversion_dict[to_type](data)

    def getString(self, data):
        data = _RangeCheck.toUnsigned(data)
        return f"'{chr(data)}'"
