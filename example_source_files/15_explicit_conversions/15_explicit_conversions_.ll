; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/15_explicit_conversions/15_explicit_conversions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 10, i32* %".3", align 4
  ;  INT main ( ) { INT a = 10 ;
  %".6" = alloca i8, align 1
  store i8 10, i8* %".6", align 1
  ; CHAR c = ( CHAR ) a ;
  %".9" = alloca float, align 4
  store float 0x4024000000000000, float* %".9", align 4
  ; FLOAT b = ( FLOAT ) c ;
  ; FLOAT * d = ( FLOAT * ) c ;
  %".13" = load i8, i8* %".6", align 1
  %".14" = inttoptr i8 %".13" to float*
  %".15" = alloca float*, align 4
  store float* %".14", float** %".15", align 4
  ret i32 0
  ; return 0 ;
}
