; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca float, align 4
  store float              0x0, float* %".4", align 4
  ; FLOAT k = 0
  %".7" = load float, float* %".4", align 4
  ; printf "%f" k
  %".9" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".10" = alloca float
  store float %".7", float* %".10"
  %".12" = load float, float* %".10"
  %".13" = fpext float %".12" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".9", double %".13")
  %".15" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".16" = alloca float*
  store float* %".4", float** %".16"
  %".18" = load float*, float** %".16"
  %".19" = call i32 (i8*, ...) @"scanf"(i8* %".15", float* %".18")
  ; scanf "%f" & k
  %".21" = load float, float* %".4", align 4
  ; printf "%f" k
  %".23" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".24" = alloca float
  store float %".21", float* %".24"
  %".26" = load float, float* %".24"
  %".27" = fpext float %".26" to double
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".23", double %".27")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%f\00"
declare i32 @"scanf"(i8* %".1", ...)
