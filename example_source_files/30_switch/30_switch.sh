cd ../../
python3 -m src.main --input ./example_source_files/30_switch/30_switch.c --target_llvm ./example_source_files/30_switch/30_switch_.ll --target_mips ./example_source_files/30_switch/30_switch_.asm --fold True --render_ast ./example_source_files/30_switch/30_switch_ast.dot --render_symb ./example_source_files/30_switch/30_switch_table.dot --target_control_flow ./example_source_files/30_switch/30_switch_cfg.dot --unused_var False