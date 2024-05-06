; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/28_loops/28_loops.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ;    INT main ( ) { INT a = 0 ;
  %".6" = alloca i32, align 4
  ; INT i ;
  store i32 0, i32* %".6", align 4
  ; for ( i = 0 ; i < 5 ; i ++ ) {
  br label %".10"
.10:
  %".11" = load i32, i32* %".6", align 4
  %".12" = icmp slt i32 %".11", 5
  br i1 %".12", label %".13", label %".21"
.13:
  %".14" = load i32, i32* %".6", align 4
  ; INT b = i ;
  %".16" = alloca i32, align 4
  store i32 %".14", i32* %".16", align 4
  %".18" = load i32, i32* %".6", align 4
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %".6", align 4
  br label %".10"
.21:
  br label %".22"
.22:
  ; }  while ( a < 2 ) {
  %".24" = load i32, i32* %".3", align 4
  %".25" = icmp slt i32 %".24", 2
  br i1 %".25", label %".26", label %".31"
.26:
  %".27" = load i32, i32* %".3", align 4
  ; a ++ ;
  %".29" = add i32 %".27", 1
  store i32 %".29", i32* %".3", align 4
  br label %".22"
.31:
  br label %".32"
.32:
  ; continue ; } while ( 1 ) {
  br label %".34"
.34:
  ; break ;
  br label %".36"
.36:
  ret i32 0
  ; } return 0 ;
}
