; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/39_arrays/39_arrays.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca [10 x i8], align 16
  ;    INT main ( ) { INT q = 5 ; CHAR y [ 10 ] ;
  %".5" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 5
  ; y [ 5 ] = 'a' ;
  store i8 97, i8* %".5", align 4
  %".8" = alloca [2 x [3 x i32]], align 32
  ; INT x [ 2 ] [ 3 ] ;
  %".10" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".8", i64 0, i32 1
  ;  x [ 1 ] [ 2 ] = 1 ;
  %".12" = getelementptr inbounds [3 x i32], [3 x i32]* %".10", i64 0, i32 2
  store i32 1, i32* %".12", align 4
  ret i32 0
  ; return 0 ;
}
