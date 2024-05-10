; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/34_local_and_global_variables/34_local_and_global_variables.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -20, i32* %".3", align 4
  ;  INT True = 1 ;  INT main ( ) { INT True = - 20 ;
  %".6" = alloca i32, align 4
  store i32 -20, i32* %".6", align 4
  ; INT success = True ;
  ret i32 0
  ; return 0 ;
}

@"True" = global i32 1, align 4