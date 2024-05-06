; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ;    INT main ( ) {  if ( 1 ) { INT b = 0 ;
  %".6" = load i32, i32* %".3", align 4
  ; printf ( "%d" , b ) ;
  %".8" = bitcast [3 x i8]* @".str.0" to i8*
  %".9" = alloca i32
  store i32 %".6", i32* %".9"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  ret i32 0
  ; }  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
