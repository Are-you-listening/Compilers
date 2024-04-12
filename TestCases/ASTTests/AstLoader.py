import json
from src.parser.Tables.SymbolTable import *
from typing import List
from src.llvm_target.ControlFlow.ControlFlowGraph import Vertex

class AstLoader:
    """
    this class will make it possible to convert a json into an ast (for testing)
    """
    @staticmethod
    def load(data: json):
        data = json.loads(data)
        ast_tree = data["ast"]
        ast_node_list = data["ast_table"]
        symbol_tables = data["symbol_tables"]

        map_id_to_node = {}

        ast_root = AstLoader.__loadAst(ast_tree, ast_node_list, None, map_id_to_node)
        symbol_tables = AstLoader.__load_symbol_table(symbol_tables, map_id_to_node)
        AstLoader.__setupSymbolTablesRight(symbol_tables, ast_root)
        ast = AST(ast_root)
        return ast

    @staticmethod
    def __load_symbol_table(symbol_tables, map_id_to_node):
        output_symbol_tables = []
        for symbol_table in symbol_tables:
            prev_id = symbol_table["prev"]
            if prev_id is not None:
                prev = output_symbol_tables[prev_id]
            else:
                prev = None

            symbol_table_real = SymbolTable(prev)

            output_symbol_tables.append(symbol_table_real)

            for entry in symbol_table["entries"]:
                type_tup = entry["type"]
                base_type, ptrs, const_list = type_tup
                symbol_type = SymbolType(base_type, const_list[0])

                for i in range(len(ptrs)):
                    const_list = const_list[1:]
                    symbol_type = SymbolTypePtr(symbol_type, const_list[0])

                symbol_table_entry = SymbolEntry(symbol_type, entry["name"], map_id_to_node.get(entry["value"], None), map_id_to_node.get(entry["firstDeclared"]), map_id_to_node.get(entry["firstUsed"]))
                symbol_table_real.add(symbol_table_entry)

                ref = entry.get("reference")
                if ref is not None:
                    symbol_table_entry.referenced = ref

        return output_symbol_tables

    @staticmethod
    def __loadAst(ast_tree, ast_node_list, parent, map_id_to_node):

        ast_node_entry = ast_node_list[ast_tree["id"]]
        text = ast_node_entry["text"]

        """
        currently storing symbol table index which is a bit hacky
        """

        if "type" in ast_node_entry:
            ast_node = ASTNodeTerminal(text, parent, ast_node_entry["symbol_table_nr"], ast_node_entry["type"],
                                       ast_node_entry["linenr"])

        elif "is_block" in ast_node_entry and ast_node_entry["is_block"]:
            ast_node = ASTNodeBlock(text, parent, ast_node_entry["symbol_table_nr"], ast_node_entry["linenr"], Vertex(None))

        else:
            ast_node = ASTNode(text, parent, ast_node_entry["symbol_table_nr"], ast_node_entry["linenr"])

        map_id_to_node[ast_tree["id"]] = ast_node

        for child in ast_tree["children"]:
            child_entry = AstLoader.__loadAst(child, ast_node_list, ast_node, map_id_to_node)
            ast_node.addChildren(child_entry)

        return ast_node

    @staticmethod
    def __setupSymbolTablesRight(symbol_table, ast_node: ASTNode):
        index = ast_node.getSymbolTable()
        ast_node.symbol_table = symbol_table[index]
        for child in ast_node.children:
            AstLoader.__setupSymbolTablesRight(symbol_table, child)

    @staticmethod
    def store(ast: AST):

        ast_node: ASTNode = ast.root

        ast_tree = {}
        ast_node_list = []
        symbol_tables = []
        ast_to_id_map = {}

        AstLoader.__make_dict(ast_node, ast_node_list, ast_tree, symbol_tables, ast_to_id_map)
        symbol_tables_json = AstLoader.__make_json_symbol_table(symbol_tables, ast_to_id_map)
        json_file = json.dumps({"ast": ast_tree, "symbol_tables": symbol_tables_json, "ast_table": ast_node_list})

        return json_file

    @staticmethod
    def __make_dict(ast_node: ASTNode, ast_node_list: list, ast_tree: dict, symbol_tables: list, ast_to_id_map):

        ast_dict = {"text": ast_node.text, "linenr": ast_node.linenr}

        symbol_table = ast_node.getSymbolTable()

        if symbol_table.prev not in symbol_tables and symbol_table.prev is not None:
            symbol_tables.append(symbol_table.prev)

        if symbol_table in symbol_tables:
            index = symbol_tables.index(symbol_table)
        else:
            symbol_tables.append(symbol_table)
            index = len(symbol_tables)-1

        ast_dict["symbol_table_nr"] = index

        if isinstance(ast_node, ASTNodeTerminal):
            ast_dict["type"] = ast_node.type

        if isinstance(ast_node, ASTNodeBlock):
            ast_dict["is_block"] = True

        ast_node_list.append(ast_dict)

        ast_tree["children"] = []
        ast_tree["id"] = len(ast_node_list)-1
        ast_to_id_map[ast_node] = len(ast_node_list)-1
        for child in ast_node.children:
            ast_tree2 = {}
            AstLoader.__make_dict(child, ast_node_list, ast_tree2, symbol_tables,  ast_to_id_map)

            ast_tree["children"].append(ast_tree2)

    @staticmethod
    def __make_json_symbol_table(symbol_tables: List[SymbolTable],  ast_to_id_map):
        symbol_results = []
        for symbol_table in symbol_tables:
            symbol_entries = []
            for keys, symbol_entry in symbol_table.symbols.items():
                symbol_entry_dict = {"fitype": symbol_entry.fitype, "type": symbol_entry.getJsonDataType(),
                                     "name": symbol_entry.name,
                                     "value": ast_to_id_map.get(symbol_entry.value, None),
                                     "firstDeclared": ast_to_id_map.get(symbol_entry.firstDeclared),
                                     "firstUsed": ast_to_id_map.get(symbol_entry.firstUsed)}

                if symbol_entry.referenced:
                    symbol_entry_dict.update({"reference": symbol_entry.referenced})

                symbol_entries.append(symbol_entry_dict)

            if symbol_table.prev is None:
                prev = None
            else:
                if symbol_table.prev in symbol_tables:
                    prev = symbol_tables.index(symbol_table.prev)
                else:
                    prev = None

            symbol_results.append({"prev": prev, "entries": symbol_entries})
        return symbol_results
