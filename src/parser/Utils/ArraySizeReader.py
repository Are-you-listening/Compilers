from src.parser.AST import ASTNode, ASTNodeTerminal
from src.interal_tools import *
from src.parser.ErrorExporter import ErrorExporter


class ArraySizeReader:
    """
    This class helps with reading information about the array
    """

    @staticmethod
    def readSize(array_node: ASTNode):
        """
        Retrieve the size information of an array

        :param array_node: array node whose sizes we want to retrieve
        """

        PreConditions.assertEqual(array_node.text, "ARRAY")
        PreConditions.assertNOTEqual(array_node.getChildAmount(), 0)

        """
        Go through the array and retrieve the array values
        """
        array_sizes = []
        for child in array_node.children:
            if not isinstance(child, ASTNodeTerminal):
                ErrorExporter.invalidArraySize(array_node.position, array_node.parent.getChild(1).text,
                                               (("Expression", False), []))
            if child.type != "INT":
                ErrorExporter.invalidArraySize(array_node.position, array_node.parent.getChild(1).text,
                                               ((child.type, False), []))

            array_sizes.append(child.text)

        return array_sizes
