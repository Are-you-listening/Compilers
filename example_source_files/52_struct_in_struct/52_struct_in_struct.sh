cd ../../
python3 -m src.main --input ./example_source_files/52_struct_in_struct/52_struct_in_struct.c --target_llvm ./example_source_files/52_struct_in_struct/52_struct_in_struct_.ll --fold True --render_ast ./example_source_files/52_struct_in_struct/52_struct_in_struct_ast.dot --render_symb ./example_source_files/52_struct_in_struct/52_struct_in_struct_table.dot --target_control_flow ./example_source_files/52_struct_in_struct/52_struct_in_struct_cfg.dot