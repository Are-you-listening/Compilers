; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/18_constant_propagation/18_constant_propagation.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 3, i32* %".3", align 4
  ;  INT main ( ) { const INT a = 3 ;
  %".6" = alloca i32, align 4
  store i32 3, i32* %".6", align 4
  ; INT b = a ;
  ret i32 0
  ; return 0 ;
}
