; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT s = 0
  %".7" = alloca i32*, align 8
  store i32* %".4", i32** %".7", align 8
  ; INT * k = & s
  %".10" = load i32, i32* %".4", align 4
  ; printf "%d" s
  %".12" = bitcast [3 x i8]* @".str.0" to i8*
  %".13" = alloca i32
  store i32 %".10", i32* %".13"
  %".15" = load i32, i32* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  %".17" = load i32*, i32** %".7", align 8
  ; scanf "%d" k
  %".19" = bitcast [3 x i8]* @".str.0" to i8*
  %".20" = alloca i32*
  store i32* %".17", i32** %".20"
  %".22" = load i32*, i32** %".20"
  %".23" = call i32 (i8*, ...) @"scanf"(i8* %".19", i32* %".22")
  %".24" = load i32, i32* %".4", align 4
  ; printf "%d" s
  %".26" = bitcast [3 x i8]* @".str.0" to i8*
  %".27" = alloca i32
  store i32 %".24", i32* %".27"
  %".29" = load i32, i32* %".27"
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)
