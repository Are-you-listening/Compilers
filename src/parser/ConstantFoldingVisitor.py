from src.parser.ASTConversion import *
from src.parser.CTypes.CFunctionExecuterInt import *
from src.parser.CTypes.CFunctionExecuterChar import *
from src.parser.CTypes.CFunctionExecuterFloat import *


class ConstantFoldingVisitor(ASTVisitor):
    def __init__(self):
        self.operation_handler = COperationHandler()

    def visit(self, ast: AST):
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):
        """
        check if we can do constant folding
        :param node: current node we are checking
        """

        parent = node.parent
        if parent is None:
            return

        """
        Only do constant folding on expressions
        """
        if node.getChildAmount() == 1 and (node.text in ("Literal", "Expr")):
            if parent is None:
                return

            index = parent.findChild(node)
            parent.setChild(index, node.getChild(0))
            # Overwrite index of parent with node

            # constant fold conversions
        if node.text == "Conversion" and node.getTerminalAmount() == 1:
            c_type_executors = {"INT": CFunctionExecuterInt,
                                "CHAR": CFunctionExecuterChar,
                                "FLOAT": CFunctionExecuterFloat,
                                "BOOL": CFunctionExecuterInt}
            for child in node.getChild(0).getChildren():
                if "*" in child.text:
                    return
            for child in node.getChild(0).getChildren():
                if child.text in c_type_executors:
                    to_type = child.text  # This scares me a little :( - Kars

            from_type = node.getChild(1).type
            if from_type == "IDENTIFIER":
                return
            c_type = c_type_executors[from_type]()
            data1 = c_type.fromString(node.getChild(1).text)
            # print(node.text, parent.text, "somehow to_type is not initialised, BOOL issue? - Kars")
            result = c_type.convertTo(data1, to_type)

            index = parent.findChild(node)

            c_type_to = c_type_executors[to_type]()
            node = ASTNodeTerminal(c_type_to.getString(result),
                                   parent, parent.getSymbolTable(), to_type, node.position, node.structTable)
            parent.setChild(index, node)

            return

        if node.text != "Expr":
            return
        # Check for constant folding with logical operators and variables
        if node.getChildAmount() == 3 and node.getTerminalAmount() == 2 and (
                node.getChild(1).text == "&&" or node.getChild(1).text == "||"):
            if self.logical_operations(node) is not None:
                result, datatype_name = self.logical_operations(node)
            else:
                index = parent.findChild(node)
                if isinstance(node.getChild(2), ASTNodeTerminal):
                    node = node.getChild(0)
                else:
                    node = node.getChild(2)
                parent.setChild(index, node)
                return
        elif node.getChildAmount() == node.getTerminalAmount() == 3:
            """Checked for BINARY operations"""

            """
            In this case we want to constant fold we our 3 Terminal children 
            Our format will be something like this: (5+6) (with the middle child being the operator)
            """
            if node.getChild(0).type == "IDENTIFIER":
                return
            if node.getChild(2).type == "IDENTIFIER":
                return

            result, datatype_name = self.operation_handler.doOperationBinary(
                (node.getChild(0).text, node.getChild(0).type),
                (node.getChild(2).text, node.getChild(2).type),
                node.getChild(1).text, int(node.position.linenr))

        elif node.getChildAmount() == node.getTerminalAmount() == 2:
            """Check for UNARY operations"""

            if node.getChild(1).type == "IDENTIFIER" or node.getChild(1).text == '++' or node.getChild(1).text == '--':
                return

            result, datatype_name = self.operation_handler.doOperationUnary(
                (node.getChild(1).text, node.getChild(1).type),
                node.getChild(0).text, node.position.linenr)

        else:
            return

        """store the calculated value as an new node"""
        index = parent.findChild(node)

        node = ASTNodeTerminal(result, parent, parent.getSymbolTable(), datatype_name, node.position, node.structTable)
        parent.setChild(index, node)

        """do the visiting again"""
        self.visitNodeTerminal(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def logical_operations(node: ASTNode):
        """
        Constant folding does some things extra for logical operations
        When we have a logical operation 'a || 1', we know the answer will always be true
        So we will directly evaluate this

        :param node: the node that contains a logical operation
        :return: result, datatype
        """

        """
        This code has 4 scenario's
        1. True || var => True
        2. False || var => var (convert to int 1 bit)
        3. True && var => var (convert to int 1 bit)
        4. False && var => False
        """
        logical_operator = node.getChild(1).text
        operand = node.getChild(2) if isinstance(node.getChild(2), ASTNodeTerminal) else node.getChild(0)

        if logical_operator == "||":
            if operand.text == "0":
                ASTConversion.addConversion(node.getChild(0) if operand == node.getChild(2) else node.getChild(2),
                                            (("BOOL", False), []))
                return None
            else:
                return "1", "INT"
        elif logical_operator == "&&":
            if operand.text == "0":
                return "0", "INT"
            else:
                ASTConversion.addConversion(node.getChild(0) if operand == node.getChild(2) else node.getChild(2),
                                            (("BOOL", False), []))
                return None

        return None
