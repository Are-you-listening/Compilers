from llvmlite import ir
import copy
from typing import cast
from src.mips_target.MipsLibrary import *

class Vertex:
    """
    This class represent a Vertex of the control flow graph
    """

    def __init__(self, llvm_block):
        """
        :param llvm_block: The llvm block that corresponds to this vertex
        """
        self.llvm = llvm_block
        self.mips: Block = None
        self.node_link = None

        """
        list of directed edges
        reverse is to know which vertex are pointing to self
        """
        self.edges = []
        self.reverse_edges = []

        self.abnormally_ended = False
        self.abnormally_ended_position = None

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

    def removeEdge(self, edge: "Edge"):
        self.edges.remove(edge)

        edge.to_vertex.reverse_edges.remove(edge)

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

    def check_flipped(self, mips:bool=False):
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
        if true_edge.flip_eval and not mips:
            last_instruction = self.llvm.block.instructions[-1]
            self.llvm.xor(last_instruction, ir.Constant(last_instruction.type, 1))

        if true_edge.flip_eval and mips:
            self.mips.xor(self.mips.instructions[-1].getAddress(), self.mips.li(1))

    def create_branch(self, mips: bool= False):
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
            if mips:
                RegisterManager.getInstance().curr_function[self.mips.function.getFunctionName()] = self.mips.counter

                self.mips.addui_function(Memory("sp", True), self.mips.counter - true_edge.to_vertex.mips.start_counter,
                                         Memory("sp", True))
                if true_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self) and true_edge.to_vertex.mips.terminated:
                    RegisterManager.getInstance().loadIfNeeded(self.mips, [true_edge.to_vertex.mips.stack_val])
                    print("sp3", true_edge.to_vertex.mips.stack_val)
                    print("v", true_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self))
                    print("quickie", self.mips.label, self.mips.counter)
                    self.mips.move(Memory("sp", True), true_edge.to_vertex.mips.stack_val)

                self.mips.j(true_edge.to_vertex.mips.label)
                self.mips.terminated = True
            else:
                self.llvm.branch(true_edge.to_vertex.llvm.block)

        else:
            """
            when different endpoints for true and false, we make a conditional branch
            """

            if mips:
                """
                Branches are created after all is done, so we do not know the register information anymore,
                but we know that we need to check the last store register of the last instruction 
                """
                r = Memory("v0", True)

                """
                If false
                """
                RegisterManager.getInstance().curr_function[self.mips.function.getFunctionName()] = self.mips.counter

                self.mips.addui_function(Memory("sp", True),
                                         self.mips.counter - false_edge.to_vertex.mips.start_counter,
                                         Memory("sp", True))

                if false_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self) and false_edge.to_vertex.mips.terminated:
                    print("quickie3", self.mips.label, self.mips.counter)
                    RegisterManager.getInstance().loadIfNeeded(self.mips, [false_edge.to_vertex.mips.stack_val])
                    print("v", false_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self))
                    stack_buf = self.mips.addui(Memory("sp", True), 0)
                    self.mips.move(Memory("sp", True), false_edge.to_vertex.mips.stack_val)

                print("counterspace", self.mips.counter - true_edge.to_vertex.mips.start_counter)
                print("counterspace", self.mips.counter - false_edge.to_vertex.mips.start_counter)

                self.mips.beq(Memory(r, True), Memory("zero", True), false_edge.to_vertex.mips.label)
                self.mips.addui_function(Memory("sp", True),
                                         (self.mips.counter - false_edge.to_vertex.mips.start_counter)*-1,
                                         Memory("sp", True))

                if false_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self) and false_edge.to_vertex.mips.terminated:
                    print("sp1", stack_buf.address)
                    self.mips.move(Memory("sp", True), stack_buf)

                """
                If True, just do a jump
                """
                self.mips.addui_function(Memory("sp", True),
                                         self.mips.counter - true_edge.to_vertex.mips.start_counter,
                                         Memory("sp", True))

                if true_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self) and true_edge.to_vertex.mips.terminated:
                    print("s", ControlFlowGraph.get_reverse_vertices(self))
                    print("s2", self.reverse_edges)
                    RegisterManager.getInstance().loadIfNeeded(self.mips, [true_edge.to_vertex.mips.stack_val])
                    print("quickie2", self.mips.label, self.mips.counter)
                    print("v", true_edge.to_vertex in ControlFlowGraph.get_reverse_vertices(self))
                    self.mips.move(Memory("sp", True), true_edge.to_vertex.mips.stack_val)


                self.mips.j(true_edge.to_vertex.mips.label)
                self.mips.terminated = True
            else:
                last_instruction = ControlFlowGraph.makeBool(self.llvm)
                self.llvm.cbranch(last_instruction, true_edge.to_vertex.llvm.block, false_edge.to_vertex.llvm.block)

    def create_phi(self, mips: bool= False):
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
        if mips:
            phi: Memory = Memory("a1", True)
            print("phi_location", phi)

        else:
            phi: ir.PhiInstr = self.llvm.phi(bool_type)

        """
        The sorted is so, every run the order of phi labels stays the same
        """

        if mips:
            sort_lambda = lambda x: x.mips.label
        else:
            sort_lambda = lambda x: x.llvm.block.name

        for vertex in sorted(list(edge_true_list.union(edge_false_list)), key=sort_lambda):
            in_true = vertex in edge_true_list
            in_false = vertex in edge_false_list

            if in_true and in_false:

                if mips:
                    vertex.mips.move(phi, vertex.mips.instructions[-1].getAddress())
                else:
                    last_instruction = vertex.llvm.block.instructions[-1]
                    """
                    make bool if not a bool type
                    """
                    phi.add_incoming(last_instruction, vertex.llvm.block)

            elif in_true:
                if mips:
                    loaded_const = vertex.mips.li(1)
                    vertex.mips.move(phi, loaded_const)
                else:
                    phi.add_incoming(ir.Constant(bool_type, 1), vertex.llvm.block)
            elif in_false:
                if mips:
                    loaded_const = vertex.mips.li(0)
                    vertex.mips.move(phi, loaded_const)
                else:
                    phi.add_incoming(ir.Constant(bool_type, 0), vertex.llvm.block)

        return phi

    def remove_edges(self):
        """
        Remove all edges arriving/ departing from this vertex
        """

        for e in copy.copy(self.reverse_edges):
            e.from_vertex.removeEdge(e)

        for e in copy.copy(self.edges):
            self.removeEdge(e)


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
        SwitchTests the return type flip
        :return:
        """
        self.flip_eval = not self.flip_eval

    def __eq__(self, other):
        return self.from_vertex == other.from_vertex and self.to_vertex == other.to_vertex and self.on == other.on and self.flip_eval == other.flip_eval


class ControlFlowGraph:
    def __init__(self, start_vertex=None):
        """
        Initialize a new Control Graph

        :param start_vertex: an optional boolean, indicating if we want to create a new LLVM block
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

        self.abnormal_terminator_nodes = {"BREAK": [], "CONTINUE": [], "RETURN": []}

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
        :param constant:
        :param builder:
        :return:
        """
        if isinstance(constant, ir.Constant):
            instruction = constant
        else:
            last_index = -1
            while True:
                instruction = builder.block.instructions[last_index]
                if not isinstance(instruction, ir.instructions.Comment):
                    break
                last_index -= 1

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
            edge.to_vertex.reverse_edges.remove(edge)

            edge.from_vertex = control_flow_1.accepting
            control_flow_1.accepting.addEdge(edge)

        original_accepting_1 = control_flow_1.accepting
        control_flow_1.accepting = control_flow_2.accepting
        control_flow_1.abnormal_terminator_nodes = ControlFlowGraph.merge_abnormal_terminators(control_flow_1, control_flow_2)

        """
        List of all abnormal ending vertices
        """
        total_list = []
        for v in control_flow_1.abnormal_terminator_nodes.values():
            for u in v:
                total_list.append(u)

        """
        In case control_flow_2.root, ahd an abnormal node, we need to change its corresponding node
        
        In case of 
        continue;
        break;
        we need to take the continue and ignore the break
        """
        for k, v in control_flow_1.abnormal_terminator_nodes.items():
            if control_flow_2.root not in v:
                continue

            if original_accepting_1 in total_list:
                v.remove(control_flow_2.root)
                continue

            replace_index = v.index(control_flow_2.root)
            v[replace_index] = original_accepting_1
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
        For IF statements without else We need to do the following actions:
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

        if else_cfg is not None:
            if_cfg.abnormal_terminator_nodes = ControlFlowGraph.merge_abnormal_terminators(if_cfg, else_cfg)
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
    def get_reverse_vertices(vertex):
        s = [vertex]
        visited = set(s)

        while len(s) > 0:
            t = s.pop()
            for r in t.reverse_edges:
                if r.from_vertex not in visited and r.from_vertex not in s:
                    visited.add(r.from_vertex)
                    s.append(r.from_vertex)
        return visited

    @staticmethod
    def while_statement(in_cfg: "ControlFlowGraph", always_true=False):
        """
        CFG creation when an WHILE statement is used

        :param always_true: Stores when a while loop is WHILE TRUE
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

        if always_true:
            check_condition.addEdge(Edge(check_condition, in_cfg.root, False))
        else:
            check_condition.addEdge(Edge(check_condition, new_accepting, False))

        """
        When the block inside the while loop is checked once, go back to the check condition block
        """
        in_cfg.accepting.addEdge(Edge(in_cfg.accepting, check_condition, True))
        in_cfg.accepting.addEdge(Edge(in_cfg.accepting, check_condition, False))

        in_cfg.root = new_root
        in_cfg.accepting = new_accepting

        """
        In case their are breaks inside the while loops we need to handle it, to change the control flow of the
        breaks to the accepting state
        """
        breaks = in_cfg.abnormal_terminator_nodes["BREAK"]
        for break_vertex in breaks:

            if break_vertex.abnormally_ended:
                continue

            break_vertex.abnormally_ended = True

            for e in copy.copy(break_vertex.edges):
                break_vertex.removeEdge(e)

            break_vertex.addEdge(Edge(break_vertex, in_cfg.accepting, True))
            break_vertex.addEdge(Edge(break_vertex, in_cfg.accepting, False))

        in_cfg.abnormal_terminator_nodes["BREAK"] = []

        """
        In case their are continues inside the while loops we need to handle it, to change the control flow of the
        breaks to the accepting state
        """
        continues = in_cfg.abnormal_terminator_nodes["CONTINUE"]

        for continue_vertex in continues:

            if continue_vertex.abnormally_ended:
                continue

            continue_vertex.abnormally_ended = True

            for e in copy.copy(continue_vertex.edges):
                continue_vertex.removeEdge(e)

            continue_vertex.addEdge(Edge(continue_vertex, check_condition, True))
            continue_vertex.addEdge(Edge(continue_vertex, check_condition, False))

        in_cfg.abnormal_terminator_nodes["CONTINUE"] = []

        return in_cfg, check_condition

    def add_abnormal_terminator(self, category: str, node):
        """
        Store the abnormal terminators that do not yet serve their purpose

        :param category:
        :param node:
        :return:
        """

        """
        Check node doesn't already exist
        """

        self.abnormal_terminator_nodes[category].append(node)

    @staticmethod
    def merge_abnormal_terminators(cfg_1: "ControlFlowGraph", cfg_2: "ControlFlowGraph"):
        result_abnormal = {}
        for k, v in cfg_1.abnormal_terminator_nodes.items():
            v.extend(cfg_2.abnormal_terminator_nodes[k])
            result_abnormal[k] = v

        return result_abnormal

    @staticmethod
    def check_return_statement(cfg: "ControlFlowGraph"):
        """
        In case of a return statement our edges of the vertex will be removed

        :param cfg:
        :return:
        """
        returns = cfg.abnormal_terminator_nodes["RETURN"]
        for return_vertex in returns:

            if return_vertex.abnormally_ended:
                continue

            return_vertex.abnormally_ended = True

            for e in copy.copy(return_vertex.edges):
                return_vertex.removeEdge(e)

        cfg.abnormal_terminator_nodes["RETURN"] = []
