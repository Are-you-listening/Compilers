from src.parser.ASTVisitor import *

class DotVisitor(ASTVisitor):
    def __init__(self):
        self.outfile = open("ASTvisual.dot", "w")
        self.outfile.write("digraph AST {\n")

    def visitNode(self, node: ASTNode):
        self.outfile.write(f'  "{id(node)}" [label="{node.text}"];\n')
        for child in node.children:
            self.outfile.write(f'  "{id(child)}" [label="{child.text}"];\n')
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')
            child.accept(self)
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dotCommand = "dot -Tpng ASTvisual.dot -o ASTvisual.png"
        subprocess.run(dotCommand, shell=True)