; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/27_if_else/27_if_else.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;    INT main ( ) {  INT a = 1 ;
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1 ;
  store i32 1, i32* %".3", align 4
  ;  a = 1 ;
  store i32 0, i32* %".6", align 4
  ; b = 0 ;
  ;  if ( b ) {
  %".14" = load i32, i32* %".6", align 4
  %".15" = icmp ne i32 %".14", 0
  br i1 %".15", label %".16", label %".20"
.16:
  %".17" = alloca i32, align 4
  store i32 0, i32* %".17", align 4
  ; INT x = 0 ;
  br label %".24"
.20:
  %".21" = alloca i32, align 4
  store i32 1, i32* %".21", align 4
  ; } else { INT x = 1 ;
  br label %".24"
.24:
  %".25" = load i32, i32* %".6", align 4
  ; }  if ( 0 ) { INT y = 0 ; } else if ( ! b ) {
  %".27" = icmp ne i32 %".25", 0
  %".28" = xor i1 %".27", 1
  %".29" = alloca i32, align 4
  store i32 1, i32* %".29", align 4
  ; INT y = 1 ;
  ret i32 0
  ; }  return 0 ;
}
