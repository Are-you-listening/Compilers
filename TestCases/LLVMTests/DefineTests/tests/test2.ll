; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ; enum week day
  %".5" = alloca i32, align 4
  store i32 1, i32* %".5", align 4
  ; enumweek z = 1
  store i32 2, i32* %".3", align 4
  ; day = Wed
  %".10" = load i32, i32* %".3", align 4
  ; printf "%d" day
  %".12" = bitcast [3 x i8]* @".str.d" to i8*
  %".13" = alloca i32
  store i32 %".10", i32* %".13"
  %".15" = load i32, i32* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  ret i32 0
  ; INT main
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"