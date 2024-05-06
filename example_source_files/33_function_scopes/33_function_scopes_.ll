; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/33_function_scopes/33_function_scopes.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define void @"otherFunc"()
{
.2:
  %".3" = alloca i8, align 1
  ;  VOID otherFunc ( ) { CHAR x ;
  ret void
}

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ; }   INT main ( ) { INT x ;
  ret i32 0
  ; return 0 ;
}
