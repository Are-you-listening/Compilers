; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT success = True
  %".7" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".8" = alloca i32
  store i32 1, i32* %".8"
  %".10" = load i32, i32* %".8"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  ;  printf "%d" success
  %".13" = load i32, i32* @"True", align 4
  ;  printf "%d" True
  %".15" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".16" = alloca i32
  store i32 %".13", i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  ret i32 0
  ;  return 0
}

@"True" = global i32 1, align 4
declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"