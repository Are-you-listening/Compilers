from src.antlr_files.expressionVisitor import *
from src.antlr_files.expressionParser import *
from src.parser.AST import *
from src.parser.SymbolTable import *

black_list = ['(', ')', ';']


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
        self.stack = [[]]

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
        self.stack = [[]]

        """
        call the visit of the base class
        """
        super(ASTCreator, self).visit(tree)

        """
        make a new AST
        """
        self.AST = AST(self.parent)

    def visitStart_(self, ctx: expressionParser.Start_Context):
        self.parent = ASTNode("Start", None, self.getSymbolTable())
        self.visitChildren(ctx)

    def visitFunction(self, ctx:expressionParser.FunctionContext):
        self.__makeNode(ctx, "Function")

    def visitLines(self, ctx:expressionParser.LinesContext):
        self.__makeNode(ctx, "Lines")

    def visitLine(self, ctx:expressionParser.LineContext):
        self.__makeNode(ctx, "Line")

    def visitType(self, ctx:expressionParser.TypeContext):
        self.__makeNode(ctx, "Type")

    def visitDeclaration(self, ctx:expressionParser.DeclarationContext):
        self.__makeNode(ctx, "Declaration")

    def visitAssignment(self, ctx:expressionParser.AssignmentContext):
        self.__makeNode(ctx, "Assignment")

    def visitExpr(self, ctx: expressionParser.ExprContext):
        self.__makeNode(ctx, "Expr")

    def visitLiteral(self, ctx):
        self.__makeNode(ctx, "Literal")

    def visitTerminal(self, ctx):
        if ctx.getText() == '{':
            self.stack.append([])
        elif ctx.getText() == '}':
            self.stack.pop()

        if ctx.getText() in black_list:
            return

        #self.parent.getChild #traverse through children and get type if exist + get const
        symbol_entry = SymbolEntry(self.latest, "N", False)
        self.stack[-1].append(symbol_entry)

        node = ASTNodeTerminal(ctx.getText(), self.parent, self.getSymbolTable(), ctx.getSymbol().type)
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
        node = ASTNode(terminal_type, self.parent, self.getSymbolTable())
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

    def getSymbolTable(self):
        symbol_table = SymbolTable([])

        for list in self.stack:
            for element in list:
                symbol_table.add(element)


