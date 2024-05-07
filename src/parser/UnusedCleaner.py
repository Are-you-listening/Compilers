
from src.parser.ASTVisitor import ASTVisitor
from src.parser.AST import ASTNode, ASTNodeTerminal, ASTNodeTypes
from src.internal_tools import *
import typing
from src.parser.AST import AST
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType


class UnusedCleaner(ASTVisitor):
    """
    Convert SizeOf expressions, to an integer indicating the size of this type
    """
    def __init__(self):
        self.to_remove = set()
        self.usefull = {}
        self.usage_map = {}

    def visit(self, ast: AST):
        self.to_remove = set()
        self.usefull = {}
        self.usage_map = {}

        self.postorder(ast.root)

        self.check_assignment()

        for r in self.to_remove:
            r.parent.removeChild(r)

    def visitNode(self, node: ASTNode):
        if node.text in ("Code", "Scope"):
            for c in node.children:
                if c.text == "Expr" and not self.usefull.get(c, False):

                    self.to_remove.add(c)
                    self.handle_usefull(c, c)

        for child in node.children:
            if self.usefull.get(child, False):
                self.usefull[node] = True
                return

        if node.text == "Expr" and node.getChildAmount() == 2 and \
                (node.getChild(0).text in ("++", "--") or node.getChild(1).text in ("++", "--")):
            self.usefull[node] = True

        if node.text in ("Assignment", "Declaration"):

            self.usefull[node] = True

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            self.usefull[node] = True

            symbol_entry = node.getSymbolTable().getEntry(node.text, node.position.virtual_linenr)

            u = self.usage_map.get(symbol_entry, [])

            u.append(node)

            self.usage_map[symbol_entry] = u

        if node.text == "()":
            self.usefull[node] = True

    def handle_usefull(self, part_as_node: ASTNode, node: ASTNode):
        """
        Remove useless code, but keep usefull

        :param part_as_node: node that will be removed like an assignent
        :param node: right hand side
        :return:
        """

        usefull = False
        for c in node.children:
            if not self.usefull.get(c, False):
                continue
            usefull = True
            part_as_node = self.handle_usefull(part_as_node, c)

        if not usefull and self.usefull.get(node, False):
            """
            Keep this code
            """
            if node == part_as_node:
                self.to_remove.discard(node)
                return part_as_node

            node.parent.removeChild(node)
            insert_index = part_as_node.parent.findChild(part_as_node)
            part_as_node.parent.insertChild(insert_index, node)
            node.parent = part_as_node.parent

            part_as_node = node

        return part_as_node

    def check_assignment(self):
        """
        Check if variables are only assigned at this point
        """
        for k, v in self.usage_map.items():
            v.sort(key=lambda x:x.position.virtual_linenr)
            self.usage_map[k] = v

        changed = True
        while changed:
            changed = False
            for k, v in self.usage_map.items():
                no_other_use = set()
                for use in v:

                    if use.parent.text in ("Declaration", "Assignment", "Code", "Scope") and use.parent.findChild(use) == 0:

                        temp = use
                        while temp.text not in ("Function", "WHILE", "Start"):
                            temp = temp.parent

                        if temp.text == "WHILE":
                            no_other_use.clear()
                            continue
                        no_other_use.add(use)
                    else:

                        no_other_use.clear()

                for use in no_other_use:
                    changed = True
                    node = use.parent
                    self.to_remove.add(node)
                    self.usage_map[k].remove(use)

                    """
                    If right side has things like functions calls or ++ (usefull), we keep that part
                    """
                    if node.getChildAmount() >= 2:
                        right_side = node.getChild(1)
                        self.handle_usefull(node, right_side)
