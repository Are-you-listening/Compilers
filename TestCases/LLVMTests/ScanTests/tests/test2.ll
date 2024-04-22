; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  ;  Verify scanf consistency for const variables
  ;
  %".6" = alloca float, align 4
  store float 0x40091eb860000000, float* %".6", align 4
  ;  const FLOAT p = 3.14
  %".9" = alloca float*, align 8
  store float* %".6", float** %".9", align 8
  ; FLOAT * q = & p
  %".12" = load float*, float** %".9", align 8
  ; const FLOAT * s = q
  %".14" = alloca float*, align 8
  store float* %".12", float** %".14", align 8
  %".16" = load float*, float** %".14", align 8
  ;  scanf "%f" s
  %".18" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".19" = alloca float*
  store float* %".16", float** %".19"
  %".21" = load float*, float** %".19"
  %".22" = call i32 (i8*, ...) @"scanf"(i8* %".18", float* %".21")
  %".23" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".24" = alloca float**
  store float** %".14", float*** %".24"
  %".26" = load float**, float*** %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", float** %".26")
  ; printf "%f" & s
  %".29" = load float, float* %".6", align 4
  ; printf "%f" p
  %".31" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".32" = alloca float
  store float %".29", float* %".32"
  %".34" = load float, float* %".32"
  %".35" = fpext float %".34" to double
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".35")
  %".37" = load float*, float** %".9", align 8
  ;   scanf "%f" q
  %".39" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".40" = alloca float*
  store float* %".37", float** %".40"
  %".42" = load float*, float** %".40"
  %".43" = call i32 (i8*, ...) @"scanf"(i8* %".39", float* %".42")
  %".44" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".45" = alloca float**
  store float** %".9", float*** %".45"
  %".47" = load float**, float*** %".45"
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".44", float** %".47")
  ; printf "%f" & q
  %".50" = load float, float* %".6", align 4
  ; printf "%f" p
  %".52" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".53" = alloca float
  store float %".50", float* %".53"
  %".55" = load float, float* %".53"
  %".56" = fpext float %".55" to double
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".52", double %".56")
  %".58" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".59" = alloca float*
  store float* %".6", float** %".59"
  %".61" = load float*, float** %".59"
  %".62" = call i32 (i8*, ...) @"scanf"(i8* %".58", float* %".61")
  ;  scanf "%f" & p
  %".64" = load float, float* %".6", align 4
  ; printf "%f" p
  %".66" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".67" = alloca float
  store float %".64", float* %".67"
  %".69" = load float, float* %".67"
  %".70" = fpext float %".69" to double
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".66", double %".70")
  ret i32 0
  ;  return 0
}

declare i32 @"scanf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%f\00"
declare i32 @"printf"(i8* %".1", ...)
