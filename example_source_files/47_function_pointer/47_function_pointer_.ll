; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/47_function_pointer/47_function_pointer.c"
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
  %".3" = alloca i32 (i32)*, align 8
  store i32 (i32)* @"factorial", i32 (i32)** %".3", align 8
  ;    INT factorial ( INT c ) ;  INT main ( ) { INT n = 5 ; INT ( * factorial_ptr ) ( INT ) = & factorial ;
  ret i32 0
  ; INT fact = factorial_ptr ( n ) ; return 0 ;
}
