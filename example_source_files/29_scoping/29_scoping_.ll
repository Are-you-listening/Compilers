; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/29_scoping/29_scoping.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ;  INT main ( ) { INT x = 0 ;
  ; { INT x = 1 ; if ( x ) {
  %".7" = icmp ne i32 1, 0
  br i1 %".7", label %".8", label %".10"
.8:
  ; INT x = 2 ;
  br label %".10"
.10:
  br label %".11"
.11:
  ; } } while ( x ) {
  %".13" = load i32, i32* %".3", align 4
  %".14" = icmp ne i32 %".13", 0
  br i1 %".14", label %".15", label %".17"
.15:
  ; continue ;
  br label %".11"
.17:
  ret i32 0
  ; } return 0 ;
}
