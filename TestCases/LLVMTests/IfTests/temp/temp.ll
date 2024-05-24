; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.0" to i8*
  %".4" = alloca i32
  store i32 0, i32* %".4"
  %".6" = load i32, i32* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  ;    INT main ( ) {  if ( 1 ) { INT b = 0 ; printf ( "%d" , b ) ;
  ret i32 0
  ; }  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
