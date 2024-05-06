; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/35_functions/35_functions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"factorial"(i32 %".1")
{
.3:
  %".4" = alloca i32
  store i32 %".1", i32* %".4"
  %".6" = load i32, i32* %".4"
  ; }  INT factorial ( INT n ) { if ( n == 0 ) {
  %".8" = icmp eq i32 %".6", 0
  br i1 %".8", label %".9", label %".12"
.9:
  ret i32 1
  ; return 1 ;
.12:
  %".13" = load i32, i32* %".4"
  ; } else { return n * factorial ( n - 1 ) ;
  %".15" = load i32, i32* %".4"
  %".16" = sub i32 %".15", 1
  %".17" = call i32 @"factorial"(i32 %".16")
  %".18" = mul i32 %".13", %".17"
  ret i32 %".18"
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
