from src.parser.Tables.SymbolTable import *
import subprocess


class TableDotVisitor:
    """
    Visitor to visualize the Symbol Table using dot
    """
    def __init__(self, outfile="SymbolTable.dot", debug: bool = False):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename+".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.debug = debug

    def visitSym(self, node: SymbolTable):
        self.outfile.write(f'  "{id(node)}" [label="{self.getOutStr(node,self.debug)}"];\n')
        for child in node.next:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)


    @staticmethod
    def getOutStr(node, debug=False):
        """
        method to make a string representing the symbol table
        :param node:
        :param debug:
        :return:
        """
        out = []

        for k, e in node.symbols.items():
            """
            When debug mode represent the entire symbol entry table structure
            """
            if debug:
                out.append(f"{k}: {str(e)}")

            else:
                out.append(f"{k}: {e.getTypeObject().getStringType()}")

        return "\n".join(out)

    def visit(self, symt: SymbolTable, debug=False):
        self.debug = debug
        self.preorder(symt)

    def preorder(self, root: SymbolTable):
        root.accept(self)
        for child in root.next:
            self.preorder(child)
