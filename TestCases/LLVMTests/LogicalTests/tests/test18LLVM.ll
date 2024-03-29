; ModuleID = "tests/test18.c"
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
  %".21" = alloca i32, align 4
  store i32 0, i32* %".21", align 4
  ; INT g = 0
  %".24" = alloca i32, align 4
  store i32 0, i32* %".24", align 4
  ; INT h = 0
  store i32 1, i32* %".18", align 4
  ; f = ! a || e && d && 5 < 6
  %".29" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".31" = bitcast [3 x i8]* @".str.d" to i8*
  %".32" = alloca i32
  store i32 %".29", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".36" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".38" = load i32, i32* %".12", align 4
  %".39" = icmp slt i32 %".36", %".38"
  br i1 %".39", label %".40", label %".43"
.40:
  %".41" = load i32, i32* %".15", align 4
  %".42" = icmp sge i32 %".41", 0
  br label %".43"
.43:
  %".46" = phi  i1 [%".42", %".40"], [0, %".2"]
  %".47" = zext i1 %".46" to i32
  store i32 %".47", i32* %".21", align 4
  %".49" = load i32, i32* %".21", align 4
  ; printf " %d " , g
  %".51" = bitcast [3 x i8]* @".str.d" to i8*
  %".52" = alloca i32
  store i32 %".49", i32* %".52"
  %".54" = load i32, i32* %".52"
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".54")
  %".56" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".58" = load i32, i32* %".6", align 4
  %".59" = sub i32 %".56", %".58"
  %".60" = load i32, i32* %".12", align 4
  %".61" = icmp slt i32 %".59", %".60"
  br i1 %".61", label %".62", label %".68"
.62:
  %".63" = load i32, i32* %".15", align 4
  %".64" = load i32, i32* %".21", align 4
  %".65" = icmp sgt i32 %".63", %".64"
  %".66" = icmp ne i1 %".65", 0
  %".67" = xor i1 %".66", 1
  br label %".68"
.68:
  %".71" = phi  i1 [%".67", %".62"], [0, %".43"]
  %".72" = zext i1 %".71" to i32
  store i32 %".72", i32* %".24", align 4
  %".74" = load i32, i32* %".24", align 4
  ; printf " %d " , h
  %".76" = bitcast [3 x i8]* @".str.d" to i8*
  %".77" = alloca i32
  store i32 %".74", i32* %".77"
  %".79" = load i32, i32* %".77"
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 %".79")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"