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
        visited = set()

        while len(stack) > 0:
            # pop() takes the last element of the list
            # just keep in mind that the end of the list is the top of the stack
            currentNode = stack.pop()
            currentNode.accept(self)
            # reverse the order of the children because the later the node in the list the sooner it will be visited

            visited.add(currentNode)

            for child in reversed(currentNode.getChildren()):
                if child not in visited and child not in stack:
                    stack.append(child)

    def postorder(self, root: ASTNode):
        """for child in root.children:
            self.postorder(child)
        root.accept(self)"""

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack)-1
            currentNode = stack[current_index]  # get top of stack without popping it

            do_visit = True
            for child in reversed(currentNode.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                currentNode.accept(self)
                stack.pop(current_index)

            visited.add(currentNode)


    @abstractmethod
    def visitNode(self, node: ASTNode):
        pass

    @abstractmethod
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
