cd ../../
python3 -m src.main --input ./example_source_files/10_variables/10_variables.c --target_llvm ./example_source_files/10_variables/10_variables_.ll --target_mips ./example_source_files/10_variables/10_variables_.asm --fold True --render_ast ./example_source_files/10_variables/10_variables_ast.dot --render_symb ./example_source_files/10_variables/10_variables_table.dot --target_control_flow ./example_source_files/10_variables/10_variables_cfg.dot --unused_var False