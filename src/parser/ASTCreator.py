from src.antlr_files.grammarCVisitor import *
from src.antlr_files.grammarCParser import *
from src.parser.Tables.SymbolTable import *
from src.parser.Tables.TypedefTable import *

black_list = ['(', ')', ';', '{', '}']


class ASTCreator(grammarCVisitor):
    """
    This class converts the Parse tree created from antlr4 file into our explicit defined AST
    """

    def __init__(self, lexer):
        """
        Default initialization of the data members
        self.parent: will store the parent ASTNode of the Node we create in the visit function
        self.AST: will create an AST tree containing a ptr to the parent
        """
        self.lexer = lexer
        self.parent = None
        self.AST = None
        self.table = SymbolTable(None)

    def __setup(self):
        self.parent = None
        self.AST = None
        self.table = SymbolTable(None)

    def visit(self, tree):
        """
        Default visit function that visits a given tree doing a pre-order traversal
        :param tree: tree we want to traverse threw
        """

        """
        Clear the previously assigned parent and AST to prevent issues when used multiple times
        """
        self.__setup()

        """
        call the visit of the base class
        """
        super(ASTCreator, self).visit(tree)

        """
        make a new AST
        """
        self.AST = AST(self.parent)

    def visitStart_(self, ctx: grammarCParser.Start_Context):
        self.parent = ASTNode("Start", None, self.table, ctx.start.line)
        self.visitChildren(ctx)

    def visitFunction(self, ctx: grammarCParser.FunctionContext):
        tempTable = SymbolTable(self.table)  # Create a new symbolTable / Scope after this node
        self.table.nextTable(tempTable)
        self.table = tempTable

        self.__makeNode(ctx, "Function")

    def visitCode(self, ctx: grammarCParser.CodeContext):
        self.__makeNode(ctx, "Code")

    def visitTypedef(self, ctx: grammarCParser.TypedefContext):
        self.__makeNode(ctx, "Typedef")

    def visitPrintf(self, ctx: grammarCParser.PrintfContext):
        self.__makeNode(ctx, "printf")

    def visitLine(self, ctx: grammarCParser.LineContext):
        self.__makeNode(ctx, "Line")

    def visitType(self, ctx: grammarCParser.TypeContext):
        self.__makeNode(ctx, "Type")

    def visitDeclaration(self, ctx: grammarCParser.DeclarationContext):
        self.__makeNode(ctx, "Declaration")

    def visitAssignment(self, ctx: grammarCParser.AssignmentContext):
        self.__makeNode(ctx, "Assignment")

    def visitExpr(self, ctx: grammarCParser.ExprContext):
        self.__makeNode(ctx, "Expr")

    def visitLiteral(self, ctx):
        self.__makeNode(ctx, "Literal")

    def visitConversion(self, ctx: grammarCParser.ConversionContext):
        self.__makeNode(ctx, "Conversion")

    def visitComment(self, ctx: grammarCParser.CommentContext):
        self.__makeNode(ctx, "Comment")

    def visitReturn(self, ctx: grammarCParser.ReturnContext):
        node = ASTNode("Return", self.parent, self.table, ctx.start.line)  # Also attaches the current table/scope
        self.parent.addChildren(node)
        self.parent = node

    def visitBlock_code(self, ctx: grammarCParser.Block_codeContext):
        self.__makeNode(ctx, "Code")

    def visitBlock_line(self, ctx: grammarCParser.Block_lineContext):
        self.__makeNode(ctx, "Line")

    def visitIf_statement(self, ctx: grammarCParser.If_statementContext):
        self.__makeNode(ctx, "IF")

    def visitTerminal(self, ctx):
        """
        :param ctx:
        :return:
        """
        if ctx.getText() in black_list:
            return

        text = ctx.getText()

        if text in ["int", "float", "char"]:
            text = text.upper()

        node = ASTNodeTerminal(text, self.parent, self.table, self.translateLexerID(ctx.getSymbol().type),
                               ctx.getSymbol().line)

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
        node = ASTNode(terminal_type, self.parent, self.table, ctx.start.line)  # Also attaches the current table/scope
        node.linenr = ctx.start.line
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

    def translateLexerID(self, l_id):
        return self.lexer.ruleNames[l_id - 1]
