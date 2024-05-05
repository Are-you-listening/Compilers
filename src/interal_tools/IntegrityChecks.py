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

    @staticmethod
    def assertIn(object_value, object_list):
        assert object_value in object_list

    @staticmethod
    def assertListInstanceOff(object_value_list: list, object_type):
        PreConditions.assertInstanceOff(object_value_list, list)
        for object_value in object_value_list:
            PreConditions.assertInstanceOff(object_value, object_type)
