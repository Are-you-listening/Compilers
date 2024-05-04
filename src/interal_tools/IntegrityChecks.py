class PreConditions:

    @staticmethod
    def assertEqual(a, b):
        assert a == b

    @staticmethod
    def assertNOTEqual(a, b):
        assert a != b

    @staticmethod
    def assertInstanceOff(object_value, object_type):
        assert isinstance(object_value, object_type)
