; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = load i32, i32* %".4", align 4
  ; if x < 5
  %".9" = icmp slt i32 %".7", 5
  br i1 %".9", label %".10", label %".17"
.10:
  %".11" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".12" = alloca i32
  store i32 1, i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ; printf "%d" 1
  br label %".17"
.17:
  %".18" = load i32, i32* %".4", align 4
  ;  if x >= 5
  %".20" = icmp sge i32 %".18", 5
  br i1 %".20", label %".21", label %".28"
.21:
  %".22" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".23" = alloca i32
  store i32 2, i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  ; printf "%d" 2
  br label %".35"
.28:
  %".29" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".30" = alloca i32
  store i32 3, i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ; else printf "%d" 3
  br label %".35"
.35:
  %".36" = load i32, i32* %".4", align 4
  ;  if x == 5 && 1
  %".38" = icmp eq i32 %".36", 5
  br i1 %".38", label %".39", label %".58"
.39:
  %".40" = load i32, i32* %".4", align 4
  ; if x != 4
  %".42" = icmp ne i32 %".40", 4
  br i1 %".42", label %".43", label %".50"
.43:
  %".44" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".45" = alloca i32
  store i32 4, i32* %".45"
  %".47" = load i32, i32* %".45"
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".47")
  ; printf "%d" 4
  br label %".57"
.50:
  %".51" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".52" = alloca i32
  store i32 5, i32* %".52"
  %".54" = load i32, i32* %".52"
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".54")
  ; else if 1 printf "%d" 5
  br label %".57"
.57:
  br label %".58"
.58:
  %".59" = load i32, i32* %".4", align 4
  ;   if x < 5
  %".61" = icmp slt i32 %".59", 5
  br i1 %".61", label %".62", label %".64"
.62:
  ; else
  br label %".66"
.64:
  ;
  br label %".66"
.66:
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"