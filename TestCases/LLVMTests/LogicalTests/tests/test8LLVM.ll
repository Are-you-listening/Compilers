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
  br i1 %".33", label %".34", label %".41"
.34:
  %".35" = load i32, i32* %".6", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".41", label %".37"
.37:
  %".38" = load i32, i32* %".9", align 4
  %".39" = icmp ne i32 %".38", 0
  %".40" = xor i1 %".39", 1
  br label %".41"
.41:
  %".42" = phi  i1 [0, %".2"], [0, %".34"], [%".40", %".37"]
  %".43" = zext i1 %".42" to i32
  store i32 %".43", i32* %".18", align 4
  %".45" = load i32, i32* %".18", align 4
  ; printf "%d" f
  %".47" = bitcast [3 x i8]* @".str.d" to i8*
  %".48" = alloca i32
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".54" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".56" = icmp ne i32 %".54", 0
  br i1 %".56", label %".57", label %".64"
.57:
  %".58" = load i32, i32* %".6", align 4
  %".59" = icmp ne i32 %".58", 0
  br i1 %".59", label %".64", label %".60"
.60:
  %".61" = load i32, i32* %".9", align 4
  %".62" = icmp ne i32 %".61", 0
  %".63" = xor i1 %".62", 1
  br label %".64"
.64:
  %".65" = phi  i1 [0, %".41"], [0, %".57"], [%".63", %".60"]
  %".66" = zext i1 %".65" to i32
  store i32 %".66", i32* %".18", align 4
  %".68" = load i32, i32* %".18", align 4
  ; printf "%d" f
  %".70" = bitcast [3 x i8]* @".str.d" to i8*
  %".71" = alloca i32
  store i32 %".68", i32* %".71"
  %".73" = load i32, i32* %".71"
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %".73")
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".77" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".79" = icmp ne i32 %".77", 0
  br i1 %".79", label %".80", label %".87"
.80:
  %".81" = load i32, i32* %".6", align 4
  %".82" = icmp ne i32 %".81", 0
  br i1 %".82", label %".87", label %".83"
.83:
  %".84" = load i32, i32* %".9", align 4
  %".85" = icmp ne i32 %".84", 0
  %".86" = xor i1 %".85", 1
  br label %".87"
.87:
  %".88" = phi  i1 [0, %".64"], [0, %".80"], [%".86", %".83"]
  %".89" = zext i1 %".88" to i32
  store i32 %".89", i32* %".18", align 4
  %".91" = load i32, i32* %".18", align 4
  ; printf "%d" f
  %".93" = bitcast [3 x i8]* @".str.d" to i8*
  %".94" = alloca i32
  store i32 %".91", i32* %".94"
  %".96" = load i32, i32* %".94"
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".93", i32 %".96")
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".100" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".102" = icmp ne i32 %".100", 0
  br i1 %".102", label %".103", label %".110"
.103:
  %".104" = load i32, i32* %".6", align 4
  %".105" = icmp ne i32 %".104", 0
  br i1 %".105", label %".110", label %".106"
.106:
  %".107" = load i32, i32* %".9", align 4
  %".108" = icmp ne i32 %".107", 0
  %".109" = xor i1 %".108", 1
  br label %".110"
.110:
  %".111" = phi  i1 [0, %".103"], [%".109", %".106"], [0, %".87"]
  %".112" = zext i1 %".111" to i32
  store i32 %".112", i32* %".18", align 4
  %".114" = load i32, i32* %".18", align 4
  ; printf "%d" f
  %".116" = bitcast [3 x i8]* @".str.d" to i8*
  %".117" = alloca i32
  store i32 %".114", i32* %".117"
  %".119" = load i32, i32* %".117"
  %".120" = call i32 (i8*, ...) @"printf"(i8* %".116", i32 %".119")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"