; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/27_if_else/27_if_else.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;    INT main ( ) {  INT a = 1 ; INT b = 1 ;
  store i32 0, i32* %".3", align 4
  ;  a = 1 ; b = 0 ;
  ;  if ( b ) {
  %".9" = load i32, i32* %".3", align 4
  %".10" = icmp ne i32 %".9", 0
  br i1 %".10", label %".11", label %".13"
.11:
  ; INT x = 0 ;
  br label %".15"
.13:
  ; } else { INT x = 1 ;
  br label %".15"
.15:
  %".16" = load i32, i32* %".3", align 4
  ; }  if ( 0 ) { INT y = 0 ; } else if ( ! b ) {
  %".18" = icmp ne i32 %".16", 0
  %".19" = xor i1 %".18", 1
  ; INT y = 1 ;
  ret i32 0
  ; }  return 0 ;
}
