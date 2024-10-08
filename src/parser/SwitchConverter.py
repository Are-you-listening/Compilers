import copy

from src.parser.ASTConversion import *


class SwitchConverter(ASTVisitor):
    """
    This visitor makes sure that the switch statement will be converted to an if else statement
    The receiving format for this visitor will be an SWITCH node with the following children in order:
    node 0: switched value
    all other nodes: ASTnode with name Case or Default
    Case Node: First child: case condition, Second child: code block
    Case Default: First child: code block

    """
    def __init__(self):
        self.break_map = {}
        self.declare_map = {}
        self.to_add = []
        self.to_add_parent = []
        self.to_remove = set()

    def visit(self, ast: AST):

        """
        override the visit, so we can remove after the traverse the nodes we don't need anymore
        """

        """
        Inside a switch statement we are not allowed to have declarations unless they are inside a scope
        We are going to tickle up the mapping of a node -> boolean, indicating whether it has an illegal declaration,
        when we come across a scope/Code Node this will be set to false, else we will take the true if exists,
        instead of using real booleans we will stored the node of the declaration if present, so we can give the
        proper error message
        """
        self.declare_map = {}

        """
        Maps the nodes to break nodes if exists, we do a postorder to tickle up the break statements, when we 
        to figure out whether the case/default has a break statement. When we come across a while,for/switch statement, 
        we will not tickle up those child breaks anymore
        """
        self.break_map = {}
        self.to_add = []
        self.to_add_parent = []
        self.to_remove = set()

        self.postorder(ast.root)

        """
        Add the to add nodes on the provided spot (The switch is the node who we want to 'replace', 
        by inserting right before this)
        """
        for switch, added in self.to_add:
            target = switch.parent
            target.children.insert(target.findChild(switch), added)
            added.parent = target

        """
        Add this 'added' node to the parent of the provided node 
        (at the time this tuple is added to this list, this parent is not yet known)
        """
        for node, added in self.to_add_parent:

            target = node.parent

            target.addChildren(added)
            added.parent = target

        for r in self.to_remove:
            r.parent.removeChild(r)

    def visitNode(self, node: ASTNode):
        """
        This visitor will handle the switch statement actions
        """

        """
        Do the tickle up for the declarations
        """
        self.declare_map[node] = None
        for c in node.children:
            if self.declare_map.get(c, None) is not None:
                self.declare_map[node] = self.declare_map.get(c, None)
                break

        """
        In case we come across a Code/Scope node, we will set the declare_map entry to False, so we can
        check in a switch statement whether to send an error message or not
        """
        if node.text in ("Code", "Scope") and node.parent.text not in ("CASE", "DEFAULT"):
            """
            check 'node.parent.text not in ("CASE", "DEFAULT")' is because our grammar makes by default
            a Code node for the case and default body
            """
            self.declare_map[node] = None

        """
        In case our node is a declaration we need to set the declare boolean for this node of true
        """
        if node.text == "Declaration":
            self.declare_map[node] = node

        """
        Update the break map (indicating if the subtree has a break),
        This will do a tickle up of the break information, but if the break is inside a while/for loop,
        we don't want to pass it up
        """
        if node.text in ("WHILE", "FOR"):
            return

        for c in node.children:
            if c in self.break_map:
                self.break_map[node] = self.break_map[c]
                break

        if node.text != "SWITCH":
            return
        """
        In case we have a switch statement, we will first check whether no illegal declarations are inside the 
        switch statement
        """
        if self.declare_map[node]:
            """
            When we have an illegal declaration, we will use the declaration node to properly throw the error
            """
            declaration_node = self.declare_map[node]
            declared_line = declaration_node.getChild(1).position.linenr
            declared_variable = declaration_node.getChild(1).text
            ErrorExporter.switchDeclaration(declaration_node.getChild(1).position, declared_variable)

        """
        Translate all the children to IF Else
        By constantly creating a subtree
        """

        """
        Identifier we will use to verify our cases in our switch statement
        
        in switch(a), our switch identifier contains the 'a'
        """
        switch_identifier = node.getChild(0)

        if not isinstance(switch_identifier, ASTNodeTerminal):
            raise Exception("Switch uses invalid identifier")

        """
        Convert the switch statement to if else, to support all orders of breaks, cases, defaults, we do the
        following constructions:
        
        assume we have a couple cases: (with switch identifier 'a')
        case 1:
        do something A
        case 2: 
        do something B        
        break;
        
        This will be translated to ->
        if (a == 1 || a == 2){
            if (a == 1){
                do something A
            }
            do something B
        }
        (This can be bigger depending on how many cases pass before a break)
        First we have an if statement that accepts all cases before the break,
        After we will have if statements do distinguish the unique parts (do something A)
        
        because 'Default' can be anywhere, we rewrite our default as an IF statement, 
        (for previous example our default would be)
        
        if (a != 1 && a != 2){
            do default
        }
        (Accepting everything not accepted by a case)
        """

        """
        Make a list of all the case values we want to check
        """
        all_case_values = []
        for child in node.children[1:]:
            if child.text != "CASE":
                continue

            all_case_values.append(child.getChild(0))

        """
        Make a special construction to convert a switch statement to IF statements
        """

        """
        equal_nodes, stores all the cases, that exist before, our current case (without a break present) 
        """
        equal_nodes = []
        for i, child in enumerate(node.children[1:]):
            has_break = self.break_map.get(child, None) is not None
            """
            Remove the 'breaks' form inside a switch
            """
            if has_break:
                self.to_remove.add(self.break_map.get(child))

            """
            In case of a 'Case' statement create the check (a == case_value),
            and store the code block we will execute if the condition true
            """
            if child.text == "CASE":
                equal_node = self.createEqualCheckNode(switch_identifier, child.getChild(0))

                equal_nodes.append((equal_node, child.getChild(1)))

                self.to_remove.add(child)

            """
            In case of our default, we will execute the code the condition
            a != case_1 condition && ... is true, all_case_values is a list of those case condition values
            We will construct this boolean expression, and add this expression to equals nodes
            """
            if child.text == "DEFAULT":
                current = self.createEqualCheckNode(switch_identifier, all_case_values[0], True)
                self.to_remove.add(child)

                """
                Create boolean a != 1 && a != @ && ... expression
                """
                for b in all_case_values[1:]:
                    not_equal_node = self.createEqualCheckNode(switch_identifier, b, True)
                    current = self.createOrStatement(current, not_equal_node, True)

                equal_nodes.append((current, child.getChild(0)))

            """
            When A break occurs, we know 
            """
            if has_break or i == node.getChildAmount()-2:
                if len(equal_nodes) == 0:
                    continue

                connect_node = equal_nodes[0]

                for equal_node in equal_nodes[1:]:
                    new_condition = self.createOrStatement(connect_node[0], equal_node[0])

                    sub_condition = self.createIfStatement(self.createCopy(connect_node[0]), connect_node[1])

                    self.to_add_parent.append((sub_condition, equal_node[1]))

                    connect_node = (new_condition, sub_condition)

                equal_nodes.clear()

                if_node = self.createIfStatement(connect_node[0], connect_node[1])
                self.to_add.append((node, if_node))

        self.to_remove.add(node)

        """
        In case we have nested switches, we want to make sure the breaks do not cascade to outside the 
        inner switch statement
        """
        if node in self.break_map.keys():
            self.break_map.pop(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):

        if node.text != "break":
            return

        self.break_map[node] = node

    @staticmethod
    def createEqualCheckNode(node_1: ASTNodeTerminal, node_2: ASTNodeTerminal, flip_condition=False):
        check_node = ASTNode("Expr", None, node_1.getSymbolTable(), node_1.position, node_1.structTable)
        check_node.addChildren(ASTNodeTerminal(node_1.text, check_node, node_1.getSymbolTable(),
                                               node_1.type, node_1.position, node_1.structTable))

        terminal_label = "=="
        if flip_condition:
            terminal_label = "!="

        equal = ASTNodeTerminal(terminal_label, check_node, node_1.getSymbolTable(), -1, node_1.position,
                                node_1.structTable)

        check_node.addChildren(equal)

        check_node.addChildren(ASTNodeTerminal(node_2.text, check_node, node_2.getSymbolTable(),
                                               node_2.type, node_2.position, node_2.structTable))

        return check_node

    @staticmethod
    def createOrStatement(node_1: ASTNode, node_2: ASTNode, flip_condition=False):
        """
        Make an 'or' between 2 nodes
        """
        check_node = ASTNode("Expr", None, node_1.getSymbolTable(), node_1.position, node_1.structTable)
        check_node.addChildren(node_1)
        node_1.parent = check_node

        terminal_label = "||"
        if flip_condition:
            terminal_label = "&&"

        or_node = ASTNodeTerminal(terminal_label, check_node, node_1.getSymbolTable(), -1, node_1.position,
                                  node_1.structTable)
        check_node.addChildren(or_node)

        check_node.addChildren(node_2)
        node_2.parent = check_node

        return check_node

    @staticmethod
    def createIfStatement(condition: ASTNode, execute_block: ASTNode):
        """
        Construction for If statement
        """

        check_node = ASTNode("IF", None, execute_block.getSymbolTable(), execute_block.position,
                             execute_block.structTable)

        check_node.addChildren(condition)
        condition.parent = check_node

        check_node.addChildren(execute_block)
        execute_block.parent = check_node

        """
        When the If code, block does not have a 'Code', note, we add a 'Code' node
        """
        if execute_block.text != "Code":
            temp = ASTNode("Code", None, check_node.getSymbolTable(), check_node.position,
                           execute_block.structTable)

            execute_block.addNodeParent(temp)

        """
        Give check node a 'code' parent
        """

        return check_node

    @staticmethod
    def createCopy(node: ASTNode):
        """
        Create a copy of this subtree, while keeping the same symbol table
        """

        if isinstance(node, ASTNodeTerminal):
            new_node = ASTNodeTerminal(node.text, node.parent, node.getSymbolTable(), node.type,
                                       node.position, node.structTable)

        elif isinstance(node, ASTNodeTypes):
            new_node = ASTNodeTypes(node.text, node.parent, node.getSymbolTable(),
                                    copy.deepcopy(node.symbol_type), node.position, node.structTable)
        else:
            new_node = ASTNode(node.text, node.parent, node.getSymbolTable(), node.position, node.structTable)


        for child in node.children:
            copy_child = SwitchConverter.createCopy(child)
            new_node.addChildren(copy_child)
            copy_child.parent = new_node

        return new_node
