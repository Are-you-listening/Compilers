; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/41_operations_on_array_elements/41_operations_on_array_elements.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;  INT main ( ) { INT q = 5 ;
  %".6" = alloca [11 x [20 x i32]], align 1024
  ; INT x [ 11 ] [ 20 ] ;
  %".8" = getelementptr inbounds [11 x [20 x i32]], [11 x [20 x i32]]* %".6", i64 0, i32 10
  ;  x [ 10 ] [ 19 ] = 1 + 5 ;
  %".10" = getelementptr inbounds [20 x i32], [20 x i32]* %".8", i64 0, i32 19
  store i32 6, i32* %".10", align 4
  ret i32 0
  ; return 0 ;
}
