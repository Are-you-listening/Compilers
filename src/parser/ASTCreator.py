from src.antlr_files.expressionVisitor import *
from src.antlr_files.expressionParser import *
from src.parser.AST import *


class ASTCreator(expressionVisitor):
    """
    This class converts the Parse tree created from antlr4 file into our explicit defined AST
    """
    def __init__(self):
        """
        Default initialization of the data members
        self.parent: will store the parent ASTNode of the Node we create in the visit function
        self.AST: will create an AST tree containing a ptr to the parent
        """
        self.parent = None
        self.AST = None

    def visit(self, tree):
        """
        Default visit function that visits an given tree doing a pre-order traversal
        :param tree: tree we want to traverse threw
        """

        """
        Clear the previously assigned parent and AST to prevent issues when used multiple times
        """
        self.parent = None
        self.AST = None

        """
        call the visit of the base class
        """
        super(ASTCreator, self).visit(tree)

        """
        make a new AST
        """
        self.AST = AST(self.parent)

    def visitStart_(self, ctx: expressionParser.Start_Context):
        self.parent = ASTNode("Start", None)
        self.visitChildren(ctx)

    def visitExpr(self, ctx: expressionParser.ExprContext):
        self.__makeNode(ctx, "Expr")

    def visitLiteral(self, ctx):
        self.__makeNode(ctx, "Literal")

    def visitTerminal(self, ctx):
        print("ter", ctx.getText())
        node = ASTNodeTerminal(ctx.getText(), self.parent, ctx.getSymbol().type)
        self.parent.addChildren(node)

    def __makeNode(self, ctx, terminal_type: str):
        """
        Function to create our own ASTNode based on the given parse tree Node
        :param ctx: context
        :param terminal_type: the type we want to store into this node
        """

        """
        makes new Object and makes sure this will be a child of it's parent
        """
        node = ASTNode(terminal_type, self.parent)
        self.parent.addChildren(node)
        old_parent = self.parent
        self.parent = node

        """
        Recursively check it's children
        """
        self.visitChildren(ctx)

        self.parent = old_parent

    def getAST(self):
        """
        getter for AST
        :return: self.AST
        """
        return self.AST
