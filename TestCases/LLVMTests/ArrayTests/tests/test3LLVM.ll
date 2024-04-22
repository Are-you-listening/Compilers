; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], align 8
  ; INT x 1 1 1 1 1 1 1 1
  %".6" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %".4", i64 0, i32 0
  ;  x 0 0 0 0 0 0 0 0 = 0
  %".8" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %".6", i64 0, i32 0
  %".9" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %".8", i64 0, i32 0
  %".10" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %".9", i64 0, i32 0
  %".11" = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %".10", i64 0, i32 0
  %".12" = getelementptr inbounds [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %".11", i64 0, i32 0
  %".13" = getelementptr inbounds [1 x [1 x i32]], [1 x [1 x i32]]* %".12", i64 0, i32 0
  %".14" = getelementptr inbounds [1 x i32], [1 x i32]* %".13", i64 0, i32 0
  store i32 0, i32* %".14", align 4
  %".16" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %".4", i64 0, i32 0
  ; printf "%d" x 0 0 0 0 0 0 0 0
  %".18" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %".16", i64 0, i32 0
  %".19" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %".18", i64 0, i32 0
  %".20" = getelementptr inbounds [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %".19", i64 0, i32 0
  %".21" = getelementptr inbounds [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %".20", i64 0, i32 0
  %".22" = getelementptr inbounds [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %".21", i64 0, i32 0
  %".23" = getelementptr inbounds [1 x [1 x i32]], [1 x [1 x i32]]* %".22", i64 0, i32 0
  %".24" = getelementptr inbounds [1 x i32], [1 x i32]* %".23", i64 0, i32 0
  %".25" = load i32, i32* %".24", align 4
  %".26" = bitcast [3 x i8]* @".str.0" to i8*
  %".27" = alloca i32
  store i32 %".25", i32* %".27"
  %".29" = load i32, i32* %".27"
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
