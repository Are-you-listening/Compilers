from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class ASTCleaner(ASTVisitor):
    def __init__(self):
        self.operation_handler = COperationHandler()
        # list of child parent of nodes we need to remove, can't be done directly because of loops
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        self.postorder(ast.root)

        for c, p in self.to_remove:
            p.removeChild(c)

    def visitNode(self, node: ASTNode):
        self.cleanUseless(node)
        self.cleanComments(node)
        self.cleanLine(node)
        self.cleanPrintf(node)
        self.cleanOvershootConst(node)
        self.cleanDereferenceAssignments(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.cleanEqualSign(node)
        self.cleanEOF(node)

    def cleanOvershootConst(self, node: ASTNode):
        """
        Identifies if there are too many cost nodes and add the overshoot to the to_remove list
        :param node: Node to check
        :return:
        """
        if node.text != "Type":  # This problem is only apparent by Type nodes
            return

        constNodes = []

        for child in node.children:
            if child.text == "const":
                constNodes.append((child, node))

            """
            else ptr cannot be const when value itself is cont
            """
            if "*" in child.text:
                for c in constNodes[1:]:
                    self.to_remove.add(c)
                constNodes = []

        if len(constNodes) > 1:
            for c in constNodes[1:]:
                self.to_remove.add(c)

    @staticmethod
    def cleanUseless(node: ASTNode):
        """
        Cleanup the tree by removing nodes(Expr and Literal) that have single child
        """
        if node is None:
            return

        parent = node.parent
        if parent is None:
            return

        if node.getChildAmount() == 1 and (node.text in ("Literal", "Expr")):
            index = parent.findChild(node)
            parent.setChild(index, node.getChild(0))  # Overwrite index of parent with node

    def cleanEqualSign(self, node: ASTNodeTerminal):
        """
        By a declaration or an assignment the '=' is not needed anymore.
        """
        if node.text == "=":
            self.to_remove.add((node, node.parent))

    @staticmethod
    def cleanComments(node: ASTNode):
        """
        Make sure we put every part of a comment inside the same node
        :param node: AST node that we will check if it is a comment and if so, merge
        :return: Nothing
        """
        if node.text != "Comment":
            return

        resulting_comment = ""
        for child in node.children:
            resulting_comment += child.text
        if resulting_comment[:2] == "//":
            resulting_comment = resulting_comment[2:]
        else:
            resulting_comment = resulting_comment[2:len(resulting_comment) - 2]
        node.clearChildren()
        comment_node = ASTNodeTerminal(resulting_comment, node, node.getSymbolTable(), "COMMENT", node.linenr)
        node.addChildren(comment_node)

    @staticmethod
    def cleanEOF(node: ASTNode):
        """
        <EOF> is useless
        """
        if node.text != "<EOF>":
            return

        node.parent.removeChild(node)

    @staticmethod
    def cleanLine(node: ASTNode):
        """
        The node 'Line' is useless
        """
        if node.text != "Line":
            return

        line_index = node.parent.findChild(node)

        node.parent.removeChild(node)

        for child in node.children:
            node.parent.insertChild(line_index, child)

    def cleanPrintf(self, node: ASTNode):
        """
        Make the printf child nodes cleaner
        """
        if node.text != "printf":
            return

        format_child_text = ""

        """
        support printf format stuff %d;lol with ';lol' as operator
        """
        for i, child in enumerate(node.children[:-1]):
            self.to_remove.add((child, node))
            format_child_text += child.text

        format_child_text = format_child_text[len("printf") + 1:-2]

        format_node = ASTNodeTerminal(format_child_text, node, node.getSymbolTable(), -1, node.linenr)
        node.insertChild(0, format_node)

    def cleanDereferenceAssignments(self, node: ASTNode):
        """
        Have some '*' on the left side on an assignment/declaration
        causes the AST format to be less pleasing for the future visitors.

        When we have a situation like 'Assignment' -> ['*', 'a']
        We will convert it to 'Assignment' -> [Expr -> ['*', 'a']] and so for each * on the left side

        :param node:
        :return:
        """

        if node.text not in ("Assignment", "Declaration"):
            return

        dereference_counter = []
        identifier_node = None

        for child in node.children:
            """
            count the amount of dereferences
            """
            if child.text == "*":
                dereference_counter.append(child.linenr)
                self.to_remove.add((child, child.parent))

            """
            stores variable we want to assign to
            """
            if isinstance(child, ASTNodeTerminal) and child.type == "IDENTIFIER" and identifier_node is None:
                identifier_node = child

        for i, ln in enumerate(dereference_counter):
            id_parent = identifier_node.parent
            parent_expr = ASTNode("Expr", id_parent, id_parent.getSymbolTable(), id_parent.linenr)
            parent_expr.addChildren(ASTNodeTerminal("*", parent_expr, parent_expr.getSymbolTable(), ln, ""))

            identifier_node.addNodeParent(parent_expr)
