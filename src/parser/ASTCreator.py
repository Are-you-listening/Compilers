from src.antlr_files.grammarCVisitor import *
from src.antlr_files.grammarCParser import *
from src.parser.AST import *


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

    def __setup(self):
        self.parent = None
        self.AST = None

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
        self.parent = ASTNode("Start", None, None, Position(ctx.start.source[1].fileName, ctx.start.line, ctx.start.line), None)
        self.visitChildren(ctx)

    def visitFunction(self, ctx: grammarCParser.FunctionContext):
        self.__makeNode(ctx, "Function")

    def visitCode(self, ctx: grammarCParser.CodeContext):
        self.__makeNode(ctx, "Code")

    def visitTypedef(self, ctx: grammarCParser.TypedefContext):
        self.__makeNode(ctx, "Typedef")

    def visitParameter_calls(self, ctx: grammarCParser.Parameter_callsContext):
        self.__makeNode(ctx, "ParameterCalls")

    def visitParameter_call(self, ctx: grammarCParser.Parameter_callContext):
        self.__makeNode(ctx, "ParameterCall")

    def visitPrintscanf(self, ctx: grammarCParser.PrintscanfContext):
        if ctx.children[0].symbol.text == "scanf":
            self.__makeNode(ctx, "scanf")
        else:
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

#    def visitComment(self, ctx: grammarCParser.CommentContext):
#        self.__makeNode(ctx, "Comment")

    def visitReturn(self, ctx: grammarCParser.ReturnContext):
        self.__makeNode(ctx, "Return")

    def visitBlock_code(self, ctx: grammarCParser.Block_codeContext):
        self.__makeNode(ctx, "Code")

    def visitBlock_line(self, ctx: grammarCParser.Block_lineContext):
        self.__makeNode(ctx, "Line")

    def visitIf(self, ctx: grammarCParser.IfContext):
        self.__makeNode(ctx, "IF")

    def visitFor(self, ctx: grammarCParser.ForContext):
        self.__makeNode(ctx, "FOR")

    def visitWhile(self, ctx: grammarCParser.WhileContext):
        self.__makeNode(ctx, "WHILE")

    def visitSwitch(self, ctx: grammarCParser.SwitchContext):
        self.__makeNode(ctx, "SWITCH")

    def visitCase(self, ctx: grammarCParser.CaseContext):
        self.__makeNode(ctx, "CASE")

    def visitDefault(self, ctx: grammarCParser.DefaultContext):
        self.__makeNode(ctx, "DEFAULT")

    def visitParameter(self, ctx: grammarCParser.ParameterContext):
        self.__makeNode(ctx, "Parameter")

    def visitParameters(self, ctx: grammarCParser.ParametersContext):
        self.__makeNode(ctx, "Parameters")

    def visitEnum(self, ctx: grammarCParser.EnumContext):
        self.__makeNode(ctx, "Enum")

    def visitInitialize_list(self, ctx: grammarCParser.Initialize_listContext):
        self.__makeNode(ctx, "InitList")

    def visitArray(self, ctx: grammarCParser.ArrayContext):
        self.__makeNode(ctx, "ARRAY")

    def visitStructunion(self, ctx: grammarCParser.StructunionContext):
        if ctx.children[0].symbol.text == "struct":
            self.__makeNode(ctx, "Struct")
        else:
            self.__makeNode(ctx, "Union")

    def visitFunctionPtrDeclaration(self, ctx: grammarCParser.FunctionPtrDeclarationContext):
        self.__makeNode(ctx, "FunctionPtrDeclaration")

    def visitFunction_ptr_2(self, ctx: grammarCParser.Function_ptr_2Context):
        self.__makeNode(ctx, "FunctionPtr")

    def visitFunction_ptr_params(self, ctx: grammarCParser.Function_ptr_paramsContext):
        self.__makeNode(ctx, "FunctionPtrParam")

    def visitTerminal(self, ctx):
        """
        :param ctx:
        :return:
        """
        text = ctx.getText()

        if text in ["int", "float", "char", "void"]:
            text = text.upper()

        node = ASTNodeTerminal(text, self.parent, None, self.translateLexerID(ctx.getSymbol().type),
                               Position(ctx.symbol.source[1].fileName, ctx.getSymbol().line, None), None)

        self.parent.addChildren(node)

    def visitSizeOf(self, ctx:grammarCParser.SizeOfContext):
        self.__makeNode(ctx, "SizeOf")

    def visitArrayIndex(self, ctx:grammarCParser.ArrayIndexContext):
        self.__makeNode(ctx, "ArrayIndex")

    def __makeNode(self, ctx, terminal_type: str, dovisitChildren: bool = True):
        """
        Function to create our own ASTNode based on the given parse tree Node
        :param ctx: context
        :param terminal_type: the type we want to store into this node
        """

        """
        makes new Object and makes sure this will be a child of it's parent
        """
        node = ASTNode(terminal_type, self.parent, None, Position(ctx.start.source[1].fileName, ctx.start.line, None), None)  # Also attaches the current table/scope
        self.parent.addChildren(node)
        old_parent = self.parent
        self.parent = node

        """
        Recursively check it's children
        """
        if dovisitChildren:
            self.visitChildren(ctx)

        self.parent = old_parent

        return node

    def getAST(self):
        """
        getter for AST
        :return: self.AST
        """
        return self.AST

    def translateLexerID(self, l_id):
        return self.lexer.ruleNames[l_id - 1]
