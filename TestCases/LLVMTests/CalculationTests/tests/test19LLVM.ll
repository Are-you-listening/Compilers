; ModuleID = "tests/test19.c"
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
  %".16" = load float*, float** %".10", align 8
  ; printf "%f" * non_const_f_ptr
  %".18" = load float, float* %".16", align 8
  %".19" = bitcast [3 x i8]* @".str.f" to i8*
  %".20" = alloca float
  store float %".18", float* %".20"
  %".22" = load float, float* %".20"
  %".23" = fpext float %".22" to double
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", double %".23")
  %".25" = load float, float* %".4", align 4
  ; printf "%f" f
  %".27" = bitcast [3 x i8]* @".str.f" to i8*
  %".28" = alloca float
  store float %".25", float* %".28"
  %".30" = load float, float* %".28"
  %".31" = fpext float %".30" to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".31")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.f" = internal constant [3 x i8] c"%f\00"