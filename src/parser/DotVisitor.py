from src.parser.ASTVisitor import *
import subprocess


class DotVisitor(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """
    def __init__(self):
        self.outfile = open("ASTvisual.dot", "w")
        self.outfile.write("digraph AST {\n")

    def visitNode(self, node: ASTNode):
        self.outfile.write(f'  "{id(node)}" [label="{node.text}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        self.outfile.write(f'  "{id(node)}" [label="{node.text}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng ASTvisual.dot -o ASTvisual.png"
        subprocess.run(dot_command, shell=True)
