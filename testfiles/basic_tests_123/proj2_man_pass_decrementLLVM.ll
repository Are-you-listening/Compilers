; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_decrement.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @"main"()
{
.2:
  %0 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = load i32, i32* %".3", align 4
  %".7" = sub i32 %".6", 1
  store i32 %".7", i32* %".3", align 4
  %".9" = load i32, i32* %".3", align 4
  %".10" = sub i32 %".9", 1
  store i32 %".10", i32* %".3", align 4
  %".12" = alloca i32, align 4
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1
