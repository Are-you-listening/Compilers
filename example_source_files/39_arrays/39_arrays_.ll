; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/39_arrays/39_arrays.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;    INT main ( ) { INT q = 5 ;
  %".6" = alloca [10 x i8], align 64
  ; CHAR y [ 10 ] ;
  %".8" = getelementptr inbounds [10 x i8], [10 x i8]* %".6", i64 0, i32 5
  ; y [ 5 ] = 'a' ;
  store i8 97, i8* %".8", align 4
  %".11" = alloca [2 x [3 x i32]], align 32
  ; INT x [ 2 ] [ 3 ] ;
  %".13" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".11", i64 0, i32 1
  ;  x [ 1 ] [ 2 ] = 1 ;
  %".15" = getelementptr inbounds [3 x i32], [3 x i32]* %".13", i64 0, i32 2
  store i32 1, i32* %".15", align 4
  ret i32 0
  ; return 0 ;
}
