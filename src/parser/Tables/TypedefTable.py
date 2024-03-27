from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolTypePtr import *
from src.parser.AST import *

from typing import Dict
from src.parser.Tables.AbstractTable import *
from src.parser.ASTTypedefReplacer import ASTTypedefReplacer


class TypedefEntry(TableEntry):
    def __init__(self, node: ASTNode):
        self.node = node


class TypedefTable(AbstractTable):
    def __init__(self, prev):
        super().__init__(prev)
        self.typedefs = []  # List of TypeDef-Subtrees (These are not present anymore in the AST)

    def add(self, entry: TypedefEntry):
        self.typedefs.append(entry)

    def remove(self, typedef: TypedefEntry):
        newlist = []
        for defi in self.typedefs:
            if defi != typedef:
                newlist.append(defi)
        self.typedefs = newlist

    def getEntry(self, name):
        pass

    def accept(self, v):
        v.visitSym(self)

    def addTypeDef(self, node: ASTNode):
        """
        Adds a new typedef and already tries to translate it to the main type
        :param node: The subtree containing the typedef
        :return:
        """
        to_type_mapping = node.getChild(2).text

        """
        if the typename already exists, we need to throw an semantic error, because we are not allowed to override it
        We can only override this when the typedef is in a different scope
        """
        if to_type_mapping in ("INT", "CHAR", "FLOAT"):
            ErrorExporter.TypeDefNativeType(node.linenr, to_type_mapping)
            return True

        """
        within the same scope 2 typedefs for the same name are not allowed, unless the typedefs do exactly the same
        
        We will check if it already exists, if so we check if the types are the same, if not thow an error
        """
        exists, sub_node = self.existsLocally(to_type_mapping)
        if exists:
            type_node1 = sub_node.getChild(1)
            type_node2 = node.getChild(1)
            s1 = self.getNodeString(type_node1)
            s2 = self.getNodeString(type_node2)
            if s1 != s2:
                ErrorExporter.TypeDefDoubleDeclare(node.linenr, s1, s2)
            return

        while ASTTypedefReplacer.containsNonBaseType(
                node.children[1].children):  # Check if the typedef is of the form "typedef beer appel;"
            self.translate(node.children[1])  # Translate the type from the typedef node

        self.typedefs.append(node)

    def translate(self, node: ASTNode):
        """
        Translate a typedef to a base class typedef
        :param node:
        :return:
        """
        identifier, index = ASTTypedefReplacer.getTypeName(node.children)
        translation = []
        args = [identifier, translation]
        self.traverse(lambda x, a: x.getTranslation(a), True, args)
        node.typedefReplaceChildren(translation, index)

    def getTranslation(self, args):
        """
        :param identifier: kaas in e.g. typedef int* kaas; (args[0])
        :param translation: [int, *,]: ASTNoDes (args[1]
        :return: Returns all type child nodes, e.g. [int,*]
        """
        for defi in self.typedefs:
            if args[1] != []:  # Found a translation, we may stop now
                return
            if defi.children[2].text == args[0]:
                args[1] += defi.children[1].children

    def existsLocally(self, type_name: str):
        """
        indicates if a typedef translation exists within this table
        :param type_name:
        :return:
        """

        for d_node in self.typedefs:
            defined_type = d_node.getChild(2).text
            if type_name == defined_type:
                return True, d_node

        return False, None

    @staticmethod
    def getNodeString(node: ASTNode):
        """
        goes through all the terminal children and make 1 long string
        :param node: the parent node
        :return: string of terminals
        """
        out = ""

        for c in node.children:
            if not isinstance(c, ASTNodeTerminal):
                continue

            out += c.text

        return out