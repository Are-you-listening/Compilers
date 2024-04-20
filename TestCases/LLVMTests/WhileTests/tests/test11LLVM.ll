; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  for INT i = 0 i < 5 i ++
  br label %".7"
.7:
  %".8" = load i32, i32* %".4", align 4
  %".9" = icmp slt i32 %".8", 5
  br i1 %".9", label %".10", label %".21"
.10:
  %".11" = load i32, i32* %".4", align 4
  ; printf "%d" i
  %".13" = bitcast [3 x i8]* @".str.d" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = load i32, i32* %".4", align 4
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %".4", align 4
  br label %".7"
.21:
  %".22" = alloca i32, align 4
  store i32 5, i32* %".22", align 4
  ;  INT i = 5
  %".25" = bitcast [3 x i8]* @".str.d" to i8*
  %".26" = alloca i32
  store i32 5, i32* %".26"
  %".28" = load i32, i32* %".26"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  ; printf "%d" i
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"