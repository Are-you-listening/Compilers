; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/36_pre-processor_define/36_pre-processor_define.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;       INT main ( ) { INT x = 1.13 ;
  store i32 2048, i32* %".3", align 4
  ; x = 2048 ;
  ret i32 0
  ; return 0 ;
}
