cd ../../
python3 -m src.main --input ./example_source_files/6_main/6_main.c --target_llvm ./example_source_files/6_main/6_main_.ll --fold True --render_ast ./example_source_files/6_main/6_main_ast.dot --render_symb ./example_source_files/6_main/6_main_table.dot --target_control_flow ./example_source_files/6_main/6_main_cfg.dot