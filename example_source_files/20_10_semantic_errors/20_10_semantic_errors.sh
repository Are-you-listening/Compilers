cd ../../
python3 -m src.main --input ./example_source_files/20_10_semantic_errors/20_10_semantic_errors.c --target_llvm ./example_source_files/20_10_semantic_errors/20_10_semantic_errors_.ll --fold True --render_ast ./example_source_files/20_10_semantic_errors/20_10_semantic_errors_ast.dot --render_symb ./example_source_files/20_10_semantic_errors/20_10_semantic_errors_table.dot --target_control_flow ./example_source_files/20_10_semantic_errors/20_10_semantic_errors_cfg.dot