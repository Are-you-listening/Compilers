import math
from src.parser.CTypes.CFunctionExecuter import *
import struct
from src.parser.ErrorExporter import *


class _RangeCheck(BaseRangeCheck):
    @staticmethod
    def checkRange(value):
        """assume 4 bytes/ float"""
        b = struct.pack("f", value)
        b = b[-4:]

        return struct.unpack("f", b)[0]


class _UnaryOperations(BaseUnaryOperations):
    """
    Unary functions equivalent to the functionality of C
    """


class _BinaryOperations(BaseBinaryOperations):
    """
    Binary functions equivalent to the functionality of C
    """
    @staticmethod
    def Divide(a, b):
        if isinstance(b, float) and math.copysign(1, b) == -1.0 and b == 0.0:
            return float('-inf')  # Return negative infinity for -0.0
        elif b == 0.0:
            return float('inf')  # Return positive infinity for 0.0
        else:
            return a / b

    @staticmethod
    def Modulus(a, b):
        ErrorExporter.invalidOperatorFloat("%")
        return -1


class _LogicalOperations(BaseLogicalOperations):
    """
    Logical functions equivalent to the functionality of C
    """


class _BitOperations(BaseBitOperations):
    """
    Bit functions equivalent to the functionality of C
    """

    @staticmethod
    def BitAnd(a, b):
        ErrorExporter.invalidOperatorFloat("&")
        return -1

    @staticmethod
    def BitOr(a, b):
        ErrorExporter.invalidOperatorFloat("|")
        return -1

    @staticmethod
    def BitNot(a):
        ErrorExporter.invalidOperatorFloat("~")
        return -1

    @staticmethod
    def BitExclusive(a, b):
        ErrorExporter.invalidOperatorFloat("^")
        return -1

    @staticmethod
    def BitwiseLeftshift(a, b):
        ErrorExporter.invalidOperatorFloat("<<")
        return -1

    @staticmethod
    def BitwiseRightshift(a, b):
        ErrorExporter.invalidOperatorFloat(">>")
        return -1


class _RelationalOperations(BaseRelationalOperations):
    """
    Relation functions equivalent to the functionality of C
    """


class _Conversions:
    @staticmethod
    def ToChar(value):
        """assume 4 bytes/ int"""
        value = int(math.floor(float(value)))
        b = value.to_bytes(8, byteorder="big", signed=True)
        b = b[-1:]
        return f"'{chr(int.from_bytes(b, 'big', signed=True))}'"

    @staticmethod
    def ToInt(value):
        """assume 4 bytes/ int"""
        value = int(math.floor(float(value)))
        b = value.to_bytes(32, byteorder="big", signed=True)
        b = b[-4:]
        return int.from_bytes(b, 'big', signed=True)

    @staticmethod
    def ToBool(value):
        """assume 4 bytes/ float"""
        value = int(value != 0)

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
                                "INT": _Conversions.ToInt,
                                "BOOL": _Conversions.ToBool}

    def fromString(self, string):
        return float(string)

    def convertTo(self, data, to_type):
        if to_type == "FLOAT":
            return data

        return self.conversion_dict[to_type](data)

    def getString(self, data):
        return str(data)
