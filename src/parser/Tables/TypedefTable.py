from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolTypePtr import *
from src.parser.AST import *
from src.parser.ASTTypedefReplacer import *
from typing import Dict
from src.parser.Tables.AbstractTable import *


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
