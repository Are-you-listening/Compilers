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
  ;  if x == 5 && 1
  %".37" = load i32, i32* %".4", align 4
  %".38" = icmp eq i32 %".37", 5
  %".39" = icmp ne i1 %".38", 0
  br i1 %".39", label %".40", label %".59"
.40:
  %".41" = load i32, i32* %".4", align 4
  ; if x != 4
  %".43" = icmp ne i32 %".41", 4
  br i1 %".43", label %".44", label %".51"
.44:
  %".45" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".46" = alloca i32
  store i32 4, i32* %".46"
  %".48" = load i32, i32* %".46"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  ; printf "%d" 4
  br label %".58"
.51:
  %".52" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".53" = alloca i32
  store i32 5, i32* %".53"
  %".55" = load i32, i32* %".53"
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".55")
  ; else if 1 printf "%d" 5
  br label %".58"
.58:
  br label %".59"
.59:
  %".60" = load i32, i32* %".4", align 4
  ;   if x < 5
  %".62" = icmp slt i32 %".60", 5
  br i1 %".62", label %".63", label %".65"
.63:
  ; else
  br label %".67"
.65:
  ;
  br label %".67"
.67:
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"