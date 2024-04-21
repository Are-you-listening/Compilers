import subprocess
from src.parser.ASTVisitor import *


class DotVisitor(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self, outfile="ASTvisual.dot"):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename + ".dot", "w")
        self.outfile.write("digraph AST {\n")

    def visitNode(self, node: ASTNode):
        self.outfile.write(f'  "{id(node)}" [label="{node.text}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        label = str(node.text)

        label = label.replace('\\', '\\\\')
        label = label.replace('"', '\\\"')

        if node.text == "'\x00'":
            label = '\\000'

        self.outfile.write(f'  "{id(node)}" [label="{label}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename + ".dot" + " -o " + self.filename + ".png"
        subprocess.run(dot_command, shell=True)
