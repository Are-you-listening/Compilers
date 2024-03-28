; ModuleID = "example_source_files/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 50, i32* %".3", align 4
  ; INT x = 50
  %".6" = alloca i32, align 4
  store i32 -22, i32* %".6", align 4
  ; INT y = - 22
  %".9" = alloca i32, align 4
  store i32 6, i32* %".9", align 4
  ; INT z = 6
  %".12" = load i32, i32* %".3", align 4
  ; INT a = x && y || z && ! x
  %".14" = icmp ne i32 %".12", 0
  %".15" = xor i1 %".14", 1
  %".16" = icmp ne i1 %".15", 0
  %".17" = zext i1 %".16" to i32
  %".18" = alloca i32, align 4
  store i32 %".17", i32* %".18", align 4
  %".20" = alloca i32, align 4
  store i32 6, i32* %".20", align 4
  ; INT b = 6
  %".23" = alloca i32, align 4
  store i32 4, i32* %".23", align 4
  ; INT c = 4
  %".26" = alloca i32, align 4
  store i32 3, i32* %".26", align 4
  ; INT d = 3
  %".29" = load i32, i32* %".26", align 4
  ; INT e = d & c | d
  %".31" = or i32 0, %".29"
  %".32" = alloca i32, align 4
  store i32 %".31", i32* %".32", align 4
  %".34" = load i32, i32* %".32", align 4
  ; printf " %d " , e
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".34", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %".41" = load i32, i32* %".3", align 4
  ; printf " %d " , x
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 %".41", i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ; printf " %d " , e = e ^ d
  %".49" = load i32, i32* %".6", align 4
  ; printf " %d " , y
  %".51" = bitcast [3 x i8]* @".str.d" to i8*
  %".52" = alloca i32
  store i32 %".49", i32* %".52"
  %".54" = load i32, i32* %".52"
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".54")
  %".56" = load i32, i32* %".9", align 4
  ; printf " %d " , z
  %".58" = bitcast [3 x i8]* @".str.d" to i8*
  %".59" = alloca i32
  store i32 %".56", i32* %".59"
  %".61" = load i32, i32* %".59"
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %".61")
  %".63" = load i32, i32* %".3", align 4
  %".64" = icmp ne i32 %".63", 0
  %".65" = xor i1 %".64", 1
  %".66" = icmp ne i1 %".65", 0
  %".67" = zext i1 %".66" to i32
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 %".67", i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  ; printf " %d " , a
  %".74" = bitcast [3 x i8]* @".str.d" to i8*
  %".75" = alloca i32
  store i32 6, i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  ; printf " %d " , b
  %".80" = load i32, i32* %".23", align 4
  ; printf " %d " , c
  %".82" = bitcast [3 x i8]* @".str.d" to i8*
  %".83" = alloca i32
  store i32 %".80", i32* %".83"
  %".85" = load i32, i32* %".83"
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %".85")
  %".87" = load i32, i32* %".26", align 4
  ; printf " %d " , d
  %".89" = bitcast [3 x i8]* @".str.d" to i8*
  %".90" = alloca i32
  store i32 %".87", i32* %".90"
  %".92" = load i32, i32* %".90"
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".89", i32 %".92")
  %".94" = load i32, i32* %".32", align 4
  ; printf " %d " , e
  %".96" = bitcast [3 x i8]* @".str.d" to i8*
  %".97" = alloca i32
  store i32 %".94", i32* %".97"
  %".99" = load i32, i32* %".97"
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".96", i32 %".99")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"