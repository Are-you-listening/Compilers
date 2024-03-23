from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir


class Vertex:
    def __init__(self, llvm_block):
        """
        :param llvm_block:
        """
        self.llvm = llvm_block

        """
        list of directed edges
        reverse is to know which vertex are pointing to self
        """
        self.edges = []
        self.reverse_edges = []

        """
        take literals directly into account
        """

    def addEdge(self, edge: "Edge"):
        self.edges.append(edge)
        edge.to_vertex.reverse_edges.append(edge)

    def accept(self, visitor):
        visitor.visitVertex(self)


class Edge:
    def __init__(self, from_vertex: Vertex, to_vertex: Vertex, on: bool):
        """
        constructor for a directed edge of the Control Flow graph
        :param from_vertex:
        :param to_vertex:
        :param on: We go to the 'to_vertex' only when we match the 'on' (register number, on_true/false)
        (if bool is none always branch to here)
        """
        self.from_vertex = from_vertex
        self.to_vertex = to_vertex
        self.on = on


class ControlFlowGraph:
    def __init__(self):
        self.current: Vertex = Vertex(LLVMSingleton.getInstance().getCurrentBlock())
        self.root: Vertex = self.current

        """
        To easily support Control flow construction for example for logical '&&','||',...
        We have an accept vertex and a reject vertex, these will come handy for making the proper 
        control flow
        """
        self.accepting: Vertex = None
        self.reject: Vertex = None
        self.const_value_map = {}

        """
        node stores AST Node indicating when a eval needs to end
        """
        self.eval_scope_node = None
    def isEval(self):
        """
        check if the control flow is currently creating a control flow
        :return:
        """
        return (self.accepting is not None) and (self.reject is not None)

    def startEval(self):
        self.current.llvm = LLVMSingleton.getInstance().getCurrentBlock()
        """
        start an eval situation providing the node that causes a splitup
        We will create a condition branch checking for true/false
        :param llvm_var:
        :return:
        """

        builder_true = LLVMSingleton.getInstance().addBlock()
        builder_false = LLVMSingleton.getInstance().addBlock()

        on_true_vertex = Vertex(builder_true)
        on_false_vertex = Vertex(builder_false)

        self.accepting = on_true_vertex
        self.reject = on_false_vertex

        """
        add edges for start construction
        """
        self.current.addEdge(Edge(self.current, on_true_vertex, True))
        self.current.addEdge(Edge(self.current, on_false_vertex, False))

    def endEval(self):
        for edge in self.reject.reverse_edges:
            """
            every edge to reject needs to be redirected to accepting
            """
            from_vertex = edge.from_vertex

            edge_index = from_vertex.edges.index(edge)
            from_vertex.edges[edge_index].to_vertex = self.accepting

            self.accepting.reverse_edges.extend(self.reject.reverse_edges)

        phi = self.__evalSetBranches()

        self.current = self.accepting
        LLVMSingleton.getInstance().setCurrentBlock(self.current.llvm)
        LLVMSingleton.getInstance().removeBlock(self.reject.llvm)
        self.accepting = None
        self.reject = None
        self.eval_scope_node = None

        return phi

    def addLogicalAnd(self):
        builder = LLVMSingleton.getInstance().addBlock()
        new_accepting = Vertex(builder)

        LLVMSingleton.getInstance().setCurrentBlock(self.accepting.llvm)

        self.accepting.addEdge(Edge(self.accepting, new_accepting, True))
        self.accepting.addEdge(Edge(self.accepting, self.reject, False))

        self.accepting = new_accepting

    def addLogicalOr(self):
        builder = LLVMSingleton.getInstance().addBlock()
        new_reject = Vertex(builder)

        LLVMSingleton.getInstance().setCurrentBlock(self.reject.llvm)

        self.reject.addEdge(Edge(self.reject, new_reject, False))
        self.reject.addEdge(Edge(self.reject, self.accepting, True))

        self.reject = new_reject

    def __evalSetBranches(self):

        to_check = {self.current}
        checked = set()
        final_vertex = None

        while len(to_check) != 0:
            current_vertex = to_check.pop()
            checked.add(current_vertex)

            if len(current_vertex.edges) != 2:
                final_vertex = current_vertex
                continue

            if current_vertex.edges[0].on:
                true_edge = current_vertex.edges[0]
                false_edge = current_vertex.edges[1]
            else:
                true_edge = current_vertex.edges[1]
                false_edge = current_vertex.edges[0]
            if true_edge.to_vertex == false_edge.to_vertex:
                """
                In this case both true and false go to this branch
                """

                """
                make branch statement a boolean
                """
                current_vertex.llvm.branch(true_edge.to_vertex.llvm.block)
            else:
                """
                when different endpoints for true and false
                """
                last_instruction = self.__makeBool(current_vertex.llvm)

                current_vertex.llvm.cbranch(last_instruction, true_edge.to_vertex.llvm.block,
                                            false_edge.to_vertex.llvm.block)

            if true_edge.to_vertex not in checked and true_edge.to_vertex not in to_check:
                to_check.add(true_edge.to_vertex)

            if false_edge.to_vertex not in checked and false_edge.to_vertex not in to_check:
                to_check.add(false_edge.to_vertex)

        return self.__evalFinalVertex(final_vertex)

    def __evalFinalVertex(self, final_vertex):
        """
        last node
        calculate the phi
        """
        current_vertex = final_vertex

        edge_true_list = set()
        edge_false_list = set()
        for edge in current_vertex.reverse_edges:
            if edge.on:
                edge_true_list.add(edge.from_vertex)
            else:
                edge_false_list.add(edge.from_vertex)

        """
        check the edge vertex lists
        if only in true -> phi will be true if coming from this branch
        if only in false -> phi will be false if coming from this branch
        if both -> phi will take the value at the end of this block
        """
        bool_type = ir.IntType(1)
        phi: ir.PhiInstr = current_vertex.llvm.phi(bool_type)

        for vertex in edge_true_list.union(edge_false_list):
            in_true = vertex in edge_true_list
            in_false = vertex in edge_false_list

            if in_true and in_false:
                if vertex.llvm in self.const_value_map:
                    const_val = self.const_value_map[vertex.llvm]

                    if const_val.constant == '0':
                        bool_val = 0
                    else:
                        bool_val = 1

                    phi.add_incoming(ir.Constant(bool_type, bool_val), vertex.llvm.block)
                else:
                    last_instruction = vertex.llvm.block.instructions[-2]
                    """
                    make bool if not a bool type
                    """
                    phi.add_incoming(last_instruction, vertex.llvm.block)

            elif in_true:
                phi.add_incoming(ir.Constant(bool_type, 1), vertex.llvm.block)
            elif in_false:
                phi.add_incoming(ir.Constant(bool_type, 0), vertex.llvm.block)

        return phi

    @staticmethod
    def __makeBool(builder):
        instruction = builder.block.instructions[-1]
        if instruction.type != ir.IntType(1):
            instruction = builder.icmp_signed("!=", instruction, ir.Constant(instruction.type, 0))

        return instruction
