cd ../../
python3 -m src.main --input ./example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization.c --target_llvm ./example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization_.ll --target_mips ./example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization_.asm --fold True --render_ast ./example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization_ast.dot --render_symb ./example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization_table.dot --target_control_flow ./example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization_cfg.dot --unused_var False