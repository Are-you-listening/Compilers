import typing


class Vertex:
    def __init__(self, llvm_end_node=None):
        """
        :param llvm_end_node:
        """
        self.llvm_end_node = llvm_end_node

        """
        list of directed edges
        reverse is to know which vertex are pointing to self
        """
        self.edges = []
        self.reverse_edges = []

    def setEndNode(self, llvm_end_node):
        self.llvm_end_node = llvm_end_node

    def addEdge(self, edge: "Edge"):
        self.edges.append(edge)
        edge.to_vertex.reverse_edges.append(edge)

    def accept(self, visitor):
        visitor.visitVertex(self)


class Edge:
    def __init__(self, from_vertex: Vertex, to_vertex: Vertex, on: typing.Tuple[int, bool]):
        """
        constructor for a directed edge of the Control Flow graph
        :param from_vertex:
        :param to_vertex:
        :param on: We go to the 'to_vertex' only when we match the 'on' (registernr, on_true/false)
        (if bool is none always branch to here)
        """
        self.from_vertex = from_vertex
        self.to_vertex = to_vertex
        self.on = on


class ControlFlowGraph:
    def __init__(self):
        self.current: Vertex = Vertex()
        self.root: Vertex = self.current

        """
        To easily support Control flow construction for example for logical '&&','||',...
        We have an accept vertex and a reject vertex, these will come handy for making the proper 
        control flow
        """
        self.accepting: Vertex = None
        self.reject: Vertex = None

    def isEval(self):
        """
        check if the control flow is currently creating a control flow
        :return:
        """
        return (self.accepting is not None) and (self.reject is not None)

    def startEval(self, llvm_node):
        """
        start an eval situation providing the node that causes a splitup
        We will create a condition branch checking for true/false
        :param llvm_node:
        :return:
        """
        self.current.setEndNode(llvm_node)

        on_true_vertex = Vertex()
        on_false_vertex = Vertex()
        self.accepting = on_true_vertex
        self.reject = on_false_vertex

        """
        add edges for start construction
        """
        self.current.addEdge(Edge(self.current, on_true_vertex, (llvm_node.register, True)))
        self.current.addEdge(Edge(self.current, on_false_vertex, (llvm_node.register, False)))

    def endEval(self):
        for edge in self.reject.reverse_edges:
            """
            every edge to reject needs to be redirected to accepting
            """
            from_vertex = edge.from_vertex

            edge_index = from_vertex.edges.index(edge)
            from_vertex.edges[edge_index].to_vertex = self.accepting

        self.current = self.accepting
        self.accepting = None
        self.reject = None

    def addLogicalAnd(self, llvm_right_child):
        new_accepting = Vertex()
        self.accepting.addEdge(Edge(self.accepting, new_accepting, (llvm_right_child.register, True)))
        self.accepting.addEdge(Edge(self.accepting, self.reject, (llvm_right_child.register, False)))

        self.accepting.setEndNode(llvm_right_child)
        self.accepting = new_accepting

    def addLogicalOr(self, llvm_right_child):
        new_reject = Vertex()
        self.reject.addEdge(Edge(self.reject, new_reject, (llvm_right_child.register, False)))
        self.reject.addEdge(Edge(self.reject, self.accepting, (llvm_right_child.register, True)))

        self.reject .setEndNode(llvm_right_child)
        self.reject = new_reject



