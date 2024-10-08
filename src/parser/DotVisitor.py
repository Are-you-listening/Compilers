import subprocess
from src.parser.ASTVisitor import *
from src.parser.AST import ASTNodeTypes


class DotVisitor(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """

    def __init__(self, outfile="ASTvisual.dot"):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename + ".dot", "w")
        self.outfile.write("digraph AST {\n")

    def visitNode(self, node: ASTNode):
        text = node.text

        if isinstance(node, ASTNodeTypes):
            text += str(node.symbol_type.getPtrTuple())

        self.outfile.write(f'  "{id(node)}" [label="{text}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        label = str(node.text)
        label = label.replace('\\', '\\\\')
        label = label.replace('"', '\\\"')

        if node.text == "'\x00'" or node.text == "'\00'":
            label = "'\\\\00'"
        label = label.replace("\00", "\\\\00")
        self.outfile.write(f'  "{id(node)}" [label="{label}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename + ".dot" + " -o " + self.filename + ".png"
        subprocess.run(dot_command, shell=True)
