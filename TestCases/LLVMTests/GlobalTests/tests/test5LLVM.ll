; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = load i32, i32* @"True", align 4
  ;  True = True - 20
  %".6" = sub i32 %".4", 20
  store i32 %".6", i32* @"True", align 4
  %".8" = load i32, i32* @"True", align 4
  ; INT success = True
  %".10" = alloca i32, align 4
  store i32 %".8", i32* %".10", align 4
  %".12" = load i32, i32* %".10", align 4
  ;  printf "%d" success
  %".14" = bitcast [3 x i8]* @".str.0" to i8*
  %".15" = alloca i32
  store i32 %".12", i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  %".19" = load i32, i32* @"True", align 4
  ;  printf "%d" True
  %".21" = bitcast [3 x i8]* @".str.0" to i8*
  %".22" = alloca i32
  store i32 %".19", i32* %".22"
  %".24" = load i32, i32* %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  ret i32 0
  ;  return 0
}

@"a" = global i32 3, align 4
@"True" = global i32 Expr, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
