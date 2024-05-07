; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/17_increment_decrement/17_increment_decrement.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;  INT main ( ) { INT b = 1 ;
  %".6" = load i32, i32* %".3", align 4
  ; b ++ ;
  %".8" = add i32 %".6", 1
  store i32 %".8", i32* %".3", align 4
  ret i32 0
  ; return 0 ;
}
