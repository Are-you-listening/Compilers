from src.llvm_target.LLVMSingleton import LLVMSingleton
from llvmlite import ir


class Vertex:
    """
    This class represent a Vertex of the control flow graph
    """

    def __init__(self, llvm_block):
        """
        :param llvm_block: The llvm block that corresponds to this vertex
        """
        self.llvm = llvm_block

        """
        list of directed edges
        reverse is to know which vertex are pointing to self
        """
        self.edges = []
        self.reverse_edges = []

    def addEdge(self, edge: "Edge"):
        """
        add an edge to the vertex
        :param edge: the edge we want to add to the vertex
        """

        self.edges.append(edge)

        """
        we add the same edge to reverse edges
        so we can traverse the vertices backwards
        """
        edge.to_vertex.reverse_edges.append(edge)

    def accept(self, visitor):
        visitor.visitVertex(self)


class Edge:
    def __init__(self, from_vertex: Vertex, to_vertex: Vertex, on: bool):
        """
        constructor for a directed edge of the Control Flow graph
        :param from_vertex: the vertex this edge comes from
        :param to_vertex: the vertex this edge goes to
        :param on: We go to the 'to_vertex' only when we match the 'on' (true/false) Our code will go to this branch
        (if both edges exist (true/false) for a certain 'from' and 'to' vertex, we just go to their in all cases)
        """
        self.from_vertex = from_vertex
        self.to_vertex = to_vertex
        self.on = on

        """
        The flip indicates whether the value we pass after the end of this block is flipped,
        This needed for booleans, for None bools it is not really useful (at least for now)
        """
        self.flip_eval = False

    def switchFlip(self):
        """
        Switch the return type flip
        :return:
        """
        self.flip_eval = not self.flip_eval


