cd ../../
python3 -m src.main --input ./example_source_files/56_unused_variables/56_unused_variables.c --target_llvm ./example_source_files/56_unused_variables/56_unused_variables_.ll --fold True --render_ast ./example_source_files/56_unused_variables/56_unused_variables_ast.dot --render_symb ./example_source_files/56_unused_variables/56_unused_variables_table.dot --target_control_flow ./example_source_files/56_unused_variables/56_unused_variables_cfg.dot