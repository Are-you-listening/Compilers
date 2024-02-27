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
        self.stack = [[]]

    def __setup(self):
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
        self.parent = ASTNode("Start", None, self.__getSymbolTable())
        self.visitChildren(ctx)

    def visitFunction(self, ctx: expressionParser.FunctionContext):
        self.__makeNode(ctx, "Function")

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

    def visitTerminal(self, ctx):
        """
        check for open and closed {} to determine the scope data
        :param ctx:
        :return:
        """
        if ctx.getText() == '{':
            self.stack.append([])
        elif ctx.getText() == '}':
            self.stack.pop()

        if ctx.getText() in black_list:
            return

        self.__updateSymbolTable(ctx)

        node = ASTNodeTerminal(ctx.getText(), self.parent, self.__getSymbolTable(), ctx.getSymbol().type)
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
        node = ASTNode(terminal_type, self.parent, self.__getSymbolTable())
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

    def __getSymbolTable(self):
        symbol_table = SymbolTable([])

        for list in self.stack:
            for element in list:
                symbol_table.add(element)

        return symbol_table

    def __updateSymbolTable(self, ctx):
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
                symbol_entry = SymbolEntry(self.parent.text, datatype, ctx.getText(), is_const, None)
                self.stack[-1].append(symbol_entry)

    def __addSymbolTableValue(self, declaration_node: ASTNode):
        """
        self is of type 'Declaration' so check if there is a '=' among the children, if so add the RHS to the symbol table as value
        :return:
        """
        # because it is a declaration there will always at least be 2 children: the type and identifier name
        # the equal symbol and the value is optional
        # if the equal symbol is missing, we don't have a value to add so skip
        equal_node = declaration_node.findType("=")
        if equal_node is not None:
            ident = declaration_node.getChild(1)
            val = declaration_node.getChild(3)

            for entry in self.stack[-1]:
                if entry.name == ident.text:
                    entry.value = val.text
                    print(entry.value)