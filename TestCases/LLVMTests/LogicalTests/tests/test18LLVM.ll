; ModuleID = "tests/test18.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".8" = alloca i32, align 4
  store i32 0, i32* %".8", align 4
  ; INT a = 0
  %".11" = alloca i32, align 4
  store i32 0, i32* %".11", align 4
  ; INT b = 0
  %".14" = alloca i32, align 4
  store i32 0, i32* %".14", align 4
  ; INT c = 0
  %".17" = alloca i32, align 4
  store i32 0, i32* %".17", align 4
  ; INT d = 0
  %".20" = alloca i32, align 4
  store i32 0, i32* %".20", align 4
  ; INT e = 0
  %".23" = alloca i32, align 4
  store i32 0, i32* %".23", align 4
  ; INT f = 0
  %".26" = alloca i32, align 4
  store i32 0, i32* %".26", align 4
  ; INT g = 0
  %".29" = alloca i32, align 4
  store i32 0, i32* %".29", align 4
  ; INT h = 0
  store i32 1, i32* %".23", align 4
  ; f = ! a || e && d && 5 < 6
  %".34" = load i32, i32* %".23", align 4
  ; printf "%d" , f
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".34", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %".41" = load i32, i32* %".8", align 4
  ; g = a < d && e >= b
  %".43" = load i32, i32* %".17", align 4
  %".44" = icmp slt i32 %".41", %".43"
  br i1 %".44", label %".3", label %".4"
.3:
  %".46" = load i32, i32* %".20", align 4
  %".47" = icmp sge i32 %".46", 0
  br label %".4"
.4:
  %".49" = phi  i1 [%".47", %".3"], [0, %".2"]
  %".50" = zext i1 %".49" to i32
  store i32 %".50", i32* %".26", align 4
  %".52" = load i32, i32* %".26", align 4
  ; printf "%d" , g
  %".54" = bitcast [3 x i8]* @".str.d" to i8*
  %".55" = alloca i32
  store i32 %".52", i32* %".55"
  %".57" = load i32, i32* %".55"
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".57")
  %".59" = load i32, i32* %".8", align 4
  ; h = a - b < d && ! e > g
  %".61" = load i32, i32* %".11", align 4
  %".62" = sub i32 %".59", %".61"
  %".63" = load i32, i32* %".17", align 4
  %".64" = icmp slt i32 %".62", %".63"
  br i1 %".64", label %".5", label %".6"
.5:
  %".66" = load i32, i32* %".20", align 4
  %".67" = load i32, i32* %".26", align 4
  %".68" = icmp sgt i32 %".66", %".67"
  %".69" = icmp ne i1 %".68", 0
  %".70" = xor i1 %".69", 1
  br label %".6"
.6:
  %".72" = phi  i1 [%".70", %".5"], [0, %".4"]
  %".73" = zext i1 %".72" to i32
  store i32 %".73", i32* %".29", align 4
  %".75" = load i32, i32* %".29", align 4
  ; printf "%d" , h
  %".77" = bitcast [3 x i8]* @".str.d" to i8*
  %".78" = alloca i32
  store i32 %".75", i32* %".78"
  %".80" = load i32, i32* %".78"
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".77", i32 %".80")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"