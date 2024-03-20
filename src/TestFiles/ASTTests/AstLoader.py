import json
from src.parser.AST import *
from src.parser.Tables.SymbolTable import *
from typing import List

class AstLoader:
    """
    this class will make it possible to convert a json into an ast (for testing)
    """
    @staticmethod
    def load(data: json):
        pass

    @staticmethod
    def store(ast: AST):

        ast_node: ASTNode = ast.root

        ast_tree = {}
        ast_node_list = []
        symbol_tables = []
        ast_to_id_map = {}

        AstLoader.__make_dict(ast_node, ast_node_list, ast_tree, symbol_tables, ast_to_id_map)
        symbol_tables_json = AstLoader.__make_json_symbol_table(symbol_tables, ast_to_id_map)
        json_file = json.dumps({"ast": ast_tree, "symbol_tables": symbol_tables_json})
        return json_file

    @staticmethod
    def __make_dict(ast_node: ASTNode, ast_node_list: list, ast_tree: dict, symbol_tables: list, ast_to_id_map):

        ast_dict = {}
        ast_dict["text"] = ast_node.text

        ast_dict["linenr"] = ast_node.linenr

        symbol_table = ast_node.getSymbolTable()
        if symbol_table in symbol_tables:
            index = symbol_tables.index(symbol_table)
        else:
            symbol_tables.append(symbol_table)
            index = len(symbol_tables)-1

        ast_dict["symbol-table_nr"] = index

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
                symbol_entry_dict = {}
                symbol_entry_dict["fitype"] = symbol_entry.fitype
                symbol_entry_dict["type"] = symbol_entry.getPtrTuple()
                symbol_entry_dict["name"] = symbol_entry.name
                symbol_entry_dict["const"] = symbol_entry.const
                symbol_entry_dict["value"] = symbol_entry.value

                symbol_entry_dict["firstDeclared"] = ast_to_id_map.get(symbol_entry.firstDeclared)
                symbol_entry_dict["firstUsed"] = symbol_entry.firstUsed
                symbol_entries.append(symbol_entry_dict)

            if symbol_table.prev is None:
                prev = None
            else:
                prev = symbol_tables.index(symbol_table.prev)

            symbol_results.append({"prev": prev, "entries": symbol_entries})

        return symbol_results
