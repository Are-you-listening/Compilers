from abc import abstractmethod
from src.parser.AST import ASTNode, AST, ASTNodeTerminal


class ASTVisitor:
    """
    Abstract visitor for the AST
    """
    def visit(self, ast: AST):
        self.preorder(ast.root)

    def preorder(self, root: ASTNode):
        """root.accept(self)
        for child in root.children:
            self.preorder(child)"""

        stack = [root]
        while len(stack) > 0:
            # pop() takes the last element of the list
            # just keep in mind that the end of the list is the top of the stack
            currentNode = stack.pop()
            currentNode.accept(self)
            # reverse the order of the children because the later the node in the list the sooner it will be visited
            for child in reversed(currentNode.getChildren()):
                stack.append(child)

    def postorder(self, root: ASTNode):
        """for child in root.children:
            self.postorder(child)
        root.accept(self)"""

        stack = [root]
        visited = set()
        while len(stack) > 0:
            currentNode = stack[-1]  # get top of stack without popping it
            childNotVisited = False
            for child in reversed(currentNode.getChildren()):
                if child not in visited:
                    stack.append(child)
                    childNotVisited = True
            if not childNotVisited:
                currentNode.accept(self)
                visited.add(currentNode)
                stack.pop()

    @abstractmethod
    def visitNode(self, node: ASTNode):
        pass

    @abstractmethod
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
