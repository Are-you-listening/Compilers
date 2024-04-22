; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca float, align 4
  store float 0x40091eb860000000, float* %".4", align 4
  ;  FLOAT p = 3.14
  %".7" = alloca float*, align 8
  store float* %".4", float** %".7", align 8
  ; FLOAT * q = & p
  %".10" = load float, float* %".4", align 4
  ;   printf "%f %f %d " 3.14 p 7
  %".12" = bitcast [10 x i8]* @".str.0" to i8*
  %".13" = alloca float
  %".14" = alloca float
  %".15" = alloca i32
  store float 0x40091eb860000000, float* %".13"
  store float %".10", float* %".14"
  store i32 7, i32* %".15"
  %".19" = load float, float* %".13"
  %".20" = fpext float %".19" to double
  %".21" = load float, float* %".14"
  %".22" = fpext float %".21" to double
  %".23" = load i32, i32* %".15"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".12", double %".20", double %".22", i32 %".23")
  %".25" = load float, float* %".4", align 4
  ;  printf "%f" p
  %".27" = bitcast [3 x i8]* @".str.1" to i8*
  %".28" = alloca float
  store float %".25", float* %".28"
  %".30" = load float, float* %".28"
  %".31" = fpext float %".30" to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".31")
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [10 x i8] c"%f %f %d \00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [3 x i8] c"%f\00"