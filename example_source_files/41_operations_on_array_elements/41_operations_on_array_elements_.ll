; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/41_operations_on_array_elements/41_operations_on_array_elements.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca [11 x [20 x i32]], align 1024
  ;  INT main ( ) { INT q = 5 ; INT x [ 11 ] [ 20 ] ;
  %".5" = getelementptr inbounds [11 x [20 x i32]], [11 x [20 x i32]]* %".3", i64 0, i32 10
  ;  x [ 10 ] [ 19 ] = 1 + 5 ;
  %".7" = getelementptr inbounds [20 x i32], [20 x i32]* %".5", i64 0, i32 19
  store i32 6, i32* %".7", align 4
  ret i32 0
  ; return 0 ;
}
