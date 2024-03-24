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
        self.flip_eval = False

    def switchFlip(self):
        self.flip_eval = not self.flip_eval


class ControlFlowGraph:
    def __init__(self, new_block=False):
        if new_block:
            block = LLVMSingleton.getInstance().addBlock()
            LLVMSingleton.getInstance().setCurrentBlock(block)

        self.root: Vertex = Vertex(LLVMSingleton.getInstance().getCurrentBlock())

        """
        To easily support Control flow construction for example for logical '&&','||',...
        We have an accept vertex and a reject vertex, these will come handy for making the proper 
        control flow
        """
        self.accepting: Vertex = self.root
        self.reject: Vertex = None
        self.const_value_map = {}
        self.flip_eval = False


    def isEval(self):
        """
        check if the control flow is currently creating a control flow
        :return:
        """
        return self.reject is not None

    def startEval(self):
        old_accepting = self.accepting
        current_block = LLVMSingleton.getInstance().getCurrentBlock()
        self.accepting.llvm = current_block
        """
        start an eval situation providing the node that causes a splitup
        We will create a condition branch checking for true/false
        :param llvm_var:
        :return:
        """

        on_true_vertex = Vertex(None)
        on_false_vertex = Vertex(None)

        self.accepting = on_true_vertex
        self.reject = on_false_vertex

        """
        add edges for start construction
        """
        old_accepting.addEdge(Edge(old_accepting, on_true_vertex, True))
        old_accepting.addEdge(Edge(old_accepting, on_false_vertex, False))

    def endEval(self):
        ending_block = LLVMSingleton.getInstance().addBlock()
        self.accepting.llvm = ending_block
        self.reject.llvm = ending_block
        LLVMSingleton.getInstance().setCurrentBlock(ending_block)

        for edge in self.reject.reverse_edges:
            """
            every edge to reject needs to be redirected to accepting
            """
            from_vertex = edge.from_vertex

            edge_index = from_vertex.edges.index(edge)
            from_vertex.edges[edge_index].to_vertex = self.accepting

            self.accepting.reverse_edges.extend(self.reject.reverse_edges)

        phi = self.__evalSetBranches()

        self.reject = None

        return phi

    def __evalSetBranches(self):
        to_check = {self.root}
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
            if edge.on ^ edge.flip_eval:
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

    @staticmethod
    def mergeLogicalAnd(control_flow_1: "ControlFlowGraph", control_flow_2: "ControlFlowGraph"):
        new_graph: ControlFlowGraph = ControlFlowGraph()
        new_graph.root = control_flow_1.root
        """
        logical AND
        """
        original_accepting = control_flow_1.accepting
        for e in original_accepting.reverse_edges:
            e.to_vertex = control_flow_2.root
            control_flow_2.root.reverse_edges.append(e)

        original_reject = control_flow_1.reject
        for e in original_reject.reverse_edges:
            e.to_vertex = control_flow_2.reject
            control_flow_2.reject.reverse_edges.append(e)

        new_graph.accepting = control_flow_2.accepting
        new_graph.reject = control_flow_2.reject

        LLVMSingleton.getInstance().setCurrentBlock(control_flow_2.accepting.reverse_edges[0].from_vertex.llvm)

        return new_graph

    @staticmethod
    def mergeLogicalOr(control_flow_1: "ControlFlowGraph", control_flow_2: "ControlFlowGraph"):
        new_graph: ControlFlowGraph = ControlFlowGraph()
        new_graph.root = control_flow_1.root

        """
        logical OR
        """

        original_accepting = control_flow_1.accepting
        for i, e in enumerate(original_accepting.reverse_edges):
            e.to_vertex = control_flow_2.accepting
            control_flow_2.accepting.reverse_edges.append(e)

        original_reject = control_flow_1.reject
        for e in original_reject.reverse_edges:
            e.to_vertex = control_flow_2.root
            control_flow_2.root.reverse_edges.append(e)

        new_graph.reject = control_flow_2.reject
        new_graph.accepting = control_flow_2.accepting

        LLVMSingleton.getInstance().setCurrentBlock(control_flow_2.accepting.reverse_edges[0].from_vertex.llvm)

        return new_graph

    @staticmethod
    def mergeLogicalNot(control_flow_1: "ControlFlowGraph"):
        visited = set()

        check_set = {control_flow_1.root}
        while len(check_set) != 0:
            current_vertex: Vertex = check_set.pop()
            visited.add(current_vertex)
            for edge in current_vertex.edges:
                edge.switchFlip()
                if edge.to_vertex not in check_set and edge.to_vertex not in visited:
                    check_set.add(edge.to_vertex)

        return control_flow_1
