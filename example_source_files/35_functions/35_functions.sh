cd ../../
python3 -m src.main --input ./example_source_files/35_functions/35_functions.c --target_llvm ./example_source_files/35_functions/35_functions_.ll --fold True --render_ast ./example_source_files/35_functions/35_functions_ast.dot --render_symb ./example_source_files/35_functions/35_functions_table.dot --target_control_flow ./example_source_files/35_functions/35_functions_cfg.dot