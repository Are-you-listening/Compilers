### TODO Re-enable constrains
### TODO Make test files
### TODO Make a Test Case by comparing ast outputs
### TODO ASTCreator: Create typedef Nodes
### TODO ASTTypeDefReplacer

### Preorder

### Go through tree and replace each typenode with the symbol table translation
### After this is done, replace each type in the symbol table as well


from src.parser.ASTVisitor import *
from src.parser.Tables.SymbolTable import *

class ASTCleaner(ASTVisitor):
    def __init__(self):
        self.ast = None

    def visit(self, ast: AST):
        root = ast.root
        self.ast = ast
        self.preorder(root)

    def visitNode(self, node: ASTNode):
        if node.text == "Type":
            if node.getChildAmount() == 1:
                child = node.getChild(0)
            elif node.getChildAmount() == 2:
                child = node.getChild(1)

            if SymbolTable.isTypedef(child.text):
                identifier = node.getSiblingNeighbour(1)  # Retrieve the identifier from the declaration
                table = node.symbol_table
                translation = table.getEntry(identifier.text).getType()  # Get the type of the identifier;  this is the new type that needs to fit in the node
                child.text = translation  # Replace the type
