cd ../../
python3 -m src.main --input ./example_source_files/includes/includes.c --target_llvm ./example_source_files/includes/includes_.ll --fold True --render_ast ./example_source_files/includes/includes_ast.dot --render_symb ./example_source_files/includes/includes_table.dot --target_control_flow ./example_source_files/includes/includes_cfg.dot