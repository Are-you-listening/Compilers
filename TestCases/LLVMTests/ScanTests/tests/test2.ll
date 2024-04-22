; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca float, align 4
  store float 0x40091eb860000000, float* %".4", align 4
  ;   const FLOAT p = 3.14
  %".7" = alloca float*, align 8
  store float* %".4", float** %".7", align 8
  ; FLOAT * q = & p
  %".10" = load float*, float** %".7", align 8
  ; const FLOAT * s = q
  %".12" = alloca float*, align 8
  store float* %".10", float** %".12", align 8
  %".14" = load float*, float** %".12", align 8
  ;  scanf "%f" s
  %".16" = bitcast [3 x i8]* @".str.0" to i8*
  %".17" = alloca float*
  store float* %".14", float** %".17"
  %".19" = load float*, float** %".17"
  %".20" = call i32 (i8*, ...) @"scanf"(i8* %".16", float* %".19")
  %".21" = bitcast [3 x i8]* @".str.0" to i8*
  %".22" = alloca float**
  store float** %".12", float*** %".22"
  %".24" = load float**, float*** %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", float** %".24")
  ; printf "%f" & s
  %".27" = load float, float* %".4", align 4
  ; printf "%f" p
  %".29" = bitcast [3 x i8]* @".str.0" to i8*
  %".30" = alloca float
  store float %".27", float* %".30"
  %".32" = load float, float* %".30"
  %".33" = fpext float %".32" to double
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".29", double %".33")
  %".35" = load float*, float** %".7", align 8
  ;   scanf "%f" q
  %".37" = bitcast [3 x i8]* @".str.0" to i8*
  %".38" = alloca float*
  store float* %".35", float** %".38"
  %".40" = load float*, float** %".38"
  %".41" = call i32 (i8*, ...) @"scanf"(i8* %".37", float* %".40")
  %".42" = bitcast [3 x i8]* @".str.0" to i8*
  %".43" = alloca float**
  store float** %".7", float*** %".43"
  %".45" = load float**, float*** %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", float** %".45")
  ; printf "%f" & q
  %".48" = load float, float* %".4", align 4
  ; printf "%f" p
  %".50" = bitcast [3 x i8]* @".str.0" to i8*
  %".51" = alloca float
  store float %".48", float* %".51"
  %".53" = load float, float* %".51"
  %".54" = fpext float %".53" to double
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".50", double %".54")
  %".56" = bitcast [3 x i8]* @".str.0" to i8*
  %".57" = alloca float*
  store float* %".4", float** %".57"
  %".59" = load float*, float** %".57"
  %".60" = call i32 (i8*, ...) @"scanf"(i8* %".56", float* %".59")
  ;  scanf "%f" & p
  %".62" = load float, float* %".4", align 4
  ; printf "%f" p
  %".64" = bitcast [3 x i8]* @".str.0" to i8*
  %".65" = alloca float
  store float %".62", float* %".65"
  %".67" = load float, float* %".65"
  %".68" = fpext float %".67" to double
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".64", double %".68")
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%f\00"
declare i32 @"scanf"(i8* %".1", ...)

declare i32 @"printf"(i8* %".1", ...)
