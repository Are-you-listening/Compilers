from src.parser.ASTVisitor import *
from src.parser.Tables.SymbolTable import *
import subprocess


class TableDotVisitor(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """
    def __init__(self,outfile="ASTvisual.dot", absolute: bool = False):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename+".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.absolute = absolute

    def visitNode(self, node: ASTNode):

        self.outfile.write(f'  "{id(node)}" [label="{self.getOutStr(node)}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        out = ""
        for k, v in enumerate(node.getSymbolTable().symbols):
            out += f"{k}: {v}"

        self.outfile.write(f'  "{id(node)}" [label="{self.getOutStr(node)}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)

    def getOutStr(self, node):
        """
        method to make a string representing the symbol table
        :param node:
        :return:
        """
        out = []

        if self.absolute:
            st = node.getSymbolTable().prev
            while st is not None:
                for k, v in enumerate(st.symbols):
                    out.append(f"{k}: {v}")
                st = st.prev
            out.reverse()

        for k, v in enumerate(node.getSymbolTable().symbols):
            out.append(f"{k}: {v}")

        out_str = "\n".join(out)

        return out_str

