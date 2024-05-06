; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"d"()
{
.2:
  ret i32 2
  ;    INT d ( ) { return 2 ;
}

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; }  INT main ( ) { INT a = 0 ;
  ; a = d ( ) ;
  %".7" = call i32 @"d"()
  store i32 %".7", i32* %".3", align 4
  %".9" = load i32, i32* %".3", align 4
  ; printf ( "%d" , a ) ;
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
