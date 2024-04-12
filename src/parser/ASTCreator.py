from src.antlr_files.grammarCVisitor import *
from src.antlr_files.grammarCParser import *
from src.parser.Tables.SymbolTable import *
from src.parser.Tables.TypedefTable import *


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
        self.parent = ASTNode("Start", None, self.table, ctx.start.line, ctx.start.line)
        self.visitChildren(ctx)

    def visitFunction(self, ctx: grammarCParser.FunctionContext):
        node = self.__makeNode(ctx, "Function", False)
        tempTable = SymbolTable(self.table)  # Create a new symbolTable / Scope after this node
        prevTable = self.table
        self.table.nextTable(tempTable)
        self.table = tempTable
        old_parent = self.parent
        self.parent = node
        self.visitChildren(ctx)
        self.parent = old_parent
        self.table = prevTable


    def visitCode(self, ctx: grammarCParser.CodeContext):
        tempTable = SymbolTable(self.table)  # Create a new symbolTable / Scope after this node
        prevTable = self.table
        self.table.nextTable(tempTable)
        self.table = tempTable

        self.__makeNode(ctx, "Code")
        self.table = prevTable

    def visitTypedef(self, ctx: grammarCParser.TypedefContext):
        self.__makeNode(ctx, "Typedef")

    def visitPrintscanf(self, ctx: grammarCParser.PrintscanfContext):
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
        node = ASTNode("Return", self.parent, self.table, ctx.start.line, ctx.start.line)  # Also attaches the current table/scope
        self.parent.addChildren(node)
        self.parent = node

    def visitBlock_code(self, ctx: grammarCParser.Block_codeContext):
        tempTable = SymbolTable(self.table)  # Create a new symbolTable / Scope after this node
        prevTable = self.table
        self.table.nextTable(tempTable)
        self.table = tempTable

        self.__makeNode(ctx, "Code")
        self.table = prevTable

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

    def visitCase(self, ctx:grammarCParser.CaseContext):
        self.__makeNode(ctx, "CASE")

    def visitDefault(self, ctx:grammarCParser.DefaultContext):
        self.__makeNode(ctx, "DEFAULT")

    def visitParameter(self, ctx:grammarCParser.ParameterContext):
        self.__makeNode(ctx, "Parameter")

    def visitParameters(self, ctx: grammarCParser.ParametersContext):
        self.__makeNode(ctx, "Parameters")

    def visitEnum(self, ctx: grammarCParser.EnumContext):  # We will handle Enums similar to typedefs
        """
        Translate enums to typedefs and declarations in our format
        :param ctx:
        :return:
        """
        line = ctx.start.line  # Line nr
        index = 0  # Value for each enum
        parent = self.parent

        self.__make_manual_typedef(line, ["INT"], "enum "+str(ctx.children[1]))  # Make a typedef for this enum type

        # Add all other enums 'identifiers/variables' as "const int" variables to the current scope
        for i in range(3, len(ctx.children)-1):
            name = ctx.children[i].symbol.text
            if name != ",":  # For each enum, recreate the Declaration structure so the rest of the program will take care of it!
                self.__make_manual_declaration(parent, line, name, ["const", "INT"], index)
                index += 1  # Incr value for enum

    def visitDefine(self, ctx: grammarCParser.DefineContext):
        line = ctx.start.line
        toReplaceWith = ctx.children[len(ctx.children) - 1]  # Part of the #define we will replace with

        if isinstance(toReplaceWith, grammarCParser.LiteralContext):  # It's an actual value; convert to const <type> value
            self.__make_manual_declaration(self.parent, line, ctx.children[1].symbol.text, [str(self.translateLexerID(toReplaceWith.start.type))], toReplaceWith.children[0].symbol.text)
        elif isinstance(toReplaceWith, grammarCParser.TypeContext):  # It's a type define; convert to typedef
            baseTypes = []
            for child in toReplaceWith.children:
                text = child.symbol.text
                if text != "const":
                    text = text.upper()
                baseTypes.append(text)
            self.__make_manual_typedef(line, baseTypes, ctx.children[1].symbol.text)

    def visitTerminal(self, ctx):
        """
        :param ctx:
        :return:
        """
        text = ctx.getText()

        if text in ["int", "float", "char", "void"]:
            text = text.upper()

        node = ASTNodeTerminal(text, self.parent, self.table, self.translateLexerID(ctx.getSymbol().type),
                               ctx.getSymbol().line, "")

        self.parent.addChildren(node)

    def __make_manual_declaration(self, parent: ASTNode, line: str, name: str, types: list, value):
        """
        Helper function to create some (const) declarations manually without a real ctx for AST manipulation
        :param parent: To this node, any new nodes will be added as children
        :param line: Line nr
        :param name: Name of the variable
        :param types: Type of the variable
        :param value: Value of the variable
        :return:
        """
        declaration = ASTNode("Declaration", parent, self.table, line, None)  # Add declaration node
        parent.addChildren(declaration)

        typeNode = ASTNode("Type", declaration, self.table, line, None)  # Add type nodes
        declaration.addChildren(typeNode)
        for type in types:
            typePartNode = ASTNodeTerminal(type, typeNode, self.table, -1, line, None)  # Add the actual types
            typeNode.addChildren(typePartNode)

        var = ASTNodeTerminal(name, declaration, self.table, "IDENTIFIER", line, None)  # Add enum variable
        declaration.addChildren(var)
        equalSign = ASTNodeTerminal("=", declaration, self.table, -1, line, None)  # Add '='
        declaration.addChildren(equalSign)
        expr = ASTNode("Expr", declaration, self.table, line, None)  # Add value nodes
        declaration.addChildren(expr)
        literal = ASTNode("Literal", expr, self.table, line, None)
        expr.addChildren(literal)

        terminalType = ""
        if "FLOAT" in types:
            terminalType = "FLOAT"
        elif "INT" in types:
            terminalType = "INT"
        elif "STRING" in types:
            terminalType = "STRING"
        elif "CHAR" in types:
            terminalType = "CHAR"

        valueNode = ASTNodeTerminal(str(value), literal, self.table, terminalType, line, None)
        literal.addChildren(valueNode)

    def __make_manual_typedef(self, line: str, baseTypes: list, replaceType: str):
        """
        Create a manual typedef without relying on ctx for AST manipulation
        :return:
        """
        parent = ASTNode("Typedef", self.parent, self.table, line, None)
        self.parent.addChildren(parent)

        node_typedef = ASTNodeTerminal("typedef", parent, self.table, -1, line, None)
        parent.addChildren(node_typedef)

        node_Type = ASTNode("Type", parent, self.table, line, None)  # Add the type translations
        parent.addChildren(node_Type)
        for type in baseTypes:  # Add base types
            node_baseType = ASTNodeTerminal(type, node_Type, self.table, -1, line, None)
            node_Type.addChildren(node_baseType)

        node_typedef_part2 = ASTNodeTerminal(replaceType, parent, self.table, "IDENTIFIER", line, None)  # Add second part of typedef
        parent.addChildren(node_typedef_part2)

    def __makeNode(self, ctx, terminal_type: str, dovisitChildren: bool = True):
        """
        Function to create our own ASTNode based on the given parse tree Node
        :param ctx: context
        :param terminal_type: the type we want to store into this node
        """

        """
        makes new Object and makes sure this will be a child of it's parent
        """
        node = ASTNode(terminal_type, self.parent, self.table, ctx.start.line, None)  # Also attaches the current table/scope
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