class ControlFlowGraph:
    def __init__(self, new_block=False):
        """
        Initialize a new Control Graph

        :param new_block: an optional boolean, indicating if we want to create a new LLVM block
        """
        if new_block:
            """
            creates new LLVM block
            """
            block = LLVMSingleton.getInstance().addBlock()
            LLVMSingleton.getInstance().setCurrentBlock(block)

        """
        create a basic default root vertex
        """
        self.root: Vertex = Vertex(LLVMSingleton.getInstance().getCurrentBlock())

        """
        To easily support Control flow construction for example for logical '&&','||',...
        We have an accept vertex and a reject vertex, these will come handy for making the proper 
        control flow
        """
        self.accepting: Vertex = self.root
        self.reject: Vertex = None
        self.flip_eval = False

    def isEval(self):
        """
        check if the control flow is currently creating a control flow
        :return:
        """
        return self.reject is not None

    def startEval(self):
        """
        Start a logical evaluation
        We add 2 vertices: accept, reject
        (This eval expresses in its basic state a condition if 'a')
        """

        """
        Create a new accepting state
        """
        old_accepting = self.accepting
        current_block = LLVMSingleton.getInstance().getCurrentBlock()
        self.accepting.llvm = current_block

        """
        create the 2 new states
        on_true_vertex -> accepting state
        on_false_vertex -> rejecting state
        """
        on_true_vertex = Vertex(None)
        on_false_vertex = Vertex(None)

        self.accepting = on_true_vertex
        self.reject = on_false_vertex

        """
        add edges for start construction
        On True -> to accepting state
        On False -> to rejecting state
        """
        old_accepting.addEdge(Edge(old_accepting, on_true_vertex, True))
        old_accepting.addEdge(Edge(old_accepting, on_false_vertex, False))

    def endEval(self):
        """
        When we end a logical evaluation we need to collapse the Accepting and Rejecting state into 1,
        We need to create the branches, and we need to define a 'phi' function
        """

        """
        We will make 1 ending llVM block, that will represent the block at the end of the logical evaluation
        """
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

        """
        create the branches
        """
        phi = self.__evalSetBranches()

        """
        set the Reject to None, because the evaluation has ended
        """
        self.reject = None

        return phi

    def __evalSetBranches(self):
        """
        Generate the correct branches
        :return: phi: the phi LLVM instruction we end with
        """

        """
        This function is a Breath First Search starting from the root, when checking its vertex it will
        Look at its departing edges and will make the correct branch depending to which block they go to
        """

        to_check = {self.root}
        checked = set()
        final_vertex = None

        """
        do this loop till all the vertices are checked
        """
        while len(to_check) != 0:

            """
            store the vertex that we are checking in current_vertex
            """
            current_vertex = to_check.pop()
            checked.add(current_vertex)

            """
            We check the amount of edges the branch has,
            If the amount is not equal to 2, we don't care, because this means this
            """
            if len(current_vertex.edges) != 2:
                final_vertex = current_vertex
                continue

            """
            store the true and false edges as separate variables
            """
            if current_vertex.edges[0].on:
                true_edge = current_vertex.edges[0]
                false_edge = current_vertex.edges[1]
            else:
                true_edge = current_vertex.edges[1]
                false_edge = current_vertex.edges[0]

            """
            If both edges go the same block, we can just do a normal branch
            """
            if true_edge.to_vertex == false_edge.to_vertex:
                """
                In this case both true and false go to this branch
                """

                """
                The flip value determines if we flip the value we are going to return,
                So on flip, we add an XOR
                """
                if true_edge.flip_eval:
                    last_instruction = current_vertex.llvm.block.instructions[-1]
                    current_vertex.llvm.xor(last_instruction, ir.Constant(last_instruction.type, 1))

                """
                make branch statement a boolean
                """
                current_vertex.llvm.branch(true_edge.to_vertex.llvm.block)

            else:
                """
                when different endpoints for true and false, we make a conditional branch
                """
                last_instruction = self.__makeBool(current_vertex.llvm)

                current_vertex.llvm.cbranch(last_instruction, true_edge.to_vertex.llvm.block,
                                            false_edge.to_vertex.llvm.block)

            """
            decide which new vertices we add to the to_check, We don't want to check things again
            """
            if true_edge.to_vertex not in checked and true_edge.to_vertex not in to_check:
                to_check.add(true_edge.to_vertex)

            if false_edge.to_vertex not in checked and false_edge.to_vertex not in to_check:
                to_check.add(false_edge.to_vertex)

        """
        do the final part of the end eval
        """
        return self.__evalFinalVertex(final_vertex)

    @staticmethod
    def __evalFinalVertex(final_vertex):
        """
        last block needs a phi
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
        """
        convert to LLVM bool type
        :param builder:
        :return:
        """
        instruction = builder.block.instructions[-1]
        if instruction.type != ir.IntType(1):
            instruction = builder.icmp_signed("!=", instruction, ir.Constant(instruction.type, 0))

        return instruction

    @staticmethod
    def mergeLogicalAnd(control_flow_1: "ControlFlowGraph", control_flow_2: "ControlFlowGraph"):
        """
        We do a logical AND operation between 2 control flow graphs,
        We start with control flow graph 1, When this would accept, we still need to check control_flow 2,
        When we reject 1 of the control flows we reject both

        So to wrap this up
        control_flow_1.accept -> control_flow_2.root
        control_flow_1.reject -> control_flow_2.reject

        This comes down to how LLVM does its logic (check) a && b
        We check first a, if False -> it is False (reject state)
        after we check b, if True -> it is True (accepting state)
        after we check b, if False -> it is False (reject state)

        :param control_flow_1: Control flow graph
        :param control_flow_2: Control flow graph
        :return: new merged control graph
        """

        new_graph: ControlFlowGraph = ControlFlowGraph()
        new_graph.root = control_flow_1.root
        """
        logical AND change the edge links to the new vertex
        """

        """
        All edges pointing to control flow 1 accept now point to the root of control flow 2
        """
        original_accepting = control_flow_1.accepting
        for e in original_accepting.reverse_edges:
            e.to_vertex = control_flow_2.root
            control_flow_2.root.reverse_edges.append(e)

        """
        All edges pointing to control flow 1 reject now point to the reject of control flow 2
        """
        original_reject = control_flow_1.reject
        for e in original_reject.reverse_edges:
            e.to_vertex = control_flow_2.reject
            control_flow_2.reject.reverse_edges.append(e)

        """
        set new graph, accepting, rejecting to the real ending accepting and rejecting
        """
        new_graph.accepting = control_flow_2.accepting
        new_graph.reject = control_flow_2.reject

        LLVMSingleton.getInstance().setCurrentBlock(control_flow_2.accepting.reverse_edges[0].from_vertex.llvm)

        return new_graph

    @staticmethod
    def mergeLogicalOr(control_flow_1: "ControlFlowGraph", control_flow_2: "ControlFlowGraph"):
        """
        We do a logical OR operation between 2 control flow graphs,
        We start with control flow graph 1, When this would reject, we still need to check control_flow 2,
        When we accept 1 of the control flows we accept both

        So to wrap this up
        control_flow_1.reject -> control_flow_2.root
        control_flow_1.accept -> control_flow_2.accept

        This comes down to how LLVM does its logic (check) a || b
        We check first a, if True -> it is True (accepting state)
        after we check a, if False -> go to root
        after we check b, if True -> it is True (accepting state)
        after we check b, if False -> it is False (reject state)

        :param control_flow_1: Control flow graph
        :param control_flow_2: Control flow graph
        :return: new merged control graph
        """
        new_graph: ControlFlowGraph = ControlFlowGraph()
        new_graph.root = control_flow_1.root

        """
        logical OR change the edge links to the new vertex
        """

        """
        All edges pointing to control flow 1 accepts now point to the accept of control flow 2
        """
        original_accepting = control_flow_1.accepting
        for i, e in enumerate(original_accepting.reverse_edges):
            e.to_vertex = control_flow_2.accepting
            control_flow_2.accepting.reverse_edges.append(e)

        """
        All edges pointing to control flow 1 reject now point to the root of control flow 2
        """
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
        """
        This converts the Control flow to a logical not
        :param control_flow_1: original control flow
        """

        """
        We apply the logical NOT, by just switching accepting and rejecting state.
        """
        temp = control_flow_1.accepting
        control_flow_1.accepting = control_flow_1.reject

        control_flow_1.reject = temp

        """
        We still need a flip state to make sure that the final value is flipped when accept and reject are merged 
        when we end with a NOT
        """
        for edge in control_flow_1.accepting.reverse_edges:
            edge.switchFlip()

        for edge in control_flow_1.reject.reverse_edges:
            edge.switchFlip()

        return control_flow_1
