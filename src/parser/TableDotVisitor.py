from src.parser.ASTVisitor import *
from src.parser.Tables.SymbolTable import *
import subprocess


class TableDotVisitor:
    """
    Visitor to visualize the AST tree using dot
    """
    def __init__(self, outfile="ASTvisual", absolute: bool = False):
        self.filename = outfile
        self.outfile = open(self.filename+".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.absolute = absolute

    def visitSym(self, node: SymbolTable):
        self.outfile.write(f'  "{id(node)}" [label="{self.getOutStr(node)}"];\n')
        for child in node.next:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)

    def getOutStr(self, node, debug=False):
        """
        method to make a string representing the symbol table
        :param node:
        :return:
        """
        out = []

        for k, e in node.symbols.items():
            if debug:
                out.append(f"{k}: {str(e)}")
            else:
                dtype, ptr = e.getPtrTuple()
                if e.const:
                    dtype = "const "+dtype

                out.append(f"{k}: {dtype}{ptr}")

        return "\n".join(out)

    def visit(self, symt: SymbolTable):
        self.preorder(symt)

    def preorder(self, root: SymbolTable):
        root.accept(self)
        for child in root.next:
            self.preorder(child)
