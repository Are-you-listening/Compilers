from abc import abstractmethod
from src.parser.AST import ASTNode, AST, ASTNodeTerminal


class ASTVisitor:
    """
    Abstract visitor for the AST
    """

    def visit(self, ast: AST):
        root = ast.root
        self.preorder(root)

    def preorder(self, root: ASTNode):
        """root.accept(self)
        for child in root.children:
            self.preorder(child)"""

        stack = [root]
        while len(stack) > 0:
            # pop() takes the last element of the list
            # just keep in mind that the end of the list is the top of the stack
            currentnode = stack.pop()
            currentnode.accept(self)
            # reverse the order of the children because the later the node in the list the sooner it will be visited
            for child in reversed(currentnode.getChildren()):
                stack.append(child)

    def postorder(self, root: ASTNode):
        """for child in root.children:
            self.postorder(child)
        root.accept(self)"""

        stack = [root]
        visited = set()
        while (len(stack) > 0):
            currentnode = stack[-1]  # get top of stack without popping it
            childnotvisited = False
            for child in reversed(currentnode.getChildren()):
                if child not in visited:
                    stack.append(child)
                    childnotvisited = True
            if not childnotvisited:
                # print(currentnode.text)  # debug print
                currentnode.accept(self)
                visited.add(currentnode)
                stack.pop()




    @abstractmethod
    def visitNode(self, node: ASTNode):
        pass

    @abstractmethod
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
