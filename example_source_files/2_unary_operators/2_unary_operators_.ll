; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/2_unary_operators/2_unary_operators.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 6, i32* %".3", align 4
  ;   INT main ( ) {  INT a = 6 ;
  store i32 6, i32* %".3", align 4
  ; a = 6 ;
  %".8" = load i32, i32* %".3", align 4
  ;  INT b = + a ;
  %".10" = alloca i32, align 4
  store i32 %".8", i32* %".10", align 4
  %".12" = load i32, i32* %".3", align 4
  ; b = - a ;
  %".14" = sub i32 0, %".12"
  store i32 %".14", i32* %".10", align 4
  ret i32 0
  ;  return 0 ;
}
