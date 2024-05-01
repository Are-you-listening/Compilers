from src.llvm_target.ControlFlow.ControlFlowGraph import *
import subprocess


class ControlFlowDotVisitor:
    def __init__(self, function_name, outfile="ControlFlow", ):
        self.filename = outfile.split('.')[0]
        self.filename = self.filename + "_" + function_name
        self.outfile = open(self.filename + ".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.edge_blacklist = []

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
        if vertex.llvm is None:
            label = f"not yet labeled {vertex.abnormally_ended}"

        else:
            label = str(vertex.llvm.block)

            label = label.replace('\\', '\\\\')
            label = label.replace('"', '\\\"')

            label = label.replace("\00", "\\\\00")

            label = label.replace('\\', '\\\\')
            label = label.replace('"', '\\\"')

            if label == "'\x00'" or label == "'\00'":
                label = "'\\\\00'"
            label = label.replace("\00", "\\\\00")

        self.outfile.write(f'  "{id(vertex)}" [label="{label}"];\n')
        for edge in vertex.edges:
            self.outfile.write(f'  "{id(vertex)}" -> "{id(edge.to_vertex)}" [label="{edge.on}"];\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename + ".dot" + " -o " + self.filename + ".png"
        subprocess.run(dot_command, shell=True)
