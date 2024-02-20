import math


class IntByte:
    @staticmethod
    def checkRange(value):
        """assume 4 bytes/ int"""
        b = value.to_bytes(32, byteorder="big", signed=True)
        b = b[-4:]
        return int.from_bytes(b, 'big', signed=True)


class UnaryOperations:
    @staticmethod
    def Plus(a):
        return a

    @staticmethod
    def Min(a):
        return a * -1


class BinaryOperations:

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


class LogicalOperations:

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


class BitOperations:
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


class RelationalOperations:
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
