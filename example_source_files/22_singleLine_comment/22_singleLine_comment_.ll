; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/22_singleLine_comment/22_singleLine_comment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; // global comment
  ret i32 0
  ;   INT main ( ) {  return 0 ;
  ; // inside main
  ; // another global comment
}
