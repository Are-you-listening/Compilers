; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 -20, i32* %".4", align 4
  ;  INT True = - 20
  %".7" = alloca i32, align 4
  store i32 -20, i32* %".7", align 4
  ; INT success = True
  %".10" = bitcast [3 x i8]* @".str.0" to i8*
  %".11" = alloca i32
  store i32 -20, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ;  printf "%d" success
  %".16" = load i32, i32* %".4", align 4
  ;  printf "%d" True
  %".18" = bitcast [3 x i8]* @".str.0" to i8*
  %".19" = alloca i32
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ret i32 0
  ;  return 0
}

@"a" = global i32 3, align 4
@"True" = global i32 4, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
