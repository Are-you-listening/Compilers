import math
from src.parser.CTypes.CFunctionExecuter import *
import struct

class _RangeCheck(BaseRangeCheck):
    @staticmethod
    def checkRange(value):
        """assume 1 byte/char"""
        b = value.to_bytes(8, byteorder="big", signed=True)
        b = b[-1:]
        return int.from_bytes(b, 'big', signed=False)


class _UnaryOperations(BaseUnaryOperations):
    """
    Unary functions equivalent to the functionality of C
    """


class _BinaryOperations(BaseBinaryOperations):
    """
    Binary functions equivalent to the functionality of C
    """

    @staticmethod
    def Divide(a: int, b: int):
        r = a / b
        if r > 0:
            r = math.floor(r)
        else:
            r = math.ceil(r)
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

class CFunctionExecuterChar(CFunctionExecuter):
    def __init__(self):
        super(CFunctionExecuter, self).__init__()

        self.RangeCheck = _RangeCheck
        self.UnaryOperations = _UnaryOperations
        self.BinaryOperations = _BinaryOperations
        self.LogicalOperations = _LogicalOperations
        self.BitOperations = _BitOperations
        self.RelationalOperations = _RelationalOperations
        self.conversion_dict = {"INT": _Conversions.ToInt, "FLOAT": _Conversions.ToFloat}

    def fromString(self, string: str):
        return ord(string[1])

    def convertTo(self, data, to_type):
        if to_type == "CHAR":
            return data

        return self.conversion_dict[to_type](data)

    def getString(self, data):
        return f"'{chr(data)}'"
