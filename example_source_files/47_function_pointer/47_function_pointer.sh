cd ../../
python3 -m src.main --input ./example_source_files/47_function_pointer/47_function_pointer.c --target_llvm ./example_source_files/47_function_pointer/47_function_pointer_.ll --target_mips ./example_source_files/47_function_pointer/47_function_pointer_.asm --fold True --render_ast ./example_source_files/47_function_pointer/47_function_pointer_ast.dot --render_symb ./example_source_files/47_function_pointer/47_function_pointer_table.dot --target_control_flow ./example_source_files/47_function_pointer/47_function_pointer_cfg.dot --unused_var False
 spim -file ./example_source_files/47_function_pointer/47_function_pointer_.asm