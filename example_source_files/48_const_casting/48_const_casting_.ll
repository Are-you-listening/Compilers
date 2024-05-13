; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/48_const_casting/48_const_casting.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;    INT main ( ) { const INT n = 5 ;
  %".6" = alloca i32*, align 8
  store i32* %".3", i32** %".6", align 8
  ; INT * n_ptr = & n ;
  %".9" = load i32*, i32** %".6", align 8
  ; * n_ptr = 7 ;
  store i32 7, i32* %".9", align 8
  ret i32 0
  ; return 0 ;
}
