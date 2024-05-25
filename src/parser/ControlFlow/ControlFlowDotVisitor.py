import subprocess
from src.parser.ControlFlow.ControlFlowGraph import *


class ControlFlowDotVisitor:
    def __init__(self, function_name, outfile="ControlFlow", mips: bool = False):
        self.filename = outfile.split('.')[0]
        self.filename = self.filename + "_" + function_name
        if mips:
            self.filename = f"{self.filename}_mips"
        self.outfile = open(self.filename + ".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.edge_blacklist = []
        self.mips = mips



    def visit(self, root_vertex: Vertex):
        self.edge_blacklist = []
        self.preorder(root_vertex)

    def preorder(self, root_vertex: Vertex):
        """
        prevent inf loops when a circular control occurs
        :param root_vertex:
        :return:
        """
        if root_vertex in self.edge_blacklist:
            return

        self.edge_blacklist.append(root_vertex)
        root_vertex.accept(self)
        for edge in root_vertex.edges:
            self.preorder(edge.to_vertex)

    def visitVertex(self, vertex: Vertex):
        if self.mips:
            v = vertex.mips
            base_lambda = lambda x: x.toString()
        else:
            v = vertex.llvm
            base_lambda = lambda x: str(x.block)

        if v is None:
            label = f"not yet labeled {vertex.abnormally_ended}"

        else:
            label = base_lambda(v)
            label = label.replace('\\', '\\\\')
            label = label.replace('"', '\\\"')

            label = label.replace("\00", "\\\\00")

        self.outfile.write(f'  "{id(vertex)}" [label="{label}"];\n')
        for edge in vertex.edges:
            self.outfile.write(f'  "{id(vertex)}" -> "{id(edge.to_vertex)}" [label="{edge.on}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename + ".dot" + " -o " + self.filename + ".png"
        subprocess.run(["ulimit -s unlimited", dot_command], shell=True)
