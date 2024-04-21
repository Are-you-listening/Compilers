; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  br label %".4"
.4:
  ;  while 1
  br label %".6"
.6:
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT a = 0
  %".10" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".11" = alloca i32
  store i32 1, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ; printf "%d" 1
  br label %".16"
.16:
  %".17" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".18" = alloca i32
  store i32 2, i32* %".18"
  %".20" = load i32, i32* %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".20")
  ; break  printf "%d" 2
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"