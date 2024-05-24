; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/14_implicit_conversions/14_implicit_conversions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 10, i32* %".3", align 4
  ;  INT main ( ) { INT a = 10.2 ;
  %".6" = alloca i8, align 1
  store i8 5, i8* %".6", align 1
  ; CHAR c = 5 ;
  %".9" = alloca float, align 4
  store float 0x4024000000000000, float* %".9", align 4
  ; FLOAT b = 10 ;
  ret i32 0
  ; return 0 ;
}
