from src.antlr_files.expressionVisitor import *
from src.antlr_files.expressionParser import *
from src.parser.AST import *
from src.parser.SymbolTable import *

black_list = ['(', ')', ';', '{', '}']


class ASTCreator(expressionVisitor):
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
        self.table = None

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

    def visitStart_(self, ctx: expressionParser.Start_Context):
        self.parent = ASTNode("Start", None, self.table)
        self.visitChildren(ctx)

    def visitFunction(self, ctx: expressionParser.FunctionContext):
        self.__makeNode(ctx, "Function")
        tempTable = SymbolTable(self.table)  # Create a new symbolTable / Scope after this node
        self.table.nextTable(tempTable)
        self.table = tempTable

    def visitLines(self, ctx: expressionParser.LinesContext):
        self.__makeNode(ctx, "Lines")

    def visitLine(self, ctx: expressionParser.LineContext):
        self.__makeNode(ctx, "Line")

    def visitType(self, ctx: expressionParser.TypeContext):
        self.__makeNode(ctx, "Type")

    def visitDeclaration(self, ctx: expressionParser.DeclarationContext):
        self.__makeNode(ctx, "Declaration")

    def visitAssignment(self, ctx: expressionParser.AssignmentContext):
        self.__makeNode(ctx, "Assignment")

    def visitExpr(self, ctx: expressionParser.ExprContext):
        self.__makeNode(ctx, "Expr")

    def visitLiteral(self, ctx):
        self.__makeNode(ctx, "Literal")

    def visitConversion(self, ctx: expressionParser.ConversionContext):
        self.__makeNode(ctx, "Conversion")

    def visitTerminal(self, ctx):
        """
        :param ctx:
        :return:
        """

        if ctx.getText() in black_list:
            return

        node = ASTNodeTerminal(ctx.getText(), self.parent, self.table, self.translateLexerID(ctx.getSymbol().type,ctx.getText()))
        node.linenr = ctx.getSymbol().line
        self.__updateSymbolTable(ctx, node)
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
        node = ASTNode(terminal_type, self.parent, self.table)  # Also attaches the current table/scope
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

    def __updateSymbolTable(self, ctx, node):
        """
        self.parent.getChild #traverse through children and get type if exist + get const
        """

        child = self.parent.findType("Type")
        is_const = False
        datatype = ""

        if self.lexer.IDENTIFIER == ctx.getSymbol().type:
            if self.parent.text == "Declaration" or self.parent.text == "Function":
                for grandchild in child.children:
                    if grandchild.text == "const":
                        is_const = True
                    else:
                        datatype += grandchild.text
                # the value in the symbol table is initially empty
                symbol_entry = SymbolEntry(self.parent.text, datatype, ctx.getText(), is_const, None, node, None)
                self.table.add(symbol_entry)

    def translateLexerID(self, id,text=None):
        if id == self.lexer.CHAR:
            return "CHAR"
        elif id == self.lexer.FLOAT:
            return "FLOAT"
        elif id == self.lexer.IDENTIFIER:
            return "IDENTIFIER"
        elif id == self.lexer.INT:
            return "INT"
        else:
            if text!=None:
                if text=="int":
                    return "INT"
                if text == "char":
                    return "CHAR"
                elif text == "float":
                    return "FLOAT"
            print("DEVELOPER WARNING in translateLexerID(), unknown id or text, cannot retrieve typename: returning original id: ", id)
            return id
