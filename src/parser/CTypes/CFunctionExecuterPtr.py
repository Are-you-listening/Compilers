from src.parser.CTypes.CFunctionExecuter import *
import struct
from src.parser.ErrorExporter import *
from src.parser.CTypes.InvalidOperatorPtrError import *


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

    @staticmethod
    def Plus(a):
        raise InvalidOperatorPtrError("UNARY +")

    @staticmethod
    def Min(a):
        raise InvalidOperatorPtrError("UNARY -")


class _BinaryOperations(BaseBinaryOperations):
    """
    Binary functions equivalent to the functionality of C
    """

    @staticmethod
    def Add(a, b):
        raise InvalidOperatorPtrError("+")

    @staticmethod
    def Subtract(a, b):
        raise InvalidOperatorPtrError("-")

    @staticmethod
    def Divide(a, b):
        raise InvalidOperatorPtrError("/")

    @staticmethod
    def Multiply(a, b):
        raise InvalidOperatorPtrError("*")

    @staticmethod
    def Modulus(a, b):
        raise InvalidOperatorPtrError("%")


class _LogicalOperations(BaseLogicalOperations):
    """
    Logical functions equivalent to the functionality of C
    """

    @staticmethod
    def LogicalAnd(a, b):
        raise InvalidOperatorPtrError("&&")

    @staticmethod
    def LogicalOr(a, b):
        raise InvalidOperatorPtrError("||")

    @staticmethod
    def LogicalNot(a):
        raise InvalidOperatorPtrError("!")


class _BitOperations(BaseBitOperations):
    """
    Bit functions equivalent to the functionality of C
    """

    @staticmethod
    def BitAnd(a, b):
        raise InvalidOperatorPtrError("&")

    @staticmethod
    def BitOr(a, b):
        raise InvalidOperatorPtrError("|")

    @staticmethod
    def BitNot(a):
        raise InvalidOperatorPtrError("~")

    @staticmethod
    def BitExclusive(a, b):
        raise InvalidOperatorPtrError("^")

    @staticmethod
    def BitwiseLeftshift(a, b):
        raise InvalidOperatorPtrError("<<")

    @staticmethod
    def BitwiseRightshift(a, b):
        raise InvalidOperatorPtrError(">>")


class _RelationalOperations(BaseRelationalOperations):
    """
    Relation functions equivalent to the functionality of C
    """

    @staticmethod
    def LessThan(a, b):
        ErrorExporter.invalidOperatorFloat("<")
        return -1

    @staticmethod
    def GreaterThan(a, b):
        ErrorExporter.invalidOperatorFloat(">")
        return -1

    @staticmethod
    def LessThanOrEqualTo(a, b):
        ErrorExporter.invalidOperatorFloat("<=")
        return -1

    @staticmethod
    def GreaterThanOrEqualTo(a, b):
        ErrorExporter.invalidOperatorFloat(">=")
        return -1

    @staticmethod
    def EqualTo(a, b):
        ErrorExporter.invalidOperatorFloat("==")
        return -1

    @staticmethod
    def NotEqualTo(a, b):
        ErrorExporter.invalidOperatorFloat("!=")
        return -1


class _Conversions:
    @staticmethod
    def ToBool(value):
        """assume 4 bytes/ float"""
        value = int(value != 0)

        b = value.to_bytes(32, byteorder="big", signed=True)
        b = b[-4:]

        return int.from_bytes(b, 'big', signed=True)


class CFunctionExecuterPtr(CFunctionExecuter):
    def __init__(self):
        super(CFunctionExecuter, self).__init__()

        self.RangeCheck = _RangeCheck
        self.UnaryOperations = _UnaryOperations
        self.BinaryOperations = _BinaryOperations
        self.LogicalOperations = _LogicalOperations
        self.BitOperations = _BitOperations
        self.RelationalOperations = _RelationalOperations
        self.conversion_dict = {"BOOL": _Conversions.ToBool}

    def fromString(self, string):
        return float(string)

    def convertTo(self, data, to_type):
        if to_type == "PTR":
            return data

        return self.conversion_dict[to_type](data)

    def getString(self, data):
        return str(data)
