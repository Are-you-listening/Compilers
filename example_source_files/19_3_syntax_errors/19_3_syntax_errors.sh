cd ../../
python3 -m src.main --input ./example_source_files/19_3_syntax_errors/19_3_syntax_errors.c --target_llvm ./example_source_files/19_3_syntax_errors/19_3_syntax_errors_.ll --target_mips ./example_source_files/19_3_syntax_errors/19_3_syntax_errors_.asm --fold True --render_ast ./example_source_files/19_3_syntax_errors/19_3_syntax_errors_ast.dot --render_symb ./example_source_files/19_3_syntax_errors/19_3_syntax_errors_table.dot --target_control_flow ./example_source_files/19_3_syntax_errors/19_3_syntax_errors_cfg.dot --unused_var False