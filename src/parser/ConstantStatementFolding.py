from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class ConstantStatementFolding(ASTVisitor):
    """
    This visitor makes sure that IF statements that always have the same outcome, will not be a separate statement

    Their will be 2 situations:

    - Condition Always True, put block of if statement out of the statement, and remove the statement
    - Condition Always False, remove if statement and put 'Else' part out of statement if exists

    """
    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        """
        override the visit so we can remove after the traverse the nodes we don't need anymore

        :param ast: 
        :return: 
        """
        self.preorder(ast.root)

        for t in self.to_remove:
            t_children = t.children

            index = t.parent.findChild(t)
            t.parent.removeChild(t)
            for i, child in enumerate(t_children):
                t.parent.insertChild(index + i, child)

    def visitNode(self, node: ASTNode):
        self.__check_if(node)
        self.__check_while(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def __check_if(self, node: ASTNode):
        if node.text != "IF":
            return

        condition = node.getChild(0)

        if not isinstance(condition, ASTNodeTerminal):
            return

        assert condition.type in ("BOOL", "INT")

        if_location = node.parent.findChild(node)

        if int(condition.text) == 1:
            """
            Move block of if statement outside the if statement
            """
            code_block = node.getChild(1)
            self.to_remove.add(code_block)

            node.parent.setChild(if_location, code_block)
            code_block.parent = node.parent

        if int(condition.text) == 0:
            """
            Move block of else statement outside the if statement
            """
            if node.getChildAmount() == 3:
                code_block = node.getChild(2)
                self.to_remove.add(code_block)

                node.parent.setChild(if_location, code_block)
                code_block.parent = node.parent
            else:
                node.parent.removeChild(node)

    def __check_while(self, node: ASTNode):
        if node.text != "WHILE":
            return

        condition = node.getChild(0)

        if not isinstance(condition, ASTNodeTerminal):
            return

        assert condition.type == "BOOL"

        if int(condition.text) == 0:
            node.parent.removeChild(node)
