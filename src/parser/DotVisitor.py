from src.parser.ASTVisitor import *
from src.parser.Tables.SymbolTable import *
import subprocess

class DotVisitor(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """
    def __init__(self,outfile="ASTvisual.dot"):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename+".dot", "w")
        self.outfile.write("digraph AST {\n")

    def visitNode(self, node: ASTNode):
        self.outfile.write(f'  "{id(node)}" [label="{node.text}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        label = node.text
        if node.text == "'\x00'":
            label = '\\000'

        self.outfile.write(f'  "{id(node)}" [label="{label}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)

class TableDotVisitor():
    def __init__(self,file,table):
        self.filename = file
        self.outfile = open(file+".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.id = 0
        table.traverse(self.Dot(table), False)

    def Dot(self,table):
        label = ""

        for entry in table.symbols:
            label += entry+'\n'

        #label = node.text
        #if node.text == "'\x00'":
        #    label = '\\000'

        self.outfile.write(f'  "{self.id}" [label="{label}"];\n')
        self.id += 1

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)

