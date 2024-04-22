; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  typedef INT enumweek  INT main
  %".4" = alloca i32, align 4
  ;  enum week day
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; enumweek z = 1
  store i32 2, i32* %".4", align 4
  ; day = Wed
  %".11" = load i32, i32* %".4", align 4
  ; printf "%d" day
  %".13" = bitcast [3 x i8]* @".str.0" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  ret i32 0
  ; return 0
}

@"x" = global i32 1, align 4
@"Sun" = global i32 6, align 4
@"Sat" = global i32 5, align 4
@"Fri" = global i32 4, align 4
@"Thur" = global i32 3, align 4
@"Wed" = global i32 2, align 4
@"Tue" = global i32 1, align 4
@"Mon" = global i32 0, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
