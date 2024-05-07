; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/3_parenthesis/3_parenthesis.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;   INT main ( ) {  INT a = 5 ;
  store i32 5, i32* %".3", align 4
  ; a = 5 ;
  %".8" = alloca i32, align 4
  store i32 6, i32* %".8", align 4
  ;  INT b = 6 ;
  store i32 6, i32* %".8", align 4
  ; b = 6 ;
  %".13" = alloca i32, align 4
  store i32 3, i32* %".13", align 4
  ;  INT c = 3 ;
  store i32 3, i32* %".13", align 4
  ; c = 3 ;
  ret i32 0
  ;  INT d = ( a + b ) * c ;  return 0 ;
}
