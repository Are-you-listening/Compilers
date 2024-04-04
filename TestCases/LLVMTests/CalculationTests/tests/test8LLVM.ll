; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -55, i32* %".3", align 4
  ; INT number = - 55
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT a = 1
  %".9" = load i32, i32* %".3", align 4
  ; a = number ++
  %".11" = add i32 %".9", 1
  store i32 %".11", i32* %".3", align 4
  store i32 %".9", i32* %".6", align 4
  %".14" = load i32, i32* %".6", align 4
  ; printf "%d" , a
  %".16" = bitcast [3 x i8]* @".str.d" to i8*
  %".17" = alloca i32
  store i32 %".14", i32* %".17"
  %".19" = load i32, i32* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".19")
  %".21" = load i32, i32* %".3", align 4
  ; printf "%d" , number
  %".23" = bitcast [3 x i8]* @".str.d" to i8*
  %".24" = alloca i32
  store i32 %".21", i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  %".28" = load i32, i32* %".3", align 4
  ; number = number ++
  %".30" = add i32 %".28", 1
  store i32 %".30", i32* %".3", align 4
  store i32 %".28", i32* %".3", align 4
  %".33" = load i32, i32* %".3", align 4
  ; printf "%d" , number
  %".35" = bitcast [3 x i8]* @".str.d" to i8*
  %".36" = alloca i32
  store i32 %".33", i32* %".36"
  %".38" = load i32, i32* %".36"
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  %".40" = load i32, i32* %".3", align 4
  ; INT n = number ++
  %".42" = add i32 %".40", 1
  store i32 %".42", i32* %".3", align 4
  %".44" = alloca i32, align 4
  store i32 %".40", i32* %".44", align 4
  %".46" = load i32, i32* %".3", align 4
  ; printf "%d" , number
  %".48" = bitcast [3 x i8]* @".str.d" to i8*
  %".49" = alloca i32
  store i32 %".46", i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  %".53" = load i32, i32* %".44", align 4
  ; printf "%d" , n
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  %".60" = load i32, i32* %".44", align 4
  ; a = ++ n
  %".62" = add i32 %".60", 1
  store i32 %".62", i32* %".44", align 4
  store i32 %".62", i32* %".6", align 4
  %".65" = load i32, i32* %".6", align 4
  ; printf "%d" , a
  %".67" = bitcast [3 x i8]* @".str.d" to i8*
  %".68" = alloca i32
  store i32 %".65", i32* %".68"
  %".70" = load i32, i32* %".68"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
  %".72" = load i32, i32* %".44", align 4
  ; printf "%d" , n
  %".74" = bitcast [3 x i8]* @".str.d" to i8*
  %".75" = alloca i32
  store i32 %".72", i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"