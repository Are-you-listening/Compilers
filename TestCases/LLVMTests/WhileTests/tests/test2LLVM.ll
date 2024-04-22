; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  ;  INT a
  store i32 0, i32* %".4", align 4
  ; for a = 0 a < 10 a ++
  br label %".8"
.8:
  %".9" = load i32, i32* %".4", align 4
  %".10" = icmp slt i32 %".9", 10
  br i1 %".10", label %".11", label %".22"
.11:
  %".12" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".14" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".15" = alloca i32
  store i32 %".12", i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  %".19" = load i32, i32* %".4", align 4
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %".4", align 4
  br label %".8"
.22:
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"