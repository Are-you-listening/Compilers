; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ; INT a = 1
  store i32 1, i32* %".4", align 4
  ; a = 1
  %".9" = alloca i32, align 4
  ; INT f
  ; f = ! a
  %".12" = load i32, i32* %".4", align 4
  %".13" = icmp ne i32 %".12", 0
  %".14" = xor i1 %".13", 1
  %".15" = zext i1 %".14" to i32
  store i32 %".15", i32* %".9", align 4
  %".17" = load i32, i32* %".9", align 4
  ; printf "%d" f
  %".19" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"