; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/11_pointers/11_pointers.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca float, align 4
  store float 0x4014000000000000, float* %".3", align 4
  ;  INT main ( ) { FLOAT a = 5.0 ;
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ; INT b = 5 ;
  %".9" = alloca i8, align 1
  store i8 101, i8* %".9", align 1
  ; CHAR c = 'e' ;
  %".12" = alloca float*, align 8
  store float* %".3", float** %".12", align 8
  ; FLOAT * d = & a ;
  %".15" = alloca i32*, align 8
  store i32* %".6", i32** %".15", align 8
  ; INT * e = & b ;
  %".18" = alloca i8*, align 8
  store i8* %".9", i8** %".18", align 8
  ; CHAR * f = & c ;
  ret i32 0
  ; return 0 ;
}