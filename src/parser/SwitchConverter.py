from src.parser.ASTVisitor import *
from src.parser.ASTConversion import *


class SwitchConverter(ASTVisitor):
    """
    This visitor makes sure that the switch statement will be converted to a if else statement
    The receiving format for this visitor will be an SWITCH node with the following children in order:
    node 0: switched value
    all other nodes: ASTnode with name Case or Default
    Case Node: First child: case condition, Second child: code block
    Case Default: First child: code block

    """
    def __init__(self):
        self.break_map = {}
        self.to_add = []
        self.to_remove = set()

    def visit(self, ast: AST):

        """
        override the visit so we can remove after the traverse the nodes we don't need anymore

        """

        self.break_map = {}
        self.to_add = []
        self.to_remove = set()

        self.postorder(ast.root)

        for target, added in self.to_add:
            target.addChildren(added)
            added.parent = target

        for r in self.to_remove:
            r.parent.removeChild(r)

    def visitNode(self, node: ASTNode):

        """
        Update the break map (indicating if the subtree has a break)
        """

        for c in node.children:
            if c in self.break_map:
                self.break_map[node] = c
                break

        if node.text != "SWITCH":
            return

        """
        Translate all the children to IF Else
        By constantly creating a subtree
        """

        """
        Identifier we will use to verify our cases in our switch statement
        """
        switch_identifier = node.getChild(0)

        if not isinstance(switch_identifier, ASTNodeTerminal):
            raise Exception("Switch uses invalid identifier")

        equal_nodes = []

        for child in node.children[1:]:
            has_break = self.break_map.get(child, None) is not None

            if child.text == "CASE":
                equal_node = self.createEqualCheckNode(switch_identifier, child.getChild(0))
                equal_nodes.append((equal_node, child.getChild(1)))

                self.to_remove.add(child)

            if has_break:
                if len(equal_nodes) == 0:
                    continue

                connect_node = equal_nodes[0]

                for equal_node in equal_nodes[1:]:
                    print("he")
                    new_condition = self.createOrStatement(connect_node[0], equal_node[0])

                    sub_condition = self.createIfStatement(self.createCopy(connect_node[0]), connect_node[1])
                    sub_condition.addChildren(equal_node[1])
                    equal_node[1].parent = sub_condition

                    connect_node = (new_condition, sub_condition)

                print("w")
                equal_nodes.clear()

                if_node = self.createIfStatement(connect_node[0], connect_node[1])

                self.to_add.append((node, if_node))

                break

    def visitNodeTerminal(self, node: ASTNodeTerminal):

        if node.text != "break":
            return

        self.break_map[node] = node

    @staticmethod
    def createEqualCheckNode(node_1: ASTNodeTerminal, node_2: ASTNodeTerminal):
        check_node = ASTNode("Expr", None, node_1.getSymbolTable(), node_1.linenr)
        check_node.addChildren(ASTNodeTerminal(node_1.text, check_node, node_1.getSymbolTable(),
                                               node_1.type, node_1.linenr))

        equal = ASTNodeTerminal("==", check_node, node_1.getSymbolTable(), -1, node_1.linenr)
        check_node.addChildren(equal)

        check_node.addChildren(ASTNodeTerminal(node_2.text, check_node, node_2.getSymbolTable(),
                                               node_2.type, node_2.linenr))

        return check_node

    @staticmethod
    def createOrStatement(node_1: ASTNode, node_2: ASTNode):
        """
        Make an or between 2 nodes
        """
        check_node = ASTNode("Expr", None, node_1.getSymbolTable(), node_1.linenr)
        check_node.addChildren(node_1)
        node_1.parent = check_node

        or_node = ASTNodeTerminal("||", check_node, node_1.getSymbolTable(), -1, node_1.linenr)
        check_node.addChildren(or_node)

        check_node.addChildren(node_2)
        node_2.parent = check_node

        return check_node

    @staticmethod
    def createIfStatement(condition: ASTNode, execute_block: ASTNode):
        """
        Construction for If statement
        """

        check_node = ASTNode("IF", None, execute_block.getSymbolTable(), execute_block.linenr)
        check_node.addChildren(condition)
        condition.parent = check_node

        check_node.addChildren(execute_block)
        execute_block.parent = check_node

        """
        Give check node a 'code' parent
        """

        temp = ASTNode("Code", None, check_node.getSymbolTable(), check_node.linenr)
        check_node.parent = temp
        temp.addChildren(check_node)
        check_node = temp

        return check_node

    @staticmethod
    def createCopy(node: ASTNode):
        """
        Create a copy of this subtree, while keeping the same symbol table
        """

        if not isinstance(node, ASTNodeTerminal):
            new_node = ASTNode(node.text, node.parent, node.getSymbolTable(), node.linenr)
        else:
            new_node = ASTNodeTerminal(node.text, node.parent, node.getSymbolTable(), node.type, node.linenr)

        for child in node.children:
            copy_child = SwitchConverter.createCopy(child)
            new_node.addChildren(copy_child)
            copy_child.parent = new_node

        return new_node
