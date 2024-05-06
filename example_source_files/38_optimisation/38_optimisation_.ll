; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/38_optimisation/38_optimisation.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  br label %".3"
.3:
  ;  INT main ( ) {  while ( 1 ) {
  br label %".5"
.5:
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT a = 0 ;
  %".9" = load i32, i32* %".6", align 4
  ; if ( a % 2 == 1 ) {
  %".11" = srem i32 %".9", 2
  %".12" = icmp eq i32 %".11", 1
  br i1 %".12", label %".13", label %".15"
.13:
  ; continue ;
  br label %".3"
.15:
  %".16" = load i32, i32* %".6", align 4
  ; INT c = 0 ; } if ( a > 10 ) {
  %".18" = icmp sgt i32 %".16", 10
  br i1 %".18", label %".19", label %".21"
.19:
  ; break ;
  br label %".26"
.21:
  %".22" = load i32, i32* %".6", align 4
  ; INT g = 0 ; }  a ++ ;
  %".24" = add i32 %".22", 1
  store i32 %".24", i32* %".6", align 4
  br label %".3"
.26:
  ret i32 0
  ;  } return 0 ;
}
