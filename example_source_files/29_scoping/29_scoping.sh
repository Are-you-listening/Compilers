cd ../../
python3 -m src.main --input ./example_source_files/29_scoping/29_scoping.c --target_llvm ./example_source_files/29_scoping/29_scoping_.ll --fold True --render_ast ./example_source_files/29_scoping/29_scoping_ast.dot --render_symb ./example_source_files/29_scoping/29_scoping_table.dot --target_control_flow ./example_source_files/29_scoping/29_scoping_cfg.dot --unused_var False