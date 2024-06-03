; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/23_multiLine_comment/23_multiLine_comment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ret i32 0
  ;  INT main ( ) {      return 0 ;
  ; /*    *    * multiline comment    *    * / */
}
