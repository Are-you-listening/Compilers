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

    @staticmethod
    def Plus(a):
        ErrorExporter.invalidOperatorPtr("UNARY +")
        return -1

    @staticmethod
    def Min(a):
        ErrorExporter.invalidOperatorPtr("UNARY -")
        return -1


class _BinaryOperations(BaseBinaryOperations):
    """
    Binary functions equivalent to the functionality of C
    """

    @staticmethod
    def Add(a, b):
        ErrorExporter.invalidOperatorPtr("+")
        return -1

    @staticmethod
    def Subtract(a, b):
        ErrorExporter.invalidOperatorPtr("-")
        return -1

    @staticmethod
    def Divide(a, b):
        ErrorExporter.invalidOperatorPtr("/")
        return -1

    @staticmethod
    def Multiply(a, b):
        ErrorExporter.invalidOperatorPtr("*")
        return -1

    @staticmethod
    def Modulus(a, b):
        ErrorExporter.invalidOperatorPtr("%")
        return -1


class _LogicalOperations(BaseLogicalOperations):
    """
    Logical functions equivalent to the functionality of C
    """

    @staticmethod
    def LogicalAnd(a, b):
        ErrorExporter.invalidOperatorPtr("&&")
        return -1

    @staticmethod
    def LogicalOr(a, b):
        ErrorExporter.invalidOperatorPtr("||")
        return -1

    @staticmethod
    def LogicalNot(a):
        ErrorExporter.invalidOperatorPtr("!")
        return -1


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


class CFunctionExecuterPtr(CFunctionExecuter):
    def __init__(self):
        super(CFunctionExecuter, self).__init__()

        self.RangeCheck = _RangeCheck
        self.UnaryOperations = _UnaryOperations
        self.BinaryOperations = _BinaryOperations
        self.LogicalOperations = _LogicalOperations
        self.BitOperations = _BitOperations
        self.RelationalOperations = _RelationalOperations
        self.conversion_dict = {}

    def fromString(self, string):
        return float(string)

    def convertTo(self, data, to_type):
        if to_type == "PTR":
            return data

        return self.conversion_dict[to_type](data)

    def getString(self, data):
        return str(data)
