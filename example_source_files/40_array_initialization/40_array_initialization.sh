cd ../../
python3 -m src.main --input ./example_source_files/40_array_initialization/40_array_initialization.c --target_llvm ./example_source_files/40_array_initialization/40_array_initialization_.ll --target_mips ./example_source_files/40_array_initialization/40_array_initialization_.asm --fold True --render_ast ./example_source_files/40_array_initialization/40_array_initialization_ast.dot --render_symb ./example_source_files/40_array_initialization/40_array_initialization_table.dot --target_control_flow ./example_source_files/40_array_initialization/40_array_initialization_cfg.dot --unused_var False
 spim -file ./example_source_files/40_array_initialization/40_array_initialization_.asm