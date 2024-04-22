; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT a = 1
  store i32 3, i32* %".4", align 4
  ; a = 3
  ;  if a
  %".10" = load i32, i32* %".4", align 4
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %".12", label %".20"
.12:
  %".13" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".15" = bitcast [3 x i8]* @".str.0" to i8*
  %".16" = alloca i32
  store i32 %".13", i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  br label %".20"
.20:
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
