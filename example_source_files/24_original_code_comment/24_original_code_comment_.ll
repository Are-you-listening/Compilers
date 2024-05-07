; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/24_original_code_comment/24_original_code_comment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca [3 x i32], align 16
  ;  INT main ( ) { INT x = 4 ; INT y = x ; INT array [ 3 ] = { 1 , 2 , 3 } ;
  %".5" = getelementptr inbounds [3 x i32], [3 x i32]* %".3", i64 0, i32 2
  store i32 3, i32* %".5", align 4
  %".7" = getelementptr inbounds [3 x i32], [3 x i32]* %".3", i64 0, i32 1
  store i32 2, i32* %".7", align 4
  %".9" = getelementptr inbounds [3 x i32], [3 x i32]* %".3", i64 0, i32 0
  store i32 1, i32* %".9", align 4
  ret i32 0
  ; return 0 ;
}
