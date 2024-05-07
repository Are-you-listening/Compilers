; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/33_function_scopes/33_function_scopes.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define void @"otherFunc"()
{
.2:
  ret void
  ;  VOID otherFunc ( ) { CHAR x ;
}

define i32 @"main"()
{
.2:
  ret i32 0
  ; }   INT main ( ) { INT x ; return 0 ;
}
