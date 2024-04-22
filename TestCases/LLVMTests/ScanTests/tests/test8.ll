; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i8, align 1
  store i8 0, i8* %".4", align 1
  ; CHAR k = 0
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT s = 1
  %".10" = alloca float, align 4
  store float 0x4000000000000000, float* %".10", align 4
  ; FLOAT l = 2
  %".13" = load i8, i8* %".4", align 1
  ; printf "%c %d %x %f" k s s l
  %".15" = load i32, i32* %".7", align 4
  %".16" = load i32, i32* %".7", align 4
  %".17" = load float, float* %".10", align 4
  %".18" = bitcast [12 x i8]* @".str.PS0" to i8*
  %".19" = alloca i8
  %".20" = alloca i32
  %".21" = alloca i32
  %".22" = alloca float
  store i8 %".13", i8* %".19"
  store i32 %".15", i32* %".20"
  store i32 %".16", i32* %".21"
  store float %".17", float* %".22"
  %".27" = load i8, i8* %".19"
  %".28" = load i32, i32* %".20"
  %".29" = load i32, i32* %".21"
  %".30" = load float, float* %".22"
  %".31" = fpext float %".30" to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".18", i8 %".27", i32 %".28", i32 %".29", double %".31")
  %".33" = bitcast [12 x i8]* @".str.PS0" to i8*
  %".34" = alloca i8*
  %".35" = alloca i32*
  %".36" = alloca i32*
  %".37" = alloca float*
  store i8* %".4", i8** %".34"
  store i32* %".7", i32** %".35"
  store i32* %".7", i32** %".36"
  store float* %".10", float** %".37"
  %".42" = load i8*, i8** %".34"
  %".43" = load i32*, i32** %".35"
  %".44" = load i32*, i32** %".36"
  %".45" = load float*, float** %".37"
  %".46" = call i32 (i8*, ...) @"scanf"(i8* %".33", i8* %".42", i32* %".43", i32* %".44", float* %".45")
  ; scanf "%c %d %x %f" & k & s & s & l
  %".48" = load i8, i8* %".4", align 1
  ; printf "%c %d %x %f" k s s l
  %".50" = load i32, i32* %".7", align 4
  %".51" = load i32, i32* %".7", align 4
  %".52" = load float, float* %".10", align 4
  %".53" = bitcast [12 x i8]* @".str.PS0" to i8*
  %".54" = alloca i8
  %".55" = alloca i32
  %".56" = alloca i32
  %".57" = alloca float
  store i8 %".48", i8* %".54"
  store i32 %".50", i32* %".55"
  store i32 %".51", i32* %".56"
  store float %".52", float* %".57"
  %".62" = load i8, i8* %".54"
  %".63" = load i32, i32* %".55"
  %".64" = load i32, i32* %".56"
  %".65" = load float, float* %".57"
  %".66" = fpext float %".65" to double
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".53", i8 %".62", i32 %".63", i32 %".64", double %".66")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [12 x i8] c"%c %d %x %f\00"
declare i32 @"scanf"(i8* %".1", ...)
