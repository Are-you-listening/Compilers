; ModuleID = "tests/test14.c"
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
  ; x i = 1
  %".13" = sext i32 %".11" to i64
  %".14" = getelementptr inbounds [22 x i32], [22 x i32]* %".4", i64 0, i64 %".13"
  store i32 1, i32* %".14", align 4
  %".16" = getelementptr inbounds [22 x i32], [22 x i32]* %".4", i64 0, i32 1
  ; printf "%d" x 1
  %".18" = load i32, i32* %".16", align 4
  %".19" = bitcast [3 x i8]* @".str.0" to i8*
  %".20" = alloca i32
  store i32 %".18", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
