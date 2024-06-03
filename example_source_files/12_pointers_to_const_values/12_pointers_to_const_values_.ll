; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/12_pointers_to_const_values/12_pointers_to_const_values.c"
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
  ; const INT b = 5 ;
  %".9" = alloca i8, align 1
  store i8 101, i8* %".9", align 1
  ; CHAR c = 'e' ;
  %".12" = alloca float*, align 4
  store float* %".3", float** %".12", align 4
  ; FLOAT * d = & a ;
  %".15" = alloca i32*, align 4
  store i32* %".6", i32** %".15", align 4
  ; INT * e = & b ;
  %".18" = alloca i8*, align 4
  store i8* %".9", i8** %".18", align 4
  ; const CHAR * f = & c ;
  %".21" = load i8*, i8** %".18", align 4
  ; f ++ ;
  %".23" = getelementptr inbounds i8, i8* %".21", i64 1
  store i8* %".23", i8** %".18", align 4
  ret i32 0
  ; return 0 ;
}
