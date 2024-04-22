; ModuleID = "tests/test12.c"
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
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT c = 0
  store i32 1, i32* %".4", align 4
  ; a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 0, i32* %".10", align 4
  ; c = 0
  %".19" = alloca i32, align 4
  ;  INT f
  ; f = a && ! b || c
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp ne i32 %".22", 0
  br i1 %".23", label %".24", label %".31"
.24:
  %".25" = load i32, i32* %".7", align 4
  %".26" = icmp ne i32 %".25", 0
  br i1 %".26", label %".31", label %".27"
.27:
  %".28" = load i32, i32* %".10", align 4
  %".29" = icmp ne i32 %".28", 0
  %".30" = xor i1 %".29", 1
  br label %".31"
.31:
  %".32" = phi  i1 [0, %".2"], [0, %".24"], [%".30", %".27"]
  %".33" = zext i1 %".32" to i32
  store i32 %".33", i32* %".19", align 4
  %".35" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".37" = bitcast [3 x i8]* @".str.0" to i8*
  %".38" = alloca i32
  store i32 %".35", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
