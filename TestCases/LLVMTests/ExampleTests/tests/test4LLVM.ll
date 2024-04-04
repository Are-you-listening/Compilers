; ModuleID = "tests/test4.c"
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
  ; printf "%d" , e
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".34", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %".41" = load i32, i32* %".32", align 4
  ; printf "%d" , e ^ d
  %".43" = load i32, i32* %".26", align 4
  %".44" = xor i32 %".41", %".43"
  %".45" = bitcast [3 x i8]* @".str.d" to i8*
  %".46" = alloca i32
  store i32 %".44", i32* %".46"
  %".48" = load i32, i32* %".46"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  %".50" = load i32, i32* %".32", align 4
  ; printf "%d" , ~ e
  %".52" = xor i32 %".50", -1
  %".53" = bitcast [3 x i8]* @".str.d" to i8*
  %".54" = alloca i32
  store i32 %".52", i32* %".54"
  %".56" = load i32, i32* %".54"
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %".56")
  %".58" = load i32, i32* %".3", align 4
  ; printf "%d" , x
  %".60" = bitcast [3 x i8]* @".str.d" to i8*
  %".61" = alloca i32
  store i32 %".58", i32* %".61"
  %".63" = load i32, i32* %".61"
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %".63")
  %".65" = load i32, i32* %".6", align 4
  ; printf "%d" , y
  %".67" = bitcast [3 x i8]* @".str.d" to i8*
  %".68" = alloca i32
  store i32 %".65", i32* %".68"
  %".70" = load i32, i32* %".68"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
  %".72" = load i32, i32* %".9", align 4
  ; printf "%d" , z
  %".74" = bitcast [3 x i8]* @".str.d" to i8*
  %".75" = alloca i32
  store i32 %".72", i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  %".79" = load i32, i32* %".3", align 4
  %".80" = icmp ne i32 %".79", 0
  %".81" = xor i1 %".80", 1
  %".82" = icmp ne i1 %".81", 0
  %".83" = zext i1 %".82" to i32
  %".84" = bitcast [3 x i8]* @".str.d" to i8*
  %".85" = alloca i32
  store i32 %".83", i32* %".85"
  %".87" = load i32, i32* %".85"
  %".88" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %".87")
  ; printf "%d" , a
  %".90" = bitcast [3 x i8]* @".str.d" to i8*
  %".91" = alloca i32
  store i32 6, i32* %".91"
  %".93" = load i32, i32* %".91"
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 %".93")
  ; printf "%d" , b
  %".96" = load i32, i32* %".23", align 4
  ; printf "%d" , c
  %".98" = bitcast [3 x i8]* @".str.d" to i8*
  %".99" = alloca i32
  store i32 %".96", i32* %".99"
  %".101" = load i32, i32* %".99"
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %".101")
  %".103" = load i32, i32* %".26", align 4
  ; printf "%d" , d
  %".105" = bitcast [3 x i8]* @".str.d" to i8*
  %".106" = alloca i32
  store i32 %".103", i32* %".106"
  %".108" = load i32, i32* %".106"
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".105", i32 %".108")
  %".110" = load i32, i32* %".32", align 4
  ; printf "%d" , e
  %".112" = bitcast [3 x i8]* @".str.d" to i8*
  %".113" = alloca i32
  store i32 %".110", i32* %".113"
  %".115" = load i32, i32* %".113"
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".112", i32 %".115")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"