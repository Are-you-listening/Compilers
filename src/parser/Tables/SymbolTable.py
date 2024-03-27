from src.parser.ErrorExporter import *
from src.parser.Tables.SymbolTypePtr import *
from src.parser.AST import *
from src.parser.ASTTypedefReplacer import *
from typing import Dict


class SymbolEntry:
    def __init__(self, fitype: str, datatype: SymbolType, name: str, value, first_declared, first_used):
        self.fitype = fitype
        self.typeObject = datatype
        self.name = name
        self.value = value
        self.firstDeclared = first_declared  # The node this Entry is first declared
        self.firstUsed = first_used  # The node this Entry is first used

    def __str__(self):
        return f"""fi type: {self.fitype} 
                   type: {self.typeObject} 
                   name: {self.name}
                   const: {self.isConst()}
                   value: {self.value}
                   first declared: {self.firstDeclared}
                   first used: {self.firstUsed})"""

    def isConst(self):
        return self.typeObject.isConst()

    def getType(self):
        return self.typeObject.getType()

    def getTypeObject(self):
        return self.typeObject

    def getValue(self):
        return self.value

    def getPtrTuple(self):
        """
        returns a tuple: (type, amount of * depending on how many ptrs there are in the chain)
        """
        ptr_string = ""
        d_t = self.typeObject
        while isinstance(d_t, SymbolTypePtr):
            ptr_string += "*"
            d_t = d_t.deReference()

        return d_t.getType(), ptr_string


class SymbolTable:
    def __init__(self, prev):
        """
        Init a symbol table
        :param prev: a ptr to the prev symbol table we need to point to
        """
        self.symbols: Dict[str, SymbolEntry] = {}
        self.prev: "SymbolTable" = prev
        self.next = []
        self.typedefs = []  # List of TypeDef-Subtrees (These are not present anymore in the AST)
        self.translation = []  # Helper variable

    def add(self, entry: SymbolEntry):
        """
        Add a symbol entry to the symbol table
        :param entry: the entry we want to add
        :return:
        """
        if self.symbols.get(entry.name) is not None:
            ErrorExporter.redefinition(entry.firstDeclared.linenr, entry.getType(),
                                       entry.name)  # This allows earlier detection of errors but unsure how we would
            # retrieve the lineNr
            return

        self.symbols[entry.name] = entry

    def remove(self, symbol: SymbolEntry):
        self.symbols.pop(symbol.name)

    def getEntry(self, name):
        """
        Get entry
        :param name: name of the entry
        :return:
        """
        if name in self.symbols.keys():
            return self.symbols.get(name)
        else:
            if self.prev is not None:
                return self.prev.getEntry(name)
            return

    def __str__(self):
        rep_string = ""
        for entry in self.symbols.values():
            rep_string += f"{str(entry)}\n"
        rep_string += f"self.symbols"

    def traverse(self, function, up: bool, args: list, do_print=False):
        """
        :param do_print: bool indication whether to print or not
        :param function: function to execute
        :param up: go up or down the list
        :return:
        """

        if do_print:
            print(self)

        function(self, args[0], args[1])


        if up:
            if self.prev is None:
                return
            self.prev.traverse(function, up, args, do_print)
        else:
            for child in self.next:
                child.traverse(function, up,args, do_print)

    def nextTable(self, next_table: "SymbolTable"):
        """Add a new table as child"""
        self.next.append(next_table)

    def exists(self, entry_name: str):
        """
        Check if a given symbolEntry already exists in the scope
        :param entry_name: the name of an entry of the symbol table
        :return:
        """
        return self.getEntry(entry_name) is not None

    def entryExists(self, entry_name: str):
        """
        Check if a given symbolEntry already exists in the current table
        :param entry_name:the name of an entry of the symbol table
        :return:
        """
        if self.symbols.get(entry_name) is None:
            return False
        return True

    def accept(self, v):
        v.visitSym(self)

    def addTypeDef(self, node: ASTNode):
        """
        Adds a new typedef and already tries to translate it to the main type
        :param node: The subtree containing the typedef
        :return:
        """
        while ASTTypedefReplacer.containsNonBaseType(node.children[1].children):  # Check if the typedef is of the form "typedef beer appel;"
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
        args = (identifier,translation)
        self.traverse( lambda x, a, b: x.getTranslation(a, b), True, args)
        node.typedefReplaceChildren(translation, index)

    def getTranslation(self, identifier: str, translation, done=False):
        """
        :param done: Indicating if we found something and may stop traversing
        :param identifier: kaas in e.g. typedef int* kaas;
        :return: Returns all type child nodes, e.g. [int,*]
        """
        for defi in self.typedefs:
            if done:
                return
            if defi.children[2].text == identifier:
                translation += defi.children[1].children
                done = True

    def clearTypeDefs(self):
        self.typedefs.clear()
