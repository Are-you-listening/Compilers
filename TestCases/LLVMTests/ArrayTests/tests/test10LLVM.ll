; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [2 x [2 x i8]], align 8
  ;  CHAR x 2 2
  %".6" = getelementptr inbounds [2 x [2 x i8]], [2 x [2 x i8]]* %".4", i64 0, i32 1
  ;  x 1 1 = 110
  %".8" = getelementptr inbounds [2 x i8], [2 x i8]* %".6", i64 0, i32 1
  store i8 110, i8* %".8", align 4
  %".10" = getelementptr inbounds [2 x [2 x i8]], [2 x [2 x i8]]* %".4", i64 0, i32 1
  ; printf "%c" x 1 1
  %".12" = getelementptr inbounds [2 x i8], [2 x i8]* %".10", i64 0, i32 1
  %".13" = load i8, i8* %".12", align 4
  %".14" = bitcast [3 x i8]* @".str.0" to i8*
  %".15" = alloca i8
  store i8 %".13", i8* %".15"
  %".17" = load i8, i8* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i8 %".17")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%c\00"
declare i32 @"printf"(i8* %".1", ...)
