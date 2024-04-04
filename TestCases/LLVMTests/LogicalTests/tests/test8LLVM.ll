; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".16" = alloca i32, align 4
  store i32 0, i32* %".16", align 4
  ; INT a = 0
  %".19" = alloca i32, align 4
  store i32 0, i32* %".19", align 4
  ; INT b = 0
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ; INT c = 0
  %".25" = alloca i32, align 4
  store i32 0, i32* %".25", align 4
  ; INT d = 0
  %".28" = alloca i32, align 4
  store i32 0, i32* %".28", align 4
  ; INT e = 0
  %".31" = alloca i32, align 4
  store i32 0, i32* %".31", align 4
  ; INT f = 0
  store i32 0, i32* %".16", align 4
  ; a = 0
  store i32 0, i32* %".19", align 4
  ; b = 0
  store i32 0, i32* %".22", align 4
  ; c = 0
  store i32 0, i32* %".25", align 4
  ; d = 0
  store i32 0, i32* %".28", align 4
  ; e = 0
  %".44" = load i32, i32* %".16", align 4
  ; f = a && ! b || c
  %".46" = icmp ne i32 %".44", 0
  br i1 %".46", label %".3", label %".5"
.3:
  %".48" = load i32, i32* %".19", align 4
  %".49" = icmp ne i32 %".48", 0
  br i1 %".49", label %".5", label %".4"
.4:
  %".51" = load i32, i32* %".22", align 4
  %".52" = icmp ne i32 %".51", 0
  %".53" = xor i1 %".52", 1
  br label %".5"
.5:
  %".55" = phi  i1 [%".53", %".4"], [0, %".3"], [0, %".2"]
  %".56" = zext i1 %".55" to i32
  store i32 %".56", i32* %".31", align 4
  %".58" = load i32, i32* %".31", align 4
  ; printf "%d" , f
  %".60" = bitcast [3 x i8]* @".str.d" to i8*
  %".61" = alloca i32
  store i32 %".58", i32* %".61"
  %".63" = load i32, i32* %".61"
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %".63")
  store i32 1, i32* %".19", align 4
  ; b = 1
  %".67" = load i32, i32* %".16", align 4
  ; f = a && ! b || c
  %".69" = icmp ne i32 %".67", 0
  br i1 %".69", label %".6", label %".8"
.6:
  %".71" = load i32, i32* %".19", align 4
  %".72" = icmp ne i32 %".71", 0
  br i1 %".72", label %".8", label %".7"
.7:
  %".74" = load i32, i32* %".22", align 4
  %".75" = icmp ne i32 %".74", 0
  %".76" = xor i1 %".75", 1
  br label %".8"
.8:
  %".78" = phi  i1 [0, %".5"], [%".76", %".7"], [0, %".6"]
  %".79" = zext i1 %".78" to i32
  store i32 %".79", i32* %".31", align 4
  %".81" = load i32, i32* %".31", align 4
  ; printf "%d" , f
  %".83" = bitcast [3 x i8]* @".str.d" to i8*
  %".84" = alloca i32
  store i32 %".81", i32* %".84"
  %".86" = load i32, i32* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".86")
  store i32 1, i32* %".16", align 4
  ; a = 1
  %".90" = load i32, i32* %".16", align 4
  ; f = a && ! b || c
  %".92" = icmp ne i32 %".90", 0
  br i1 %".92", label %".9", label %".11"
.9:
  %".94" = load i32, i32* %".19", align 4
  %".95" = icmp ne i32 %".94", 0
  br i1 %".95", label %".11", label %".10"
.10:
  %".97" = load i32, i32* %".22", align 4
  %".98" = icmp ne i32 %".97", 0
  %".99" = xor i1 %".98", 1
  br label %".11"
.11:
  %".101" = phi  i1 [0, %".9"], [0, %".8"], [%".99", %".10"]
  %".102" = zext i1 %".101" to i32
  store i32 %".102", i32* %".31", align 4
  %".104" = load i32, i32* %".31", align 4
  ; printf "%d" , f
  %".106" = bitcast [3 x i8]* @".str.d" to i8*
  %".107" = alloca i32
  store i32 %".104", i32* %".107"
  %".109" = load i32, i32* %".107"
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".106", i32 %".109")
  store i32 0, i32* %".19", align 4
  ; b = 0
  %".113" = load i32, i32* %".16", align 4
  ; f = a && ! b || c
  %".115" = icmp ne i32 %".113", 0
  br i1 %".115", label %".12", label %".14"
.12:
  %".117" = load i32, i32* %".19", align 4
  %".118" = icmp ne i32 %".117", 0
  br i1 %".118", label %".14", label %".13"
.13:
  %".120" = load i32, i32* %".22", align 4
  %".121" = icmp ne i32 %".120", 0
  %".122" = xor i1 %".121", 1
  br label %".14"
.14:
  %".124" = phi  i1 [%".122", %".13"], [0, %".12"], [0, %".11"]
  %".125" = zext i1 %".124" to i32
  store i32 %".125", i32* %".31", align 4
  %".127" = load i32, i32* %".31", align 4
  ; printf "%d" , f
  %".129" = bitcast [3 x i8]* @".str.d" to i8*
  %".130" = alloca i32
  store i32 %".127", i32* %".130"
  %".132" = load i32, i32* %".130"
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".129", i32 %".132")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"