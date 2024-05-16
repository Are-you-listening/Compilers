; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/32_suppport_scopes_in_symbol_table/32_suppport_scopes_in_symbol_table.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;  INT main ( ) { INT x = 1 ;
  %".6" = alloca i32, align 4
  store i32 2, i32* %".6", align 4
  ; INT y = 2 ;
  %".9" = load i32, i32* %".3", align 4
  ; if ( x == y )
  %".11" = load i32, i32* %".6", align 4
  %".12" = icmp eq i32 %".9", %".11"
  br i1 %".12", label %".13", label %".16"
.13:
  %".14" = alloca i8, align 1
  ; { CHAR z ;
  br label %".19"
.16:
  %".17" = alloca i32, align 4
  ; } else { INT z ;
  br label %".19"
.19:
  ret i32 0
  ; } return 0 ;
}
