; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca float, align 4
  store float 0x3fe93f7ce0000000, float* %".4", align 4
  ; const FLOAT f = 0.789
  %".7" = alloca float*, align 8
  store float* %".4", float** %".7", align 8
  ; const FLOAT * f_ptr = & f
  %".10" = alloca float*, align 8
  store float* %".4", float** %".10", align 8
  ; FLOAT * non_const_f_ptr = f_ptr
  %".13" = load float*, float** %".10", align 8
  ; * non_const_f_ptr = 3.1492
  store float 0x4009318fc0000000, float* %".13", align 8
  %".16" = load float, float* %".4", align 4
  ; printf "%f" f
  %".18" = bitcast [3 x i8]* @".str.f" to i8*
  %".19" = alloca float
  store float %".16", float* %".19"
  %".21" = load float, float* %".19"
  %".22" = fpext float %".21" to double
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".18", double %".22")
  %".24" = load float*, float** %".10", align 8
  ; printf "%f" * non_const_f_ptr
  %".26" = load float, float* %".24", align 8
  %".27" = bitcast [3 x i8]* @".str.f" to i8*
  %".28" = alloca float
  store float %".26", float* %".28"
  %".30" = load float, float* %".28"
  %".31" = fpext float %".30" to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".31")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.f" = internal constant [3 x i8] c"%f\00"