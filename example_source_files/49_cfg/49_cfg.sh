cd ../../
python3 -m src.main --input ./example_source_files/49_cfg/49_cfg.c --target_llvm ./example_source_files/49_cfg/49_cfg_.ll --target_mips ./example_source_files/49_cfg/49_cfg_.asm --fold True --render_ast ./example_source_files/49_cfg/49_cfg_ast.dot --render_symb ./example_source_files/49_cfg/49_cfg_table.dot --target_control_flow ./example_source_files/49_cfg/49_cfg_cfg.dot --unused_var False