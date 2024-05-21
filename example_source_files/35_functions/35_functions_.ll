; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/35_functions/35_functions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"factorial"(i32 %".1")
{
.3:
  %".4" = alloca i32
  %".5" = alloca i32
  store i32 %".1", i32* %".5"
  %".7" = load i32, i32* %".5"
  ; }  INT factorial ( INT n ) { if ( n == 0 ) {
  %".9" = icmp eq i32 %".7", 0
  br i1 %".9", label %".10", label %".13"
.10:
  ret i32 1
  ; return 1 ;
.13:
  %".14" = load i32, i32* %".5"
  ; } else { return n * factorial ( n - 1 ) ;
  %".16" = load i32, i32* %".5"
  %".17" = sub i32 %".16", 1
  %".18" = call i32 @"factorial"(i32 %".17")
  %".19" = mul i32 %".14", %".18"
  ret i32 %".19"
}

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;    INT factorial ( INT c ) ;  INT main ( ) { INT n = 5 ;
  ; INT fact = factorial ( n ) ;
  %".7" = call i32 @"factorial"(i32 5)
  %".8" = alloca i32, align 4
  store i32 %".7", i32* %".8", align 4
  ret i32 0
  ; return 0 ;
}
