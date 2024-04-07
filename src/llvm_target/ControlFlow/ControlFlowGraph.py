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
        self.node_link = None

        """
        list of directed edges
        reverse is to know which vertex are pointing to self
        """
        self.edges = []
        self.reverse_edges = []

        """
        The Instructions whose node we want for calculating our phi
        """
        self.phi_nodes = []

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

    def give_vertex(self, other_vertex):
        """
        Give the node link to another vertex
        :param other_vertex:
        :return:
        """
        if self.node_link is None:
            return
        self.node_link.replaceVertex(other_vertex)
        other_vertex.node_link = self.node_link

        self.node_link = None

    def check_flipped(self):
        """
        Check if we need to place an XOR

        :return:
        """

        if len(self.edges) != 2:
            return

        true_edge = self.edges[0]
        false_edge = self.edges[1]

        if true_edge.to_vertex != false_edge.to_vertex:
            return

        """
        The flip value determines if we flip the value we are going to return,
        So on flip, we add an XOR
        """
        if true_edge.flip_eval:
            last_instruction = self.llvm.block.instructions[-1]
            self.llvm.xor(last_instruction, ir.Constant(last_instruction.type, 1))

    def create_branch(self):
        if len(self.edges) != 2:
            return

        """
        store the true and false edges as separate variables
        """
        if self.edges[0].on:
            true_edge = self.edges[0]
            false_edge = self.edges[1]
        else:
            true_edge = self.edges[1]
            false_edge = self.edges[0]

        """
        If both edges go the same block, we can just do a normal branch
        """
        if true_edge.to_vertex == false_edge.to_vertex:
            """
            In this case both true and false go to this branch
            """

            """
            make branch statement a boolean
            """
            self.llvm.branch(true_edge.to_vertex.llvm.block)

        else:
            """
            when different endpoints for true and false, we make a conditional branch
            """
            last_instruction = ControlFlowGraph.makeBool(self.llvm)
            self.llvm.cbranch(last_instruction, true_edge.to_vertex.llvm.block,
                                        false_edge.to_vertex.llvm.block)

    def create_phi(self):
        """
        last block needs a phi
        calculate the phi
        """

        edge_true_list = set()
        edge_false_list = set()
        for edge in self.reverse_edges:
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
        phi: ir.PhiInstr = self.llvm.phi(bool_type)

        """
        The sorted is so, every run the order of phi labels stays the same
        """
        for vertex in sorted(list(edge_true_list.union(edge_false_list)), key=lambda x: x.llvm.block.name):
            in_true = vertex in edge_true_list
            in_false = vertex in edge_false_list

            if in_true and in_false:

                last_instruction = vertex.llvm.block.instructions[-1]
                """
                make bool if not a bool type
                """

                phi.add_incoming(last_instruction, vertex.llvm.block)

            elif in_true:
                phi.add_incoming(ir.Constant(bool_type, 1), vertex.llvm.block)
            elif in_false:
                phi.add_incoming(ir.Constant(bool_type, 0), vertex.llvm.block)

        return phi


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

    def __eq__(self, other):
        return self.from_vertex == other.from_vertex and self.to_vertex == other.to_vertex and self.on == other.on and self.flip_eval == other.flip_eval


