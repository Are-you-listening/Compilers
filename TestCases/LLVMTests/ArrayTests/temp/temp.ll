; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [2 x [2 x i8]], align 8
  ;  CHAR x 2 2
  %".6" = getelementptr inbounds [2 x [2 x i8]], [2 x [2 x i8]]* %".4", i32 0, i32 0
  ;  * * x = 110
  %".8" = getelementptr inbounds [2 x i8], [2 x i8]* %".6", i32 0, i32 0
}
