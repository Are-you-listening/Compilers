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
  ; printf "%d" f
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
  %".44" = phi  i1 [0, %".2"], [%".42", %".40"]
  %".45" = zext i1 %".44" to i32
  store i32 %".45", i32* %".21", align 4
  %".47" = load i32, i32* %".21", align 4
  ; printf "%d" g
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 %".47", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  %".54" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".56" = load i32, i32* %".6", align 4
  %".57" = sub i32 %".54", %".56"
  %".58" = load i32, i32* %".12", align 4
  %".59" = icmp slt i32 %".57", %".58"
  br i1 %".59", label %".60", label %".66"
.60:
  %".61" = load i32, i32* %".15", align 4
  %".62" = load i32, i32* %".21", align 4
  %".63" = icmp sgt i32 %".61", %".62"
  %".64" = icmp ne i1 %".63", 0
  %".65" = xor i1 %".64", 1
  br label %".66"
.66:
  %".67" = phi  i1 [0, %".43"], [%".65", %".60"]
  %".68" = zext i1 %".67" to i32
  store i32 %".68", i32* %".24", align 4
  %".70" = load i32, i32* %".24", align 4
  ; printf "%d" h
  %".72" = bitcast [3 x i8]* @".str.d" to i8*
  %".73" = alloca i32
  store i32 %".70", i32* %".73"
  %".75" = load i32, i32* %".73"
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %".75")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"