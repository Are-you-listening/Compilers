; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/10_variables/10_variables.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;  INT main ( ) { INT d ;
  %".5" = alloca float, align 4
  store float 0x4014000000000000, float* %".5", align 4
  ; FLOAT a = 5.0 ;
  %".8" = alloca i32, align 4
  store i32 5, i32* %".8", align 4
  ; INT b = 5 ;
  %".11" = alloca i8, align 1
  store i8 101, i8* %".11", align 1
  ; CHAR c = 'e' ;
  store float 0x4014000000000000, float* %".5", align 4
  ; a = 5 ;
  ret i32 0
  ;  return 0 ;
}
