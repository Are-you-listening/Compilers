; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ; enum week day
  store i32 2, i32* %".3", align 4
  ; day = Wed
  %".7" = load i32, i32* %".3", align 4
  ; printf "%d" day
  %".9" = bitcast [3 x i8]* @".str.d" to i8*
  %".10" = alloca i32
  store i32 %".7", i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  ret i32 0
  ; INT main
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"