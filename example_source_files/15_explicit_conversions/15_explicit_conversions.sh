cd ../../
python3 -m src.main --input ./example_source_files/15_explicit_conversions/15_explicit_conversions.c --target_llvm ./example_source_files/15_explicit_conversions/15_explicit_conversions_.ll --fold True --render_ast ./example_source_files/15_explicit_conversions/15_explicit_conversions_ast.dot --render_symb ./example_source_files/15_explicit_conversions/15_explicit_conversions_table.dot --target_control_flow ./example_source_files/15_explicit_conversions/15_explicit_conversions_cfg.dot --unused_var False