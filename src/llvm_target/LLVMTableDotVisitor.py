from src.llvm_target.LLVMVisitor import *
from src.parser.Tables.SymbolTable import *
import subprocess


class LLVMTableDotVisitor(LLVMVisitor):
    """
    Visitor to visualize the AST tree using dot
    """
    def __init__(self, outfile="LLVMTable.dot", absolute: bool = False):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename+".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.absolute = absolute

    def visitNode(self, node: LLVMNode):
        self.outfile.write(f'  "{id(node)}" [label="{node.getMapTable().getOutStr(self.absolute)}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)
