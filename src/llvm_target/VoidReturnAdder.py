from src.parser.AST import *
class VoidReturnAdder():
    def addReturn(self, cfg: map):
        for key, value in cfg.items():

            if value.accepting.node_link is not None and value.accepting.node_link.getChild(-1).text != 'Return':
                return_node = ASTNode("Return", value.accepting.node_link, None, None,None)
                value.accepting.node_link.addChildren(return_node)
                void_node = ASTNode("Void", return_node, None, None,None)
                return_node.addChildren(void_node)