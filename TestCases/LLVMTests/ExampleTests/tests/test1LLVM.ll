; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ;  INT x = 5
  %".7" = alloca float, align 4
  store float 0x41bb14bb60000000, float* %".7", align 4
  ; FLOAT y = 454343534.21
  %".10" = alloca i8, align 1
  store i8 97, i8* %".10", align 1
  ; CHAR z = 'a'
  ; INT d = x + y * z - z / y / z
  %".14" = load i8, i8* %".10", align 1
  %".15" = sitofp i8 %".14" to float
  %".16" = load float, float* %".7", align 4
  %".17" = load i8, i8* %".10", align 1
  %".18" = sitofp i8 %".17" to float
  %".19" = fdiv float %".16", %".18"
  %".20" = fdiv float %".15", %".19"
  %".21" = fsub float 0x422485b600000000, %".20"
  %".22" = fptosi float %".21" to i32
  %".23" = alloca i32, align 4
  store i32 %".22", i32* %".23", align 4
  %".25" = load i8, i8* %".10", align 1
  %".26" = sitofp i8 %".25" to float
  %".27" = load float, float* %".7", align 4
  %".28" = load i8, i8* %".10", align 1
  %".29" = sitofp i8 %".28" to float
  %".30" = fdiv float %".27", %".29"
  %".31" = fdiv float %".26", %".30"
  %".32" = fsub float 0x422485b600000000, %".31"
  %".33" = fptosi float %".32" to i32
  %".34" = srem i32 10, %".33"
  ; INT e = 10 % d
  %".36" = alloca i32, align 4
  store i32 %".34", i32* %".36", align 4
  %".38" = load i32, i32* %".36", align 4
  ; INT f = e << 4
  %".40" = shl i32 %".38", 4
  %".41" = alloca i32, align 4
  store i32 %".40", i32* %".41", align 4
  %".43" = load i32, i32* %".41", align 4
  ; INT g = f >> 4
  %".45" = ashr i32 %".43", 4
  %".46" = alloca i32, align 4
  store i32 %".45", i32* %".46", align 4
  %".48" = load i32, i32* %".4", align 4
  ;  printf "%d" x
  %".50" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".51" = alloca i32
  store i32 %".48", i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  %".55" = load float, float* %".7", align 4
  ; printf "%f" y
  %".57" = bitcast [3 x i8]* @".str.PS1" to i8*
  %".58" = alloca float
  store float %".55", float* %".58"
  %".60" = load float, float* %".58"
  %".61" = fpext float %".60" to double
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".57", double %".61")
  %".63" = load i8, i8* %".10", align 1
  ; printf "%c" z
  %".65" = bitcast [3 x i8]* @".str.PS2" to i8*
  %".66" = alloca i8
  store i8 %".63", i8* %".66"
  %".68" = load i8, i8* %".66"
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".65", i8 %".68")
  %".70" = load i32, i32* %".23", align 4
  ; printf "%d" d
  %".72" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".73" = alloca i32
  store i32 %".70", i32* %".73"
  %".75" = load i32, i32* %".73"
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %".75")
  %".77" = load i32, i32* %".36", align 4
  ; printf "%d" e
  %".79" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".80" = alloca i32
  store i32 %".77", i32* %".80"
  %".82" = load i32, i32* %".80"
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %".82")
  %".84" = load i32, i32* %".41", align 4
  ; printf "%d" f
  %".86" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".87" = alloca i32
  store i32 %".84", i32* %".87"
  %".89" = load i32, i32* %".87"
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %".89")
  %".91" = load i32, i32* %".46", align 4
  ; printf "%d" g
  %".93" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".94" = alloca i32
  store i32 %".91", i32* %".94"
  %".96" = load i32, i32* %".94"
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".93", i32 %".96")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
@".str.PS1" = internal constant [3 x i8] c"%f\00"
@".str.PS2" = internal constant [3 x i8] c"%c\00"