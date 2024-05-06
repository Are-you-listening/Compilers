; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/24_original_code_comment/24_original_code_comment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 4, i32* %".3", align 4
  ;  INT main ( ) { INT x = 4 ;
  %".6" = alloca i32, align 4
  store i32 4, i32* %".6", align 4
  ; INT y = x ;
  %".9" = alloca [3 x i32], align 16
  ; INT array [ 3 ] = { 1 , 2 , 3 } ;
  %".11" = getelementptr inbounds [3 x i32], [3 x i32]* %".9", i64 0, i32 2
  store i32 3, i32* %".11", align 4
  %".13" = getelementptr inbounds [3 x i32], [3 x i32]* %".9", i64 0, i32 1
  store i32 2, i32* %".13", align 4
  %".15" = getelementptr inbounds [3 x i32], [3 x i32]* %".9", i64 0, i32 0
  store i32 1, i32* %".15", align 4
  ret i32 0
  ; return 0 ;
}
