; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [22 x i32], align 8
  ; INT x 22
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ;  INT i = 1
  store i32 1, i32* %".6", align 4
  ; i = 1
  %".11" = load i32, i32* %".6", align 4
  ; x i + 2 = 1
  %".13" = add i32 %".11", 2
  %".14" = sext i32 %".13" to i64
  %".15" = getelementptr inbounds [22 x i32], [22 x i32]* %".4", i64 0, i64 %".14"
  store i32 1, i32* %".15", align 4
  %".17" = getelementptr inbounds [22 x i32], [22 x i32]* %".4", i64 0, i32 3
  ; printf "%d" x 3
  %".19" = load i32, i32* %".17", align 4
  %".20" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".21" = alloca i32
  store i32 %".19", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"