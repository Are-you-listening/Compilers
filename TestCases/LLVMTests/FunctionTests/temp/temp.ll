; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"func"(i32 %".1", i32 %".2")
{
.4:
  %".5" = alloca i32
  %".6" = alloca i32
  %".7" = alloca i32
  store i32 %".1", i32* %".7"
  %".9" = alloca i32
  store i32 %".2", i32* %".9"
  %".11" = load i32, i32* %".7"
  ; }     INT func ( INT a , INT b ) { return a + b ;
  %".13" = load i32, i32* %".9"
  %".14" = add i32 %".11", %".13"
  ret i32 %".14"
}

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;    INT func ( INT a , INT b ) ;  INT main ( ) { INT y = 5 ;
  %".6" = alloca i32, align 4
  ; INT u = 10 ; INT c ;
  ; c = func ( y , u ) ;
  %".9" = call i32 @"func"(i32 5, i32 10)
  store i32 %".9", i32* %".6", align 4
  %".11" = load i32, i32* %".6", align 4
  ; printf ( "%d\n" , c ) ;
  %".13" = bitcast [4 x i8]* @".str.0" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = load i32, i32* %".3", align 4
  ; return y ;
  ret i32 %".18"
}

@".str.0" = internal constant [4 x i8] c"%d\0a\00"
declare i32 @"printf"(i8* %".1", ...)
