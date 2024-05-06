; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/21_symbolTable_and_visualization/21_symbolTable_and_visualization.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; /* show symbol table visualization */
  %".4" = alloca i32, align 4
  store i32 3, i32* %".4", align 4
  ;    INT main ( ) { INT x = 3 ;
  %".7" = alloca i32, align 4
  store i32 4, i32* %".7", align 4
  ; { INT y = 4 ;
  %".10" = alloca i32, align 4
  store i32 5, i32* %".10", align 4
  ; { INT x = 5 ;
  ret i32 0
  ; } } return 0 ;
}
