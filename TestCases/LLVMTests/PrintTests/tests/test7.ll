; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = bitcast [3 x i8]* @".str.0" to i8*
  %".5" = alloca float
  store float 0x4014ccccc0000000, float* %".5"
  %".7" = load float, float* %".5"
  %".8" = fpext float %".7" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".8")
  ; printf "%f" 5.2
  %".11" = bitcast [3 x i8]* @".str.1" to i8*
  %".12" = alloca i8
  store i8 97, i8* %".12"
  %".14" = load i8, i8* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i8 %".14")
  ; printf "%x" 'a'
  %".17" = bitcast [3 x i8]* @".str.2" to i8*
  %".18" = alloca i8
  store i8 97, i8* %".18"
  %".20" = load i8, i8* %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i8 %".20")
  ; printf "%c" 'a'
  %".23" = bitcast [3 x i8]* @".str.3" to i8*
  %".24" = alloca i32
  store i32 6, i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  ; printf "%d" 6
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%f\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [3 x i8] c"%x\00"
@".str.2" = internal constant [3 x i8] c"%c\00"
@".str.3" = internal constant [3 x i8] c"%d\00"