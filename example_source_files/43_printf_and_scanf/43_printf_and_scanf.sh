cd ../../
python3 -m src.main --input ./example_source_files/43_printf_and_scanf/43_printf_and_scanf.c --target_llvm ./example_source_files/43_printf_and_scanf/43_printf_and_scanf_.ll --target_mips ./example_source_files/43_printf_and_scanf/43_printf_and_scanf_.asm --fold True --render_ast ./example_source_files/43_printf_and_scanf/43_printf_and_scanf_ast.dot --render_symb ./example_source_files/43_printf_and_scanf/43_printf_and_scanf_table.dot --target_control_flow ./example_source_files/43_printf_and_scanf/43_printf_and_scanf_cfg.dot --unused_var False
 spim -file ./example_source_files/43_printf_and_scanf/43_printf_and_scanf_.asm