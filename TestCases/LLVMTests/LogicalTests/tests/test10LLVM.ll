; ModuleID = "tests/test10.c"
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
  ; f = ! a || b
  %".17" = load i32, i32* %".4", align 4
  %".18" = icmp ne i32 %".17", 0
  br i1 %".18", label %".22", label %".19"
.19:
  %".20" = load i32, i32* %".7", align 4
  %".21" = icmp ne i32 %".20", 0
  br label %".22"
.22:
  %".23" = phi  i1 [%".21", %".19"], [1, %".2"]
  %".24" = icmp ne i1 %".23", 0
  %".25" = xor i1 %".24", 1
  %".26" = zext i1 %".25" to i32
  store i32 %".26", i32* %".14", align 4
  %".28" = load i32, i32* %".14", align 4
  ; printf "%d" f
  %".30" = bitcast [3 x i8]* @".str.0" to i8*
  %".31" = alloca i32
  store i32 %".28", i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
