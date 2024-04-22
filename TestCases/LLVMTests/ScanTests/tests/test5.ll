; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT k = 0
  %".7" = load i32, i32* %".4", align 4
  ; scanf "%x" k
  %".9" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".10" = alloca i32
  store i32 %".7", i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"scanf"(i8* %".9", i32 %".12")
  %".14" = load i32, i32* %".4", align 4
  ; printf "%x" k
  %".16" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".17" = alloca i32
  store i32 %".14", i32* %".17"
  %".19" = load i32, i32* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".19")
  ret i32 0
  ; return 0
}

declare i32 @"scanf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%x\00"
declare i32 @"printf"(i8* %".1", ...)
