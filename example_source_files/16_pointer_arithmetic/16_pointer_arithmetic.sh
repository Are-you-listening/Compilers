cd ../../
python3 -m src.main --input ./example_source_files/16_pointer_arithmetic/16_pointer_arithmetic.c --target_llvm ./example_source_files/16_pointer_arithmetic/16_pointer_arithmetic_.ll --fold True --render_ast ./example_source_files/16_pointer_arithmetic/16_pointer_arithmetic_ast.dot --render_symb ./example_source_files/16_pointer_arithmetic/16_pointer_arithmetic_table.dot --target_control_flow ./example_source_files/16_pointer_arithmetic/16_pointer_arithmetic_cfg.dot --unused_var False