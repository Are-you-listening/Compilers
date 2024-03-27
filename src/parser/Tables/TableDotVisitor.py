from src.parser.Tables.SymbolTable import *
import subprocess


class TableDotVisitor:
    """
    Visitor to visualize the Symbol Table using dot
    """
    def __init__(self, outfile="SymbolTable.dot", debug: bool = False):
        self.filename = outfile.split('.')[0]
        self.outfile = open(self.filename+".dot", "w")
        self.outfile.write("digraph AST {\n")
        self.debug = debug

    def visitSym(self, node: SymbolTable):
        self.outfile.write(f'  "{id(node)}" [label="{self.getOutStr(node,self.debug)+self.getOutStrTypedefs(node, self.debug)}"];\n')
        for child in node.next:
            self.outfile.write(f'  "{id(node)}" -> "{id(child)}";\n')

    def __del__(self):
        self.outfile.write("}\n")
        self.outfile.close()
        dot_command = "dot -Tpng " + self.filename+".dot" + " -o "+self.filename+".png"
        subprocess.run(dot_command, shell=True)

    @staticmethod
    def getOutStrTypedefs(node, debug):
        if not debug:
            return

        out = []

        for defi in node.typedefs:
            typenode = defi.children[1]
            temp = ""
            for kid in typenode.children:
                temp += " " + kid.text
            if temp != "":
                temp = "\n typedef" + temp + " " + defi.children[2].text

            out.append(temp)

        return "\n".join(out)


    @staticmethod
    def getOutStr(node, debug=False):
        """
        method to make a string representing the symbol table
        :param node:
        :param debug:
        :return:
        """
        out = []

        for k, e in node.symbols.items():
            # if debug:
            #     continue
            #     out.append(f"{k}: {str(e)}")
            # else:
            dtype, ptr = e.getPtrTuple()
            if e.isConst():
                dtype = "const "+dtype

            out.append(f"{k}: {dtype}{ptr}")

        return "\n".join(out)

    def visit(self, symt: SymbolTable, debug=False):
        self.debug = debug
        self.preorder(symt)

    def preorder(self, root: SymbolTable):
        root.accept(self)
        for child in root.next:
            self.preorder(child)
