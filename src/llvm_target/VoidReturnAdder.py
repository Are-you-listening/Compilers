from src.parser.AST import *
from src.parser.ErrorExporter import ErrorExporter


class VoidReturnAdder():
    def addReturn(self, cfg: map):
        for key, value in cfg.items():
            final_vertices = self.get_final_vertices(value)

            function_type = value.root.node_link.getSymbolTable().getEntry(key).getTypeObject()
            return_type = function_type.return_type

            for f in final_vertices:
                has_return, final_node = self.has_return(f.node_link)
                if not has_return:

                    VoidReturnAdder.handle_returnless(value.accepting, return_type, final_node)

    @staticmethod
    def handle_returnless(vertex, return_type, final_node):
        is_void = return_type.getType() == "VOID"

        if is_void:
            return_node = ASTNode("Return", vertex.node_link, None, None, None)
            vertex.node_link.addChildren(return_node)
        else:
            ErrorExporter.missingReturn(final_node.position, return_type)

    @staticmethod
    def get_final_vertices(cfg):
        stack = [cfg.root]

        finals = set()
        visited = {cfg.root}

        while len(stack) > 0:
            vertex = stack.pop()
            for e in vertex.edges:
                if e.to_vertex in visited:
                    continue
                stack.append(e.to_vertex)
                visited.add(e.to_vertex)

            if len(vertex.edges) == 0:
                finals.add(vertex)

        return finals

    @staticmethod
    def has_return(node: ASTNode):
        if node.text == "PHI":
            while node.text != "Block":
                node = node.parent

        while node.getChildAmount() > 0 and node.text != "Return":
            node = node.getChild(-1)
        return node.text == "Return", node
