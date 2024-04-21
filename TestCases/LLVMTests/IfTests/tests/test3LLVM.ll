; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  if 1 INT a = 0
  %".7" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".8" = alloca i32
  store i32 0, i32* %".8"
  %".10" = load i32, i32* %".8"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  ; printf "%d" a
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; if 6 INT c = 0
  %".16" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".17" = alloca i32
  store i32 0, i32* %".17"
  %".19" = load i32, i32* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".19")
  ; printf "%d" c
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ;  INT q = 0
  %".25" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".26" = alloca i32
  store i32 0, i32* %".26"
  %".28" = load i32, i32* %".26"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  ; printf "%d" q
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"