; ModuleID = "tests/test16.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 8, i32* %".4", align 4
  ;  const INT p = 8
  ; FLOAT * q = & p
  %".8" = bitcast i32* %".4" to float*
  %".9" = alloca float*, align 8
  store float* %".8", float** %".9", align 8
  ; const float p = 3.14
  ;
  %".13" = load i32, i32* %".4", align 4
  ;   printf "%% %d %x %f  kappa kappa" p p q
  %".15" = load i32, i32* %".4", align 4
  %".16" = bitcast i32* %".4" to float*
  %".17" = bitcast [25 x i8]* @".str.0" to i8*
  %".18" = alloca i32
  %".19" = alloca i32
  %".20" = alloca float*
  store i32 %".13", i32* %".18"
  store i32 %".15", i32* %".19"
  store float* %".16", float** %".20"
  %".24" = load i32, i32* %".18"
  %".25" = load i32, i32* %".19"
  %".26" = load float*, float** %".20"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".24", i32 %".25", float* %".26")
  %".28" = load float*, float** %".9", align 8
  ;  const FLOAT * z = q
  %".30" = alloca float*, align 8
  store float* %".28", float** %".30", align 8
  %".32" = load float*, float** %".30", align 8
  ;  printf "%% %d %x %f  kappa kappa" z z q
  %".34" = load float*, float** %".30", align 8
  %".35" = load float*, float** %".9", align 8
  %".36" = bitcast [25 x i8]* @".str.0" to i8*
  %".37" = alloca float*
  %".38" = alloca float*
  %".39" = alloca float*
  store float* %".32", float** %".37"
  store float* %".34", float** %".38"
  store float* %".35", float** %".39"
  %".43" = load float*, float** %".37"
  %".44" = load float*, float** %".38"
  %".45" = load float*, float** %".39"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".36", float* %".43", float* %".44", float* %".45")
  ret i32 0
  ;    return 0
}

@".str.0" = internal constant [25 x i8] c"%% %d %x %f  kappa kappa\00"
declare i32 @"printf"(i8* %".1", ...)
