; ModuleID = "tests/test13.c"
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
  ; const float p = 3.14
  ;
  %".12" = load float, float* %".4", align 4
  ;  printf "%f %f %d " 3.14 p 7
  %".14" = bitcast [10 x i8]* @".str.0" to i8*
  %".15" = alloca float
  %".16" = alloca float
  %".17" = alloca i32
  store float 0x40091eb860000000, float* %".15"
  store float %".12", float* %".16"
  store i32 7, i32* %".17"
  %".21" = load float, float* %".15"
  %".22" = fpext float %".21" to double
  %".23" = load float, float* %".16"
  %".24" = fpext float %".23" to double
  %".25" = load i32, i32* %".17"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".22", double %".24", i32 %".25")
  %".27" = load float, float* %".4", align 4
  ;  printf "%% %c %f %x %f  kappa kappa" 'a' p 12 p
  %".29" = load float, float* %".4", align 4
  %".30" = bitcast [28 x i8]* @".str.1" to i8*
  %".31" = alloca i8
  %".32" = alloca float
  %".33" = alloca i32
  %".34" = alloca float
  store i8 97, i8* %".31"
  store float %".27", float* %".32"
  store i32 12, i32* %".33"
  store float %".29", float* %".34"
  %".39" = load i8, i8* %".31"
  %".40" = load float, float* %".32"
  %".41" = fpext float %".40" to double
  %".42" = load i32, i32* %".33"
  %".43" = load float, float* %".34"
  %".44" = fpext float %".43" to double
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".30", i8 %".39", double %".41", i32 %".42", double %".44")
  ; printf("%x,f",5);
  ;
  ; scanf("%f '\n'", q);
  ;
  %".50" = load float, float* %".4", align 4
  ; printf "%f '\n'" p
  %".52" = bitcast [8 x i8]* @".str.2" to i8*
  %".53" = alloca float
  store float %".50", float* %".53"
  %".55" = load float, float* %".53"
  %".56" = fpext float %".55" to double
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".52", double %".56")
  %".58" = load float, float* %".4", align 4
  ; printf "%f '\n'" p
  %".60" = bitcast [8 x i8]* @".str.2" to i8*
  %".61" = alloca float
  store float %".58", float* %".61"
  %".63" = load float, float* %".61"
  %".64" = fpext float %".63" to double
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".60", double %".64")
  %".66" = load float, float* %".4", align 4
  ; printf "a%fa '\n'" p
  %".68" = bitcast [10 x i8]* @".str.3" to i8*
  %".69" = alloca float
  store float %".66", float* %".69"
  %".71" = load float, float* %".69"
  %".72" = fpext float %".71" to double
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".68", double %".72")
  ; scanf("%f", q);
  ;
  %".76" = load float, float* %".4", align 4
  ;  printf "%f" p
  %".78" = bitcast [3 x i8]* @".str.4" to i8*
  %".79" = alloca float
  store float %".76", float* %".79"
  %".81" = load float, float* %".79"
  %".82" = fpext float %".81" to double
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".78", double %".82")
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [10 x i8] c"%f %f %d \00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [28 x i8] c"%% %c %f %x %f  kappa kappa\00"
@".str.2" = internal constant [8 x i8] c"%f '\5cn'\00"
@".str.3" = internal constant [10 x i8] c"a%fa '\5cn'\00"
@".str.4" = internal constant [3 x i8] c"%f\00"