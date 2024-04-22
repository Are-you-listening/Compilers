; ModuleID = "tests/test14.c"
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
  %".46" = bitcast [5 x i8]* @".str.2" to i8*
  %".47" = alloca i32
  store i32 5, i32* %".47"
  %".49" = load i32, i32* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".49")
  ;  printf "%x,f" 5
  ; scanf("%f '\n'", q);
  ;
  %".54" = load float, float* %".4", align 4
  ; printf "%f '\n'" p
  %".56" = bitcast [8 x i8]* @".str.3" to i8*
  %".57" = alloca float
  store float %".54", float* %".57"
  %".59" = load float, float* %".57"
  %".60" = fpext float %".59" to double
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".56", double %".60")
  %".62" = load float, float* %".4", align 4
  ; printf "%f '\n'" p
  %".64" = bitcast [8 x i8]* @".str.3" to i8*
  %".65" = alloca float
  store float %".62", float* %".65"
  %".67" = load float, float* %".65"
  %".68" = fpext float %".67" to double
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".64", double %".68")
  %".70" = load float, float* %".4", align 4
  ; printf "a%fa '\n'" p
  %".72" = bitcast [10 x i8]* @".str.4" to i8*
  %".73" = alloca float
  store float %".70", float* %".73"
  %".75" = load float, float* %".73"
  %".76" = fpext float %".75" to double
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".72", double %".76")
  ; scanf("%f", q);
  ;
  %".80" = load float, float* %".4", align 4
  ;  printf "%f" p
  %".82" = bitcast [3 x i8]* @".str.5" to i8*
  %".83" = alloca float
  store float %".80", float* %".83"
  %".85" = load float, float* %".83"
  %".86" = fpext float %".85" to double
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".82", double %".86")
  %".88" = bitcast [3 x i8]* @".str.6" to i8*
  %".89" = alloca [28 x i8]*
  store [28 x i8]* @".str.7", [28 x i8]** %".89"
  %".91" = load [28 x i8]*, [28 x i8]** %".89"
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".88", [28 x i8]* %".91")
  ;  printf "%s" "This is a beautifull string"
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [10 x i8] c"%f %f %d \00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [28 x i8] c"%% %c %f %x %f  kappa kappa\00"
@".str.2" = internal constant [5 x i8] c"%x,f\00"
@".str.3" = internal constant [8 x i8] c"%f '\5cn'\00"
@".str.4" = internal constant [10 x i8] c"a%fa '\5cn'\00"
@".str.5" = internal constant [3 x i8] c"%f\00"
@".str.6" = internal constant [3 x i8] c"%s\00"
@".str.7" = internal constant [28 x i8] c"This is a beautifull string\00"