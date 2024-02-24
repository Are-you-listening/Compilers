import math
from abc import abstractmethod

class BaseRangeCheck:
    @staticmethod
    def checkRange(value):
        return value


class BaseUnaryOperations:
    """
    Unary functions equivalent to the functionality of C
    """
    @staticmethod
    def Plus(a):
        return a

    @staticmethod
    def Min(a):
        return a * -1


class BaseBinaryOperations:
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


class BaseLogicalOperations:
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


class BaseBitOperations:
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
        return a >> b


class BaseRelationalOperations:
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


class CFunctionExecuter:
    def __init__(self):
        self.RangeCheck = BaseRangeCheck
        self.UnaryOperations = BaseUnaryOperations
        self.BinaryOperations = BaseBinaryOperations
        self.LogicalOperations = BaseLogicalOperations
        self.BitOperations = BaseBitOperations
        self.RelationalOperations = BaseRelationalOperations
        self.conversion_dict = {}

    @abstractmethod
    def fromString(self, string):
        pass

    def getString(self, data):
        return str(data)

    @abstractmethod
    def convertTo(self, data, to_type):
        pass
