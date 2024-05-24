; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.0" to i8*
  %".4" = alloca i32
  store i32 1, i32* %".4"
  %".6" = load i32, i32* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  ;    INT True = 1 ;  INT main ( ) { INT success = True ;  printf ( "%d" , success ) ;
  %".9" = load i32, i32* @"True", align 4
  ;  printf ( "%d" , True ) ;
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ret i32 0
  ;  return 0 ;
}

@"True" = global i32 1, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
