; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT a = 1
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT b = 1
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  ;  if a || b
  %".15" = load i32, i32* %".4", align 4
  %".16" = icmp ne i32 %".15", 0
  br i1 %".16", label %".20", label %".17"
.17:
  %".18" = load i32, i32* %".7", align 4
  %".19" = icmp ne i32 %".18", 0
  br label %".20"
.20:
  %".21" = phi  i1 [%".19", %".17"], [1, %".2"]
  br i1 %".21", label %".22", label %".29"
.22:
  %".23" = bitcast [3 x i8]* @".str.d" to i8*
  %".24" = alloca i32
  store i32 1, i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  ; printf "%d" 1
  br label %".29"
.29:
  store i32 1, i32* %".4", align 4
  ;   a = 1
  store i32 0, i32* %".7", align 4
  ; b = 0
  ;  if a || b
  %".35" = load i32, i32* %".4", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".40", label %".37"
.37:
  %".38" = load i32, i32* %".7", align 4
  %".39" = icmp ne i32 %".38", 0
  br label %".40"
.40:
  %".41" = phi  i1 [1, %".29"], [%".39", %".37"]
  br i1 %".41", label %".42", label %".49"
.42:
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 1, i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ; printf "%d" 1
  br label %".49"
.49:
  store i32 0, i32* %".4", align 4
  ;   a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  ;  if a || b
  %".55" = load i32, i32* %".4", align 4
  %".56" = icmp ne i32 %".55", 0
  br i1 %".56", label %".60", label %".57"
.57:
  %".58" = load i32, i32* %".7", align 4
  %".59" = icmp ne i32 %".58", 0
  br label %".60"
.60:
  %".61" = phi  i1 [1, %".49"], [%".59", %".57"]
  br i1 %".61", label %".62", label %".69"
.62:
  %".63" = bitcast [3 x i8]* @".str.d" to i8*
  %".64" = alloca i32
  store i32 1, i32* %".64"
  %".66" = load i32, i32* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".66")
  ; printf "%d" 1
  br label %".69"
.69:
  store i32 0, i32* %".4", align 4
  ;   a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  ;  if a || b
  %".75" = load i32, i32* %".4", align 4
  %".76" = icmp ne i32 %".75", 0
  br i1 %".76", label %".80", label %".77"
.77:
  %".78" = load i32, i32* %".7", align 4
  %".79" = icmp ne i32 %".78", 0
  br label %".80"
.80:
  %".81" = phi  i1 [1, %".69"], [%".79", %".77"]
  br i1 %".81", label %".82", label %".89"
.82:
  %".83" = bitcast [3 x i8]* @".str.d" to i8*
  %".84" = alloca i32
  store i32 1, i32* %".84"
  %".86" = load i32, i32* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".86")
  ; printf "%d" 1
  br label %".89"
.89:
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"