cd ../../
python3 -m src.main --input ./example_source_files/22_singleLine_comment/22_singleLine_comment.c --target_llvm ./example_source_files/22_singleLine_comment/22_singleLine_comment_.ll --target_mips ./example_source_files/22_singleLine_comment/22_singleLine_comment_.asm --fold True --render_ast ./example_source_files/22_singleLine_comment/22_singleLine_comment_ast.dot --render_symb ./example_source_files/22_singleLine_comment/22_singleLine_comment_table.dot --target_control_flow ./example_source_files/22_singleLine_comment/22_singleLine_comment_cfg.dot --unused_var False
 spim -file ./example_source_files/22_singleLine_comment/22_singleLine_comment_.asm