class ControlFlowGraph:
    def __init__(self, start_vertex=None):
        """
        Initialize a new Control Graph

        :param new_block: an optional boolean, indicating if we want to create a new LLVM block
        """

        """
        create a basic default root vertex
        """
        self.root: Vertex = Vertex(None)

        if start_vertex is not None:
            self.root = start_vertex

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

        """
        set the Reject to None, because the evaluation has ended
        """
        self.reject = None


    @staticmethod
    def makeBool(builder, constant=None):
        """
        convert to LLVM bool type
        :param builder:
        :return:
        """
        if isinstance(constant, ir.Constant):
            instruction = constant
        else:
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
        control_flow_1.accepting.give_vertex(control_flow_2.root)

        """
        All edges pointing to control flow 1 reject now point to the reject of control flow 2
        """
        original_reject = control_flow_1.reject
        for e in original_reject.reverse_edges:
            e.to_vertex = control_flow_2.reject
            control_flow_2.reject.reverse_edges.append(e)

        control_flow_1.reject.give_vertex(control_flow_2.reject)

        """
        set new graph, accepting, rejecting to the real ending accepting and rejecting
        """
        new_graph.accepting = control_flow_2.accepting
        new_graph.reject = control_flow_2.reject


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

        control_flow_1.accepting.give_vertex(control_flow_2.accepting)

        """
        All edges pointing to control flow 1 reject now point to the root of control flow 2
        """
        original_reject = control_flow_1.reject
        for e in original_reject.reverse_edges:
            e.to_vertex = control_flow_2.root
            control_flow_2.root.reverse_edges.append(e)

        control_flow_1.reject.give_vertex(control_flow_2.root)

        new_graph.reject = control_flow_2.reject
        new_graph.accepting = control_flow_2.accepting


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

    def get_endpoints(self):
        return self.root.llvm, self.accepting.llvm

    def remove_vertex(self, vertex: Vertex):
        """
        Remove this vertex from the graph
        This can only remove redundant blocks

        :param vertex:
        :return:
        """

        if self.root == vertex or self.accepting == vertex:
            raise Exception("Did invalid vertex remove")

        target_vertex = vertex.edges[0].to_vertex
        for e in target_vertex.reverse_edges:
            assert e.to_vertex == target_vertex

        r_edges = []
        for r_edge in vertex.reverse_edges:
            r_edge.to_vertex = target_vertex
            r_edges.append(r_edge)

        for e in target_vertex.reverse_edges:
            assert e.to_vertex == target_vertex

        for edge in target_vertex.reverse_edges:
            if edge.from_vertex != vertex:
                r_edges.append(edge)

        target_vertex.reverse_edges = r_edges

    @staticmethod
    def default_merge(control_flow_1: "ControlFlowGraph", control_flow_2: "ControlFlowGraph"):

        ed = control_flow_2.root.edges
        for edge in ed:
            edge.from_vertex = control_flow_1.accepting
            control_flow_1.accepting.addEdge(edge)

        control_flow_1.accepting = control_flow_2.accepting

        return control_flow_1

    @staticmethod
    def if_statement(if_cfg: "ControlFlowGraph", else_cfg: "ControlFlowGraph" = None):
        """
        CFG creation when an IF statement is used

        :param else_cfg: control flow that we will change
        :param if_cfg: control flow that we will change
        :return:
        """

        """
        For IF statements without else We need to do the follwoing actions:
        - Add a new root vertex, that connects to the old root when  True,
        - When False/after original end (accepting) go to the new end (accepting)
        """

        new_root = Vertex(None)
        new_accepting = Vertex(None)

        old_root = if_cfg.root
        old_accepting = if_cfg.accepting

        new_root.addEdge(Edge(new_root, old_root, True))
        old_accepting.addEdge(Edge(old_accepting, new_accepting, True))
        old_accepting.addEdge(Edge(old_accepting, new_accepting, False))
        if else_cfg is None:
            new_root.addEdge(Edge(new_root, new_accepting, False))
        else:

            new_root.addEdge(Edge(new_root, else_cfg.root, False))
            else_cfg.accepting.addEdge(Edge(else_cfg.accepting, new_accepting, True))
            else_cfg.accepting.addEdge(Edge(else_cfg.accepting, new_accepting, False))

        if_cfg.root = new_root
        if_cfg.accepting = new_accepting
        return if_cfg

    def verify_integrity(self):
        """
        Check if the edges and reverse edges match

        :return:
        """

        stack = [self.root]
        visited = set()

        while len(stack) > 0:
            vertex = stack.pop()
            visited.add(vertex)

            for e in vertex.edges:
                if e.to_vertex not in visited:
                    stack.append(e.to_vertex)

                assert e.from_vertex == vertex

                for re in e.to_vertex.reverse_edges:
                    assert re.to_vertex == e.to_vertex
                    assert re in re.from_vertex.edges
                assert e in e.to_vertex.reverse_edges

    @staticmethod
    def while_statement(in_cfg: "ControlFlowGraph"):
        """
        CFG creation when an WHILE statement is used

        :param in_cfg: the cfg of the code inside the while loop
        :return:
        """

        """
        Creating the CFG for a while loop will do the following changes
        
        Add a new root (indicating the vertex/block before entering the loop)
        This will have edges to the .root condition check block (when False, goes to new_accepting, when True go to 'in_cfg' block)
        
        After having done the loop, we will reroute to the check condition block
        """

        new_root = Vertex(None)
        check_condition = Vertex(None)
        new_accepting = Vertex(None)

        """
        new root to check condition
        """

        new_root.addEdge(Edge(new_root, check_condition, True))
        new_root.addEdge(Edge(new_root, check_condition, False))

        """
        check condition will go to the in WHILE block if condition is True, else go to new_accepting
        """
        check_condition.addEdge(Edge(check_condition, in_cfg.root, True))
        check_condition.addEdge(Edge(check_condition, new_accepting, False))

        """
        When the block inside the while loop is checked once, go back to the check condition block
        """
        in_cfg.accepting.addEdge(Edge(in_cfg.accepting, check_condition, True))
        in_cfg.accepting.addEdge(Edge(in_cfg.accepting, check_condition, False))

        in_cfg.root = new_root
        in_cfg.accepting = new_accepting

        return in_cfg, check_condition
