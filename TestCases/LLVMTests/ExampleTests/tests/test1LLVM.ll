; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = alloca float, align 4
  store float 0x41bb14bb60000000, float* %".6", align 4
  ; FLOAT y = 454343534.21
  %".9" = alloca i8, align 1
  store i8 97, i8* %".9", align 1
  ; CHAR z = 'a'
  %".12" = load i8, i8* %".9", align 1
  ; INT d = x + y * z - z / y / z
  %".14" = sitofp i8 %".12" to float
  %".15" = load float, float* %".6", align 4
  %".16" = load i8, i8* %".9", align 1
  %".17" = sitofp i8 %".16" to float
  %".18" = fdiv float %".15", %".17"
  %".19" = fdiv float %".14", %".18"
  %".20" = fsub float 0x422485b600000000, %".19"
  %".21" = fptosi float %".20" to i32
  %".22" = alloca i32, align 4
  store i32 %".21", i32* %".22", align 4
  %".24" = load i8, i8* %".9", align 1
  %".25" = sitofp i8 %".24" to float
  %".26" = load float, float* %".6", align 4
  %".27" = load i8, i8* %".9", align 1
  %".28" = sitofp i8 %".27" to float
  %".29" = fdiv float %".26", %".28"
  %".30" = fdiv float %".25", %".29"
  %".31" = fsub float 0x422485b600000000, %".30"
  %".32" = fptosi float %".31" to i32
  %".33" = srem i32 10, %".32"
  ; INT e = 10 % d
  %".35" = alloca i32, align 4
  store i32 %".33", i32* %".35", align 4
  %".37" = load i32, i32* %".35", align 4
  ; INT f = e << 4
  %".39" = shl i32 %".37", 4
  %".40" = alloca i32, align 4
  store i32 %".39", i32* %".40", align 4
  %".42" = load i32, i32* %".40", align 4
  ; INT g = f >> 4
  %".44" = ashr i32 %".42", 4
  %".45" = alloca i32, align 4
  store i32 %".44", i32* %".45", align 4
  %".47" = load i32, i32* %".3", align 4
  ; printf " %d " , x
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 %".47", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  %".54" = load float, float* %".6", align 4
  ; printf " %f " , y
  %".56" = bitcast [3 x i8]* @".str.f" to i8*
  %".57" = alloca float
  store float %".54", float* %".57"
  %".59" = load float, float* %".57"
  %".60" = fpext float %".59" to double
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".56", double %".60")
  %".62" = load i8, i8* %".9", align 1
  ; printf " %c " , z
  %".64" = bitcast [3 x i8]* @".str.c" to i8*
  %".65" = alloca i8
  store i8 %".62", i8* %".65"
  %".67" = load i8, i8* %".65"
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".64", i8 %".67")
  %".69" = load i32, i32* %".22", align 4
  ; printf " %d " , d
  %".71" = bitcast [3 x i8]* @".str.d" to i8*
  %".72" = alloca i32
  store i32 %".69", i32* %".72"
  %".74" = load i32, i32* %".72"
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".71", i32 %".74")
  %".76" = load i32, i32* %".35", align 4
  ; printf " %d " , e
  %".78" = bitcast [3 x i8]* @".str.d" to i8*
  %".79" = alloca i32
  store i32 %".76", i32* %".79"
  %".81" = load i32, i32* %".79"
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %".81")
  %".83" = load i32, i32* %".40", align 4
  ; printf " %d " , f
  %".85" = bitcast [3 x i8]* @".str.d" to i8*
  %".86" = alloca i32
  store i32 %".83", i32* %".86"
  %".88" = load i32, i32* %".86"
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".85", i32 %".88")
  %".90" = load i32, i32* %".45", align 4
  ; printf " %d " , g
  %".92" = bitcast [3 x i8]* @".str.d" to i8*
  %".93" = alloca i32
  store i32 %".90", i32* %".93"
  %".95" = load i32, i32* %".93"
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %".95")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.f" = internal constant [3 x i8] c"%f\00"
@".str.c" = internal constant [3 x i8] c"%c\00"