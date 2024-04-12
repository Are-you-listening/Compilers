; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".13" = load i32, i32* %".3", align 4
  ; if a && b
  %".15" = icmp ne i32 %".13", 0
  br i1 %".15", label %".16", label %".19"
.16:
  %".17" = load i32, i32* %".6", align 4
  %".18" = icmp ne i32 %".17", 0
  br label %".19"
.19:
  %".20" = phi  i1 [%".18", %".16"], [0, %".2"]
  br i1 %".20", label %".21", label %".28"
.21:
  %".22" = bitcast [3 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  store i32 1, i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  ; printf "%d" 1
  br label %".28"
.28:
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".33" = load i32, i32* %".3", align 4
  ; if a && b
  %".35" = icmp ne i32 %".33", 0
  br i1 %".35", label %".36", label %".39"
.36:
  %".37" = load i32, i32* %".6", align 4
  %".38" = icmp ne i32 %".37", 0
  br label %".39"
.39:
  %".40" = phi  i1 [0, %".28"], [%".38", %".36"]
  br i1 %".40", label %".41", label %".48"
.41:
  %".42" = bitcast [3 x i8]* @".str.d" to i8*
  %".43" = alloca i32
  store i32 1, i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ; printf "%d" 1
  br label %".48"
.48:
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".53" = load i32, i32* %".3", align 4
  ; if a && b
  %".55" = icmp ne i32 %".53", 0
  br i1 %".55", label %".56", label %".59"
.56:
  %".57" = load i32, i32* %".6", align 4
  %".58" = icmp ne i32 %".57", 0
  br label %".59"
.59:
  %".60" = phi  i1 [0, %".48"], [%".58", %".56"]
  br i1 %".60", label %".61", label %".68"
.61:
  %".62" = bitcast [3 x i8]* @".str.d" to i8*
  %".63" = alloca i32
  store i32 1, i32* %".63"
  %".65" = load i32, i32* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %".65")
  ; printf "%d" 1
  br label %".68"
.68:
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".73" = load i32, i32* %".3", align 4
  ; if a && b
  %".75" = icmp ne i32 %".73", 0
  br i1 %".75", label %".76", label %".79"
.76:
  %".77" = load i32, i32* %".6", align 4
  %".78" = icmp ne i32 %".77", 0
  br label %".79"
.79:
  %".80" = phi  i1 [0, %".68"], [%".78", %".76"]
  br i1 %".80", label %".81", label %".88"
.81:
  %".82" = bitcast [3 x i8]* @".str.d" to i8*
  %".83" = alloca i32
  store i32 1, i32* %".83"
  %".85" = load i32, i32* %".83"
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %".85")
  ; printf "%d" 1
  br label %".88"
.88:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"