; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ; INT a = 1
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT b = 1
  store i32 1, i32* %".4", align 4
  ; a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  %".14" = alloca i32, align 4
  ;  INT f
  ; f = a || ! b
  %".17" = load i32, i32* %".4", align 4
  %".18" = icmp ne i32 %".17", 0
  br i1 %".18", label %".23", label %".19"
.19:
  %".20" = load i32, i32* %".7", align 4
  %".21" = icmp ne i32 %".20", 0
  %".22" = xor i1 %".21", 1
  br label %".23"
.23:
  %".24" = phi  i1 [%".22", %".19"], [1, %".2"]
  %".25" = zext i1 %".24" to i32
  store i32 %".25", i32* %".14", align 4
  %".27" = load i32, i32* %".14", align 4
  ; printf "%d" f
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i32
  store i32 %".27", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"