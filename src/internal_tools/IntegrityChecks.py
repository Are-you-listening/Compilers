class PreConditions:
    """
    Do precondition checks for assumptions we make

    """

    @staticmethod
    def assertEqual(a, b):
        PreConditions.assertTrue(a == b)

    @staticmethod
    def assertNOTEqual(a, b):
        PreConditions.assertTrue(a != b)

    @staticmethod
    def assertInstanceOff(object_value, object_type):
        PreConditions.assertTrue(isinstance(object_value, object_type))

    @staticmethod
    def assertIn(object_value, object_list):
        PreConditions.assertTrue(object_value in object_list)

    @staticmethod
    def assertListInstanceOff(object_value_list: list, object_type):
        PreConditions.assertInstanceOff(object_value_list, list)
        for object_value in object_value_list:
            PreConditions.assertInstanceOff(object_value, object_type)

    @staticmethod
    def assertTrue(value: bool):
        """
        It being an internal tool, Preconditions will not be checked when handing in the assignment :)
        """
        assert value
