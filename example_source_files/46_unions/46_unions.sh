cd ../../
python3 -m src.main --input ./example_source_files/46_unions/46_unions.c --target_llvm ./example_source_files/46_unions/46_unions_.ll --fold True --render_ast ./example_source_files/46_unions/46_unions_ast.dot --render_symb ./example_source_files/46_unions/46_unions_table.dot --target_control_flow ./example_source_files/46_unions/46_unions_cfg.dot --unused_var False