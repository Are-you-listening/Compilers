; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT q = 5
  %".7" = alloca [2 x [3 x i32]], align 8
  ; INT x [2][3]
  %".9" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".7", i64 0, i32 1
  ;  x [1][2] = 1
  %".11" = getelementptr inbounds [3 x i32], [3 x i32]* %".9", i64 0, i32 2
  store i32 1, i32* %".11", align 4
  %".13" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".7", i64 0, i32 1
  ; printf "%d" x [1][2]
  %".15" = getelementptr inbounds [3 x i32], [3 x i32]* %".13", i64 0, i32 2
  %".16" = load i32, i32* %".15", align 4
  %".17" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".18" = alloca i32
  store i32 %".16", i32* %".18"
  %".20" = load i32, i32* %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".20")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"