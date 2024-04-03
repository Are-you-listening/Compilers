; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT b = 0
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT c = 0
  %".12" = alloca i32, align 4
  store i32 0, i32* %".12", align 4
  ; INT d = 0
  %".15" = alloca i32, align 4
  store i32 0, i32* %".15", align 4
  ; INT e = 0
  %".18" = alloca i32, align 4
  store i32 0, i32* %".18", align 4
  ; INT f = 0
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 0, i32* %".9", align 4
  ; c = 0
  store i32 0, i32* %".12", align 4
  ; d = 0
  store i32 0, i32* %".15", align 4
  ; e = 0
  %".31" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".33" = icmp ne i32 %".31", 0
  br i1 %".33", label %".34", label %".40"
.34:
  %".35" = load i32, i32* %".6", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".40", label %".37"
.37:
  %".38" = load i32, i32* %".9", align 4
  %".39" = icmp ne i32 %".38", 0
  %".43" = xor i1 %".39", 1
  br label %".40"
.40:
  %".45" = phi  i1 [0, %".2"], [%".43", %".37"], [0, %".34"]
  %".46" = zext i1 %".45" to i32
  store i32 %".46", i32* %".18", align 4
  %".48" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".50" = bitcast [3 x i8]* @".str.d" to i8*
  %".51" = alloca i32
  store i32 %".48", i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".57" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".59" = icmp ne i32 %".57", 0
  br i1 %".59", label %".60", label %".66"
.60:
  %".61" = load i32, i32* %".6", align 4
  %".62" = icmp ne i32 %".61", 0
  br i1 %".62", label %".66", label %".63"
.63:
  %".64" = load i32, i32* %".9", align 4
  %".65" = icmp ne i32 %".64", 0
  %".69" = xor i1 %".65", 1
  br label %".66"
.66:
  %".71" = phi  i1 [%".69", %".63"], [0, %".60"], [0, %".40"]
  %".72" = zext i1 %".71" to i32
  store i32 %".72", i32* %".18", align 4
  %".74" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".76" = bitcast [3 x i8]* @".str.d" to i8*
  %".77" = alloca i32
  store i32 %".74", i32* %".77"
  %".79" = load i32, i32* %".77"
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 %".79")
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".83" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".85" = icmp ne i32 %".83", 0
  br i1 %".85", label %".86", label %".92"
.86:
  %".87" = load i32, i32* %".6", align 4
  %".88" = icmp ne i32 %".87", 0
  br i1 %".88", label %".92", label %".89"
.89:
  %".90" = load i32, i32* %".9", align 4
  %".91" = icmp ne i32 %".90", 0
  %".95" = xor i1 %".91", 1
  br label %".92"
.92:
  %".97" = phi  i1 [0, %".66"], [0, %".86"], [%".95", %".89"]
  %".98" = zext i1 %".97" to i32
  store i32 %".98", i32* %".18", align 4
  %".100" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".102" = bitcast [3 x i8]* @".str.d" to i8*
  %".103" = alloca i32
  store i32 %".100", i32* %".103"
  %".105" = load i32, i32* %".103"
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %".105")
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".109" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".111" = icmp ne i32 %".109", 0
  br i1 %".111", label %".112", label %".118"
.112:
  %".113" = load i32, i32* %".6", align 4
  %".114" = icmp ne i32 %".113", 0
  br i1 %".114", label %".118", label %".115"
.115:
  %".116" = load i32, i32* %".9", align 4
  %".117" = icmp ne i32 %".116", 0
  %".121" = xor i1 %".117", 1
  br label %".118"
.118:
  %".123" = phi  i1 [0, %".112"], [0, %".92"], [%".121", %".115"]
  %".124" = zext i1 %".123" to i32
  store i32 %".124", i32* %".18", align 4
  %".126" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".128" = bitcast [3 x i8]* @".str.d" to i8*
  %".129" = alloca i32
  store i32 %".126", i32* %".129"
  %".131" = load i32, i32* %".129"
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".128", i32 %".131")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"