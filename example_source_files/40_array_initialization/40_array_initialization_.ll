; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/40_array_initialization/40_array_initialization.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca [5 x i32], align 32
  ;    INT main ( ) { INT c [ 5 ] = { 1 , 2 , 3 , 4 , 5 } ;
  %".5" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 4
  store i32 5, i32* %".5", align 4
  %".7" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 3
  store i32 4, i32* %".7", align 4
  %".9" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 2
  store i32 3, i32* %".9", align 4
  %".11" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 1
  store i32 2, i32* %".11", align 4
  %".13" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 0
  store i32 1, i32* %".13", align 4
  %".15" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 1
  ; c [ 1 ] = 0 ;
  store i32 0, i32* %".15", align 4
  ret i32 0
  ; return 0 ;
}