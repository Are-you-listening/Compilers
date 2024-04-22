; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;      INT main
  %".4" = alloca float, align 4
  store float 0x40091eb860000000, float* %".4", align 4
  ;  FLOAT p = 3.14
  %".7" = alloca float*, align 8
  store float* %".4", float** %".7", align 8
  ; FLOAT * q = & p
  %".10" = load float, float* %".4", align 4
  ;  printf "%f %x %d " 3.14 p 7
  %".12" = bitcast [10 x i8]* @".str.PS0" to i8*
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
  %".25" = bitcast [12 x i8]* @".str.PS1" to i8*
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25")
  ; printf "True %d \n "
  ret i32 0
  ;     return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [10 x i8] c"%f %x %d \00"
@".str.PS1" = internal constant [12 x i8] c"True %d \5cn \00"