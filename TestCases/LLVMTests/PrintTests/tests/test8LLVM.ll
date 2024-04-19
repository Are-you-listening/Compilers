; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  %".7" = alloca float, align 4
  store float 0x4014ccccc0000000, float* %".7", align 4
  ; FLOAT b = 5.2
  %".10" = alloca i8, align 1
  store i8 97, i8* %".10", align 1
  ; CHAR c = 'a'
  %".13" = bitcast [3 x i8]* @".str.c" to i8*
  %".14" = alloca i8
  store i8 97, i8* %".14"
  %".16" = load i8, i8* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i8 %".16")
  ;  printf "%c" c
  %".19" = bitcast [3 x i8]* @".str.f" to i8*
  %".20" = alloca float
  store float 0x4014ccccc0000000, float* %".20"
  %".22" = load float, float* %".20"
  %".23" = fpext float %".22" to double
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", double %".23")
  ; printf "%f" b
  %".26" = bitcast [3 x i8]* @".str.d" to i8*
  %".27" = alloca i32
  store i32 0, i32* %".27"
  %".29" = load i32, i32* %".27"
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  ; printf "%d" a
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"
@".str.f" = internal constant [3 x i8] c"%f\00"
@".str.d" = internal constant [3 x i8] c"%d\00